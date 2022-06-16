class Local {
  final bool isFirst;

  const Local({required this.isFirst});

  Map<String, dynamic> toMap() {
    return {
      'isFirst': isFirst,
    };
  }

  @override
  String toString() {
    return 'Local{isFirst: $isFirst}';
  }
}
