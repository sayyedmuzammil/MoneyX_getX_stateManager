// ignore_for_file: file_names

class ListModel {
  String? item;

  ListModel({
    this.item,
  });

  static ListModel fromMap(Map<String, Object?> map) {
    final items = map['data'] as String;
    return ListModel(
      item: items,
    );
  }
}
