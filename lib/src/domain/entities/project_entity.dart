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
    shortDescription: "shortDescription",
    fullDescription: "fullDescription",
    image:
        "https://framerusercontent.com/images/fqHyEfFR7zsgHYJotCOpYYG86o.png",
    techStack: const ["HTML", "CSS", "Python", "Flask"],
    isPublished: false,
  ),
  ProjectEntity(
    id: "2",
    name: "IO Park",
    shortDescription: "IOPark, open your garage from anywhere in the world",
    fullDescription: "fullDescription",
    image:
        "https://framerusercontent.com/images/b9aXKkPelOfbpDdTmJIj2Gc6OHQ.png",
    techStack: const [
      "React",
      "Express",
      "Discord.js",
      "Node.js",
      "HTML",
      "CSS",
      "Python",
      "Flask",
    ],
    isPublished: true,
  ),
  ProjectEntity(
    id: "3",
    name: "Noficcion",
    shortDescription: "Nonfiction, the sometimes imagined reality",
    fullDescription: "fullDescription",
    image:
        "https://framerusercontent.com/images/8BgFdYiCPnMS70aeB3VlP2a5UoE.png",
    techStack: const ["React", "Express", "Node.js"],
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
