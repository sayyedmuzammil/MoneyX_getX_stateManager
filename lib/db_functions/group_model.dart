
class GroupModel {
  int? totalAmount;

  String? category;

  GroupModel({
    required this.category,
    required this.totalAmount,
  });

  static GroupModel fromMap(Map<String, Object?> map) {
    // final id = map['id'] as int;
    final category = map['category'] as String;
    final totalAmount = map['tot_amount'] as int;

    return GroupModel(
      // id: id,
      category: category,
      totalAmount: totalAmount,
    );
  }
}
