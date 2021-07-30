class Task {
  final int? id;
  final String? title;
  final String? description;
  const Task({
    this.id,
    this.title,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  // @override
  // String toString() {
  //   return 'Dog{id: $id, title: $title, description: $description}';
  // }
}
