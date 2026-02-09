import 'package:equatable/equatable.dart';

class TranslationVersionEntity extends Equatable {
  final String version;
  final DateTime updatedAt;
  final String? changelog; // Simple string changelog
  final String? minRequiredVersion;

  const TranslationVersionEntity({
    required this.version,
    required this.updatedAt,
    this.changelog,
    this.minRequiredVersion,
  });

  /// Compare versions (semantic versioning)
  /// Returns: 1 if this > other, -1 if this < other, 0 if equal
  int compareTo(TranslationVersionEntity other) {
    final thisParts = version.split('.').map(int.parse).toList();
    final otherParts = other.version.split('.').map(int.parse).toList();

    for (int i = 0; i < 3; i++) {
      final thisValue = i < thisParts.length ? thisParts[i] : 0;
      final otherValue = i < otherParts.length ? otherParts[i] : 0;

      if (thisValue > otherValue) return 1;
      if (thisValue < otherValue) return -1;
    }
    return 0;
  }

  bool isNewerThan(TranslationVersionEntity other) => compareTo(other) > 0;
  bool isOlderThan(TranslationVersionEntity other) => compareTo(other) < 0;
  bool isSameAs(TranslationVersionEntity other) => compareTo(other) == 0;

  @override
  List<Object?> get props => [version, updatedAt, changelog, minRequiredVersion];

  @override
  String toString() => 'TranslationVersion(v$version, updated: $updatedAt)';
}