import 'package:equatable/equatable.dart';

class SkillsEntity extends Equatable {
  const SkillsEntity({required this.title, required this.skills});

  factory SkillsEntity.fromMap(Map<String, dynamic> map) {
    return SkillsEntity(
      title: map['title'] as String,
      skills: map['skills'] as List<String>,
    );
  }
  final String title;
  final List<String> skills;

  SkillsEntity copyWith({String? title, List<String>? skills}) {
    return SkillsEntity(
      title: title ?? this.title,
      skills: skills ?? this.skills,
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'skills': skills};
  }

  @override
  String toString() => 'SkillsEntity{ title: $title, skills: $skills,}';

  @override
  List<Object> get props => [title, skills];
}

const List<SkillsEntity> skills = <SkillsEntity>[
  SkillsEntity(
    title: "Language & Framework",
    skills: ["Dart", "Flutter", "TypeScript"],
  ),
  SkillsEntity(
    title: "Architecture & Patterns",
    skills: [
      "Clean Architecture",
      "BLoC",
      "Cubit",
      "Provider",
      "MVVM",
      "Freezed",
    ],
  ),
  SkillsEntity(
    title: "Realtime & Networking",
    skills: [
      "Firebase Firestore",
      "Realtime Database",
      "Streams",
      "REST APIs",
      "WebSockets",
    ],
  ),
  SkillsEntity(
    title: "Database & Backend",
    skills: ["Firebase", "Supabase", "SQLite", "Firebase Cloud Functions"],
  ),
  SkillsEntity(
    title: "Testing",
    skills: ["Unit Tests", "Widget Tests", "Integration Tests", "BLoC Tests"],
  ),
  SkillsEntity(
    title: "Tools & DevOps",
    skills: ["Git", "GitHub", "GitLab", "Bitrise (CI/CD)"],
  ),
];
