import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  const ProjectEntity({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.image,
    required this.techStack,
    required this.isPublished,
    this.playStoreLink,
    this.appStoreLink,
  });

  factory ProjectEntity.fromMap(Map<String, dynamic> map) {
    return ProjectEntity(
      id: map['id'],
      name: map['name'],
      shortDescription: map['shortDescription'],
      fullDescription: map['fullDescription'],
      image: map['image'],
      techStack: List<String>.from(map['techStack'] ?? []),
      isPublished: map['isPublished'] ?? false,
      playStoreLink: map['playStoreLink'],
      appStoreLink: map['appStoreLink'],
    );
  }

  final String id;
  final String name;
  final String shortDescription;
  final String fullDescription;
  final String image;
  final List<String> techStack;
  final bool isPublished;
  final String? playStoreLink;
  final String? appStoreLink;

  ProjectEntity copyWith({
    String? id,
    String? name,
    String? shortDescription,
    String? fullDescription,
    String? image,
    List<String>? techStack,
    bool? isPublished,
    String? playStoreLink,
    String? appStoreLink,
  }) {
    return ProjectEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      shortDescription: shortDescription ?? this.shortDescription,
      fullDescription: fullDescription ?? this.fullDescription,
      image: image ?? this.image,
      techStack: techStack ?? this.techStack,
      isPublished: isPublished ?? this.isPublished,
      playStoreLink: playStoreLink ?? this.playStoreLink,
      appStoreLink: appStoreLink ?? this.appStoreLink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'shortDescription': shortDescription,
      'fullDescription': fullDescription,
      'image': image,
      'techStack': techStack,
      'isPublished': isPublished,
      'playStoreLink': playStoreLink,
      'appStoreLink': appStoreLink,
    };
  }

  @override
  String toString() => 'ProjectEntity{ id: $id, name: $name, '
      'shortDescription: $shortDescription, '
      'fullDescription: $fullDescription, '
      'image: $image, techStack: $techStack, isPublished: $isPublished,'
      ' playStoreLink: $playStoreLink, appStoreLink: $appStoreLink,}';

  @override
  List<Object?> get props => [
        id,
        name,
        shortDescription,
        fullDescription,
        image,
        techStack,
        isPublished,
        playStoreLink,
        appStoreLink,
      ];
}

List<ProjectEntity> projects = <ProjectEntity>[
  /// agilio pro
  const ProjectEntity(
    id: "agilio-pro",
    name: "Agilio Pro",
    shortDescription: "Developed Agilio Pro using Flutter with Firebase, "
        "Sqflite, and GoRouter. Built responsive UIs, integrated REST APIs, "
        "and enabled offline support for home service professionals.",
    fullDescription: "",
    image: "",
    techStack: [
      "Flutter",
      "BLoC Pattern",
      "BLoC",
      "Dio",
      "GoRouter",
      "Get It",
      "SQFLite",
      "Firebase Cloud Messaging",
      "Flutter Local Notifications",
      "Stripe",
      "Google Maps",
    ],
    isPublished: true,
    appStoreLink:
        "https://apps.apple.com/us/app/agilio-pro/id6741076168?l=zh-Hans-CN",
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.agilio_prolink&hl=en_US",
  ),

  /// Rgyan
  const ProjectEntity(
    id: "rgyan",
    name: "Rgyan – Spiritual Social Network",
    shortDescription: "A Flutter-based spiritual social media platform "
        "integrating live events, content feeds, and personalized "
        "spiritual tools with Firebase and REST APIs.",
    fullDescription: "",
    image: "",
    techStack: [
      "Flutter",
      "MVVM",
      "Provider",
      "Dio",
      "Amplify",
      "GoRouter",
      "Firebase Cloud Messaging",
      "Flutter Local Notifications",
      "PubNub",
      "Firebase Analytics",
      "Shared Preferences",
      "Better Player (Video Player)",
    ],
    isPublished: true,
    appStoreLink: "https://apps.apple.com/us/app/rgyan/id1619055739?uo=4",
    playStoreLink: "https://play.google.com/store/apps/details?id=rgyan.rgyan",
  ),

  /// IO Park
  const ProjectEntity(
    id: "io-park",
    name: "IO Park",
    shortDescription: "An IoT-integrated smart farming app built with Flutter, "
        "enabling real-time monitoring and control of agricultural "
        "equipment through cloud APIs and sensor data.",
    fullDescription: "",
    image:
        "https://framerusercontent.com/images/b9aXKkPelOfbpDdTmJIj2Gc6OHQ.png",
    techStack: [
      "Flutter",
      "Clean Architecture",
      "BLoC",
      "Dio",
      "Firebase",
      "Firebase Realtime Database / Cloud Firestore",
      "Firebase Cloud Functions",
      "Stripe",
      "Flutter Local Notifications",
      "Hive",
      "Flutter Blue Plus",
      "Beamer",
      "Flutter Test",
      "BLoC Test",
      "Mockito",
    ],
    isPublished: true,
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.openiotlabs.openiot&hl=en_IN",
  ),

  /// ziro
  const ProjectEntity(
    id: "ziro",
    name: "Ziro",
    shortDescription: "Developed Agilio Pro using Flutter with Firebase, "
        "Sqflite, and GoRouter. Built responsive UIs, integrated REST APIs, "
        "and enabled offline support for home service professionals.",
    fullDescription: "Agilio Pro is a mobile solution tailored for "
        "home service professionals to manage jobs, optimize schedules, "
        "and track performance. I developed responsive Flutter UIs, "
        "implemented scalable routing with GoRouter, and "
        "enabled offline support via Sqflite. I integrated Firebase "
        "for authentication and push notifications, and connected "
        "REST APIs to display real-time job and customer data. "
        "My work ensured a smooth, user-friendly experience while "
        "collaborating closely with backend and design teams. "
        "The app is now live and actively supporting technicians nationwide.",
    image:
        "https://framerusercontent.com/images/fqHyEfFR7zsgHYJotCOpYYG86o.png",
    techStack: [
      "Flutter",
      "Clean Architecture",
      "BLoC",
      "GoRouter",
      "Beamer",
      "Hive",
      "Firebase",
      "Cloud Firestore",
      "Firebase Realtime Database",
      "Firebase Cloud Functions",
      "Firebase Analytics",
      "Flutter Local Notifications",
      "Stripe",
    ],
    isPublished: false,
  ),

  /// NoFicción
  const ProjectEntity(
    id: "noficción",
    name: "NoFicción",
    shortDescription: "A premium video streaming app offering HBO’s "
        "exclusive content to Spanish audiences. I contributed to "
        "key features ensuring smooth UI/UX, offline viewing, "
        "and platform-specific enhancements.",
    fullDescription: "",
    image:
        "https://framerusercontent.com/images/8BgFdYiCPnMS70aeB3VlP2a5UoE.png",
    techStack: [
      "Flutter",
      "Clean Architecture",
      "BLoC",
      "Dio",
      "Hive",
      "Flutter Local Notifications",
      "Beamer",
    ],
    isPublished: true,
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.hbo.android.app",
    appStoreLink: "https://apps.apple.com/es/app/hbo-espa%C3%B1a/id571917630",
  ),

  /// Nandu
  const ProjectEntity(
    id: "nandu-app",
    name: "Nandu",
    shortDescription: "A feature-rich milk delivery and dairy management "
        "app built using Flutter, supporting role-based access, "
        "real-time tracking, and seamless order handling.",
    fullDescription: "",
    image: "",
    techStack: [
      "Flutter",
      "Dart",
      "BLoC",
      "Dio",
      "Get It",
      "Hive",
      "Firebase Messaging",
      "Flutter Local Notifications",
      "Razorpay",
      "Beamer",
      "YouTube Player",
    ],
    isPublished: true,
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.nandu.nandu_app&hl=en_IN",
  ),

  /// Patientifi
  const ProjectEntity(
    id: "patientifi",
    name: "Patientifi",
    shortDescription: "Patientifi – Find nearby doctors and clinics, "
        "book appointments instantly, and confirm your "
        "slot with a minimal payment.",
    fullDescription: "",
    image: "image",
    techStack: [
      "Flutter",
      "Dart",
      "BLoC",
      "Get It",
      "Dio",
      "Hive",
      "Firebase Messaging",
      "Flutter Local Notifications",
      "Go Router",
      "Razorpay",
      "YouTube Player",
    ],
    isPublished: false,
  ),
];

/*
1. Rgyan
2. Ziro // update description
3. ioPark // android link only
4. Noficcion // get the details
5. Galiani // no link
6. Nandu // has link
7. Patientifi
8. Agilio Pro //
*/
