// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:get/get.dart';
import 'package:money_management/db_functions/listModel.dart';
import 'package:money_management/controller.dart';
import 'package:sqflite/sqflite.dart';
import 'data_model.dart';

class Controller extends GetxController {
  late Database _db1;

  List<ListModel> simpleListNotifier = <ListModel>[].obs;

  Future<void> openDB() async {
    _db1 = await openDatabase('money.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE MoneyManage (id INTEGER PRIMARY KEY, category TEXT, item TEXT, date DATE, amount INTEGER, remark TEXT, favourite TEXT)');
    });
  }

  Future<dynamic> getFirstDate(overall, currentMonth) async {
    var FirstDate = overall == false
        ? await _db1.rawQuery(
            "SELECT date FROM MoneyManage WHERE (strftime('%m', date)='0$currentMonth') OR (strftime('%m', date)='$currentMonth') ORDER BY date ASC LIMIT 1 ")
        : await _db1.rawQuery(
            "SELECT date FROM MoneyManage ORDER BY date ASC LIMIT 1 ");
    return FirstDate;
  }

  Future<dynamic> getLastDate() async {
    var monthLastDate = await _db1
        .rawQuery("SELECT date FROM MoneyManage ORDER BY date DESC LIMIT 1");
    return monthLastDate;
  }

  Future<void> addMoney(MoneyModel value) async {
    value.id == null
        ? await _db1.rawInsert(
            'INSERT INTO MoneyManage(category,item,date,amount,remark,favourite) VALUES (?,?,?,?,?,?)',
            [
                value.category,
                value.item,
                value.date,
                value.amount,
                value.remark,
                value.favourite
              ])
        : await _db1.rawUpdate(
            'UPDATE MoneyManage SET item= "${value.item}", date="${value.date}",amount="${value.amount}", remark="${value.remark}", favourite="false" WHERE id="${value.id}"');
  }

// Future<void> SearchMoney(SearchedItem) async {
//   moneyListNotifier.value.clear();
//   final searched_item = await _db1.query('MoneyManage',
//       where: "item LIKE ?", whereArgs: ['%$SearchedItem%']);

//   searched_item.forEach((map) {
//     final Single_student = MoneyModel.fromMap(map);
//     moneyListNotifier.value.add(Single_student);
//     moneyListNotifier.notifyListeners();
//   });
// }

  Future<List<Map<String, Object?>>> getAllItems(
      {starDate, endDate, categoryList, favoriteVisible, overall}) async {
    final _values = favoriteVisible != true
        ? categoryList == null
            ? starDate == null && overall == true
                ? await _db1
                    .rawQuery('SELECT * FROM MoneyManage ORDER BY date desc')
                : await _db1.rawQuery(
                    "SELECT * FROM MoneyManage WHERE date BETWEEN '$starDate' AND '$endDate' ORDER BY date desc")
            : starDate == null && endDate == null && overall == true
                ? await _db1.rawQuery(
                    "SELECT * FROM MoneyManage WHERE category='$categoryList' ORDER BY date desc")
                : await _db1.rawQuery(
                    "SELECT * FROM MoneyManage WHERE (date BETWEEN '$starDate' AND '$endDate') AND category='$categoryList' ORDER BY date desc")
        : starDate != null && endDate != null
            ? await _db1.rawQuery(
                "SELECT * FROM MoneyManage WHERE favourite='true' AND date BETWEEN '$starDate' AND '$endDate' ORDER BY date desc ")
            : await _db1.rawQuery(
                "SELECT * FROM MoneyManage WHERE favourite='true' ORDER BY date desc");

    return _values;
  }

  Future<dynamic> GroupByCategory(
      {overall, startDate, endDate, Tsavings}) async {
    final values = overall == true || Tsavings == true
        ? await _db1.rawQuery(
            "SELECT  category, SUM(amount) tot_amount FROM MoneyManage GROUP BY category")
        : await _db1.rawQuery(
            "SELECT  category, SUM(amount) tot_amount FROM MoneyManage WHERE date BETWEEN '$startDate' AND '$endDate' GROUP BY category");

    return values;
  }

  Future<List<Map<String, Object?>>> PieChartValue(
      {category, startDate, endDate, overall}) async {
    final values = overall != true
        ? await _db1.rawQuery(
            "SELECT  DISTINCT(item) AS category, SUM(amount) tot_amount FROM MoneyManage WHERE category='$category' AND (date BETWEEN '$startDate' AND '$endDate') GROUP BY item ")
        : await _db1.rawQuery(
            "SELECT  DISTINCT(item) AS category, SUM(amount) tot_amount FROM MoneyManage WHERE category='$category' GROUP BY item ");
    return values;
  }

  Future<dynamic> ListForTextForm(_category) async {
    String currentMonth = DateTime.now().month.toString();

    final values = await _db1.rawQuery(
        "SELECT DISTINCT(item) AS data FROM MoneyManage WHERE category = '$_category' AND ((strftime('%m', date)='0$currentMonth') OR (strftime('%m', date)='$currentMonth')) ");
    if (values.isNotEmpty) {
      values.forEach((map) {
        final Single_item = ListModel.fromMap(map);
        simpleListNotifier.add(Single_item);
      });
    }
  }

  Future<void> deleteMoney(int id) async {
    await _db1.rawDelete('DELETE FROM MoneyManage WHERE id=$id');
    await getAllItems();
  }

  Future<void> AddtoFavorite(int id) async {
    final favorite =
        await _db1.rawQuery("SELECT favourite FROM MoneyManage WHERE id=$id");
    String fav = favorite[0]['favourite'].toString();
    fav == 'false'
        ? await _db1
            .rawUpdate("UPDATE MoneyManage SET favourite='true' WHERE id=$id")
        : fav == 'true'
            ? await _db1.rawUpdate(
                'UPDATE MoneyManage SET favourite="false" WHERE id=$id')
            : null;
    dataControl.update();
    return;
  }
}
