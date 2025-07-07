'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "e92fa25f8505654d4a5d93916ca9f34d",
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
"main.dart.js": "5b556fad9f796a9c96229f8127643252",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "65d4f38cdbeba2e8b33861a74da78a09",
"icons/Icon-192.png": "7b8b0e19ddda0f6491c80a5edd3ff728",
"icons/Icon-maskable-192.png": "7b8b0e19ddda0f6491c80a5edd3ff728",
"icons/Icon-maskable-512.png": "c90f6bff4e39995f3afd7e6620fb4274",
"icons/Icon-512.png": "c90f6bff4e39995f3afd7e6620fb4274",
"manifest.json": "1c077ba3f5c8d090e2722e489c8e7a14",
"assets/AssetManifest.json": "ee41b103333886a95536772234070e52",
"assets/NOTICES": "e771aacc2b45471a515ef1e3312ca7c1",
"assets/FontManifest.json": "bafe749e3f3f6e5df77f64012f652a2a",
"assets/AssetManifest.bin.json": "dcf4f3a5986be180a752db63659fb7ad",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "2ef5fc0c882030ffbff44d7aaee5029a",
"assets/fonts/MaterialIcons-Regular.otf": "ab9fab4bb1366604925ff787222bd067",
"assets/assets/images/about_me.png": "81157a97ccddc99f7732aad69e3381fa",
"assets/assets/images/user.png": "d479c0f1248ba52bcd706de6f54202c7",
"assets/assets/icons/dots.svg": "fceba3df3785439002b6590401b75d2a",
"assets/assets/icons/android.svg": "7ab70495e651b65ddb825b6d7a590f8e",
"assets/assets/icons/github.svg": "a0eb2468440d988e84d2571d8225bab8",
"assets/assets/icons/drawer.svg": "811d0a0095a96c642e39db7c1b02cdbe",
"assets/assets/icons/instagram.svg": "4b332441e763ba3e708800b5e609cd50",
"assets/assets/icons/mail.svg": "49af6eaf183700316d5e77094821a79d",
"assets/assets/icons/logo_outline.svg": "49ad0d7db1e00f35781bbad12716e195",
"assets/assets/icons/double_quote.svg": "a3a56653acb8cd6160dc1179b5a43387",
"assets/assets/icons/youtube.svg": "887e31d426970a52b1921e2f6be7f129",
"assets/assets/icons/linkedin.svg": "464ab163ba2fe7e56b456d5e877c0719",
"assets/assets/icons/logo.svg": "b72726f703890fda26a643f20f262a17",
"assets/assets/icons/apple.svg": "5a726b9f0d45ffe58f6bfca1655682cf",
"assets/assets/fonts/FiraCode-Medium.ttf": "5b787767a4865ea8439fe08afb9ec810",
"assets/assets/fonts/FiraCode-Regular.ttf": "6c0e247027e8aafe474e53f07365969d",
"assets/assets/fonts/FiraCode-Bold.ttf": "86df85ace714fe95178a3f6e7445dd3e",
"assets/assets/fonts/FiraCode-SemiBold.ttf": "630243e176d08ebd30424f0a75e681da",
"assets/assets/fonts/FiraCode-Light.ttf": "b43359b05bd3b86593e7a68b8fffabbe",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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
