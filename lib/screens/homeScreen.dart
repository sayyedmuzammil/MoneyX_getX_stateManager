// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, sized_box_for_whitespace, unnecessary_new, must_be_immutable, unrelated_type_equality_checks

import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:money_management/screens/controller.dart';
import 'package:money_management/widgets/add_button_widget.dart';
import 'package:money_management/widgets/bottom_navigation.dart';
import 'package:money_management/widgets/overall_inkwell_widget.dart';
import 'package:money_management/widgets/scroll_view_white_container.dart';
import '../ListView_option_Category.dart';
import '../home_widget_all.dart';
import '../main.dart';
import '../Add_or_Update_widget.dart';

class HomeScreen extends StatelessWidget {

  var dateRange;

   getPieChartValue(_card) async {
    final entireData = await db_control.PieChartValue(
        category: _card,
        startDate: dataControl.selectedStartDate,
        endDate: dataControl.selectedEndDate,
        overall: dataControl.overall);
    entireData.isNotEmpty ? setPie(entireData):null; 
  }
  void setPie(entireData) {
    for (var item in entireData) {
      String SingleItem = item['category'] as String;
      int SingleAmount = item['tot_amount'] as int;
      double Total = SingleAmount.toDouble();
      dataControl.dataMap[SingleItem] = Total;
         }
  }

  String? dropdownvalue;
  Map<int, String> monthsofYearsMap = {};

  var currentMonth = DateTime.now().month;
  var currentMonthText;

  late var monthLastDate;
  late var monthFirstDate;

  Future<void> getTotalSavings() async {
    print("mai rebuild");
    monthFirstDate =
        await db_control.getFirstDate(dataControl.overall, currentMonth);
    monthLastDate = await db_control.getLastDate();
    final List ls = monthFirstDate;

    if (ls.isNotEmpty) {
      dataControl.selectedStartDate = monthFirstDate[0]['date'].toString();
      dataControl.selectedEndDate = monthLastDate[0]['date'].toString();
    }

    currentMonthText = (DateFormat('MMM')
        .format(DateTime(0, int.parse('$currentMonth'.toString()))));
    final entireData = await db_control.GroupByCategory(Tsavings: true);
    final List la = entireData;
    if (la.isEmpty) {
      dataControl.savingsOverall.value = 0;

    } else {
      for (var i = 0; i < entireData.length; i++) {
        String item = entireData[i]['category'];
        if (item == '1') {
          dataControl.incomeTot.value = entireData[i]['tot_amount']!;
        }
        if (item == '2') {
          dataControl.expenseTot.value = entireData[i]['tot_amount']!;
        }
        if (item == '3') {
          dataControl.lendTot.value = entireData[i]['tot_amount']!;
        }
        if (item == '4') {
          dataControl.borrowTot.value = entireData[i]['tot_amount']!;
        }
      }
      dataControl.savingsOverall.value =
          (dataControl.incomeTot.value + dataControl.borrowTot.value) -
              (dataControl.expenseTot.value + dataControl.lendTot.value);
    }
    dataControl.savingsOverall;

    getAllitemWidget();
  }

  int _incomeTotal = 0;
  int _expenseTotal = 0;
  int _lendTotal = 0;
  int _borrowTotal = 0;
  getAllitemWidget() async {
    _incomeTotal = 0;
    _expenseTotal = 0;
    _lendTotal = 0;
    _borrowTotal = 0;
    final entireData = dataControl.selectedStartDate != null
        ? await db_control.GroupByCategory(
            startDate: dataControl.selectedStartDate,
            endDate: dataControl.selectedEndDate,
          )
        : await db_control.GroupByCategory(overall: dataControl.overall);

    for (var i = 0; i < entireData.length; i++) {
      String item = entireData[i]['category'];
      if (item == '1') {
        _incomeTotal = entireData[i]['tot_amount']!;
      }
      if (item == '2') {
        _expenseTotal = entireData[i]['tot_amount']!;
      }
      if (item == '3') {
        _lendTotal = entireData[i]['tot_amount']!;
      }
      if (item == '4') {
        _borrowTotal = entireData[i]['tot_amount']!;
      }
    }

    dataControl.incomeTot.value = _incomeTotal;
    dataControl.expenseTot.value = _expenseTotal;
    dataControl.lendTot.value = _lendTotal;
    dataControl.borrowTot.value = _borrowTotal;
    dataControl.savingsTot.value =
        (dataControl.incomeTot.value + dataControl.borrowTot.value) -
            (dataControl.expenseTot.value + dataControl.lendTot.value);

    dataControl.startText = dataControl.selectedStartDate != null
        ? DateFormat('MMM dd')
            .format(DateTime.parse(dataControl.selectedStartDate))
        : null;
    dataControl.endText = dataControl.selectedStartDate != null
        ? DateFormat('MMM dd')
            .format(DateTime.parse(dataControl.selectedEndDate))
        : null;

    dataControl.selectedStartDate == null
        ? dataControl.savingsOverall == 0
            ? dataControl.DisplayDate.value = "There is No Data"
            : dataControl.DisplayDate.value = "No Data in Current Month"
        : dataControl.DisplayDate.value =
            '''${dataControl.startText} - ${dataControl.endText}''';

    dataControl.update();
  }


  @override
  Widget build(BuildContext context) {
    getTotalSavings();
    print("main rebuild");
    // print(
    //                       "mainnnn  ${dataControl.card} , ${dataControl.favoriteVisible}, and ${dataControl.isUpdateClicked}");

    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.primary_color,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Overall_inkwell_main(context),
                    const SizedBox(
                      height: 20,
                    ),
                    scrollView_container(context),
                  ],
                ),
                GetBuilder<getXcontrol>(
                  builder: (controller) {
                    print("666 building getx main ");
                    if (controller.cardList >= 1) {
                      return list_widget(
                        toggleisUpdateClicked: toggleisUpdateClicked,
                        card: int.parse((dataControl.cardList).toString()),
                        percentIndicator: dataControl.percentInd,
                        isOverall: dataControl.overall,
                        startDate: dataControl.selectedStartDate,
                        endDate: dataControl.selectedEndDate,
                        favoriteVisible: dataControl.favoriteVisible,
                      );
                    } else if ((dataControl.card >= 1 ||
                            dataControl.selectedcontent.isNotEmpty) &&
                        dataControl.favoriteVisible == false) {
                     
                      return category_cards(
                        toggleAddorUpdateClicked: toggleAddorUpdateClicked,
                      );
                    } else {
                      return home_content_all_widget(
                        toggleisUpdateClicked,

                      );
                    }
                  },
                )
              ],
            ),
            GetBuilder<getXcontrol>(
              
              builder: (controller) {
                print("this 666 add in control");
                if (controller.addButton == true) {
                  return addButton_container(context);
                }
                return Container();
              },
            ),
            bottomNavigation_buttons(),
          ],
        ),
      ),
    );
  }



  void toggleisUpdateClicked(Map<String, Object?> _selectedcontent, {bool? delete, bool?fav}) {
    if (fav == true || fav==false) {
      dataControl.selectedcontent = {};
      dataControl.update();
    }
      else if (delete == true || delete==false) {
        dataControl.incomeTot.value = 0;
      dataControl.expenseTot.value = 0;
      dataControl.lendTot.value = 0;
      dataControl.borrowTot.value = 0;
      getTotalSavings();
      dataControl.selectedcontent = {};
      dataControl.update();
    }
      else
      {
      dataControl.card = int.parse(_selectedcontent['category'] as String);
      dataControl.selectedcontent = _selectedcontent;
      dataControl.cardList.value = 0;
      dataControl.addButton = false;
      dataControl.favoriteVisible = false;
      dataControl.update();
      }
  }

  void toggleAddorUpdateClicked(String category) {
    dataControl.cardList.value = int.parse(category);
    dataControl.currentIndex.value = int.parse(category) - 1;
    dataControl.percentInd = false;
    dataControl.card = 0;
    getTotalSavings();
  }
}


 
