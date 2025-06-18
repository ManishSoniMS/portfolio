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
  String toString() =>
      'ProjectEntity{ id: $id, name: $name, '
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
  ProjectEntity(
    id: "1",
    name: "Ziro",
    shortDescription:
        "Developed Agilio Pro using Flutter with Firebase, "
        "Sqflite, and GoRouter. Built responsive UIs, integrated REST APIs, "
        "and enabled offline support for home service professionals.",
    fullDescription:
        "Agilio Pro is a mobile solution tailored for "
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
    techStack: const [
      "Flutter",
      "BLoC",
      "Clean Architecture",
      "Hive",
      "GoRouter",
      "Firebase",
      "Firebase Cloud Functions",
      "Firebase Realtime Database / Cloud Firestore",
      "Beamer",
      "Hive",
      "Flutter Local Notifications",
      "Stripe",
    ],
    isPublished: false,
  ),
  ProjectEntity(
    id: "2",
    name: "IO Park",
    shortDescription:
        "IOPark is a smart garage app that enables "
        "remote access, real-time door activity alerts, and secure "
        "digital key sharing for enhanced convenience and security.",
    fullDescription:
        "IOPark is a smart access app that transforms how "
        "users manage and monitor their garage doors. Key features include "
        "remote door control from anywhere, real-time activity alerts, "
        "and secure digital key sharing. Users can grant temporary or "
        "permanent access to delivery personnel or family members without "
        "the need for physical keys. The app enhances both convenience "
        "and security, redefining traditional garage access.",
    image:
        "https://framerusercontent.com/images/b9aXKkPelOfbpDdTmJIj2Gc6OHQ.png",
    techStack: const [
      "Flutter",
      "BLoC",
      "Clean Architecture",
      "Firebase",
      "Firebase Cloud Functions",
      "Firebase Realtime Database / Cloud Firestore",
      "Beamer",
      "Hive",
      "Flutter Local Notifications",
      "Stripe",
      "Dio",
      "Flutter Blue Plus",
      "Flutter Test",
      "BLoC Test",
      "Mockito",
    ],
    isPublished: true,
  ),
  ProjectEntity(
    id: "3",
    name: "NoFicción",
    shortDescription:
        "NoFicción is a VOD platform for Spanish-language "
        "documentaries, offering cross-device streaming on mobile and smart "
        "TVs with secure access and support for multiple business models.",
    fullDescription:
        "NoFicción – Latin American Documentary "
        "Streaming Platform\nNoFicción is a VOD streaming platform focused on "
        "Spanish-language documentaries and audiovisual content from "
        "Latin American creators. It was built to promote and support "
        "independent storytelling by offering feature-length and short films, "
        "many recognized at international film festivals.\n\n"
        "The platform supports multiple business models and delivers a secure, "
        "cross-device experience through mobile apps (iOS & Android) and "
        "Smart TV apps (Apple TV, Android TV, Roku, Amazon Fire TV). "
        "A key focus was ensuring a seamless, synchronized viewing "
        "experience across all supported devices.",
    image:
        "https://framerusercontent.com/images/8BgFdYiCPnMS70aeB3VlP2a5UoE.png",
    techStack: const [
      "Flutter",
      "BLoC",
      "Clean Architecture",
      "Dio",
      "Beamer",
      "Hive",
      "Flutter Local Notifications",
    ],
    isPublished: false,
  ),
  ProjectEntity(
    id: "4",
    name: "name",
    shortDescription: "shortDescription",
    fullDescription: "fullDescription",
    image: "image",
    techStack: const ["Flutter"],
    isPublished: false,
  ),
];

/*
1. Rgyan
2. Ziro
3. ioPark
4. Noficcion
5. Galiani
6. Nandu
7. Patientifi
8. Agilio Pro
*/
