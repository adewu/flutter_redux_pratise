class ListItem {
  final int id;
  final String content;

  ListItem({this.id, this.content});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'ListItem{id: $id, content: $content}';
  }
}