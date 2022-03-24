
// ignore_for_file: non_constant_identifier_names

class MoneyModel {
  int? id;

  String? category;

  String? item;

  String? date;

  int? amount;

  String? remark;

  String? favourite;

  MoneyModel({
    required this.category,
    required this.item,
    required this.date,
    required this.amount,
    this.remark,
    this.id,
    this.favourite,
  });

  static MoneyModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final Category = map['category'] as String;
    final Item = map['item'] as String;
    final Date = map['date'] as String;
    final Amount = map['amount'] as int;
    final Remark = map['remark'] as String;
    final Favourite = map['favourite'] as String;

    return MoneyModel(
      id: id,
      category: Category,
      item: Item,
      date: Date,
      amount: Amount,
      remark: Remark,
      favourite: Favourite,
    );
  }
}
