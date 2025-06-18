'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "8314976bdfe70de1068803bae0525805",
"version.json": "009c9e65172e010890f7f65fde438006",
"splash/img/light-2x.png": "1ace83f491e090904816ac4336f46c78",
"splash/img/dark-4x.png": "02bf889cb69b70029f30ace01980a596",
"splash/img/light-3x.png": "6aa3bd4e60d1bddcd9c2eabf037025dd",
"splash/img/dark-3x.png": "6aa3bd4e60d1bddcd9c2eabf037025dd",
"splash/img/light-4x.png": "02bf889cb69b70029f30ace01980a596",
"splash/img/dark-2x.png": "1ace83f491e090904816ac4336f46c78",
"splash/img/dark-1x.png": "43b5946f057ddb8a1b0c1c2c8aafb7eb",
"splash/img/light-1x.png": "43b5946f057ddb8a1b0c1c2c8aafb7eb",
"index.html": "5459940696e6a9d57d08d47c647741c8",
"/": "5459940696e6a9d57d08d47c647741c8",
"main.dart.js": "b1a967e8789f75b136c4194afb5241bb",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "65d4f38cdbeba2e8b33861a74da78a09",
"icons/Icon-192.png": "7b8b0e19ddda0f6491c80a5edd3ff728",
"icons/Icon-maskable-192.png": "7b8b0e19ddda0f6491c80a5edd3ff728",
"icons/Icon-maskable-512.png": "c90f6bff4e39995f3afd7e6620fb4274",
"icons/Icon-512.png": "c90f6bff4e39995f3afd7e6620fb4274",
"manifest.json": "1c077ba3f5c8d090e2722e489c8e7a14",
"assets/AssetManifest.json": "95f48651c139dfada196446beeb88102",
"assets/NOTICES": "6f21c020b536da29a0701e4c21d3694d",
"assets/FontManifest.json": "bafe749e3f3f6e5df77f64012f652a2a",
"assets/AssetManifest.bin.json": "1ee26336bc58e0d170d39b6dc2bdd642",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "a4767040daed852afdb2965cb3c36797",
"assets/fonts/MaterialIcons-Regular.otf": "ab9fab4bb1366604925ff787222bd067",
"assets/assets/images/about_me.png": "81157a97ccddc99f7732aad69e3381fa",
"assets/assets/images/user.png": "d479c0f1248ba52bcd706de6f54202c7",
"assets/assets/icons/dots.svg": "fceba3df3785439002b6590401b75d2a",
"assets/assets/icons/github.svg": "a0eb2468440d988e84d2571d8225bab8",
"assets/assets/icons/drawer.svg": "811d0a0095a96c642e39db7c1b02cdbe",
"assets/assets/icons/instagram.svg": "4b332441e763ba3e708800b5e609cd50",
"assets/assets/icons/mail.svg": "49af6eaf183700316d5e77094821a79d",
"assets/assets/icons/logo_outline.svg": "49ad0d7db1e00f35781bbad12716e195",
"assets/assets/icons/double_quote.svg": "a3a56653acb8cd6160dc1179b5a43387",
"assets/assets/icons/youtube.svg": "887e31d426970a52b1921e2f6be7f129",
"assets/assets/icons/linkedin.svg": "464ab163ba2fe7e56b456d5e877c0719",
"assets/assets/icons/logo.svg": "b72726f703890fda26a643f20f262a17",
"assets/assets/fonts/FiraCode-Medium.ttf": "5b787767a4865ea8439fe08afb9ec810",
"assets/assets/fonts/FiraCode-Regular.ttf": "6c0e247027e8aafe474e53f07365969d",
"assets/assets/fonts/FiraCode-Bold.ttf": "86df85ace714fe95178a3f6e7445dd3e",
"assets/assets/fonts/FiraCode-SemiBold.ttf": "630243e176d08ebd30424f0a75e681da",
"assets/assets/fonts/FiraCode-Light.ttf": "b43359b05bd3b86593e7a68b8fffabbe",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
