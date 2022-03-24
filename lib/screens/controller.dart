// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, camel_case_types

import 'package:get/get.dart';
import 'package:money_management/db_functions/db_functions.dart';
import 'package:money_management/db_functions/listModel.dart';

final db_control = Get.put(Controller());
final dataControl = Get.put(getXcontrol());

class getXcontrol extends GetxController {
  Map<String, double> dataMap = {};
  late DateTime selectedDate = DateTime.now();
  var savingsOverall = 0.obs;
  var incomeTot = 0.obs;
  var expenseTot = 0.obs;
  var lendTot = 0.obs;
  var borrowTot = 0.obs;
  var savingsTot = 0.obs;
  var isAddorUpdate = false.obs;
  var isUpdateClicked = false;
  var favoriteVisible = false;
  var card = 0;
  var cardList = 0.obs;
  Map<String, Object?> selectedcontent = {};
  var addButton = false;
  var currentIndex = Rxn<int?>();
  bool percentInd = false;

  var selectedStartDate;
  var selectedEndDate;
  var startText;
  var endText;
  var DisplayDate = ''.obs;
  bool overall = false;
  var isClicked = false.obs;
  Future<void> pie_chart_controller(_card) async {
    dataMap={};
    favoriteVisible = false;
    addButton = false;
    percentInd = false;
    cardList.value = _card;
    percentInd = true;
    currentIndex.value = null;
    update();
  }

  Future<void> add_Button_controller(_card) async {
    // isAddorUpdate.value = true;
    card = _card;
    addButton = false;
    cardList.value = 0;
    isUpdateClicked = false;
    selectedcontent = {};
    update();
  }

  Future<void> navigation_control(_cardList) async {
    favoriteVisible = false;
    isUpdateClicked = false;
    cardList.value = _cardList;
    // addButton.value
    card = 0;
    percentInd = false;
    addButton = false;
    // isAddorUpdate.value = false;
    update();
  }
}
