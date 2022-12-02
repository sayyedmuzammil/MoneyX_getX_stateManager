// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, camel_case_types, use_key_in_widget_constructors, non_constant_identifier_names, unrelated_type_equality_checks, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:money_management/constant_design.dart';
import 'package:money_management/controller.dart';
import 'package:money_management/widgets/bottom_sheet.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class list_widget extends StatelessWidget {
  list_widget({
    required this.toggleisUpdateClicked,
  });

  void Function(Map<String, Object?> _selectedcontent, {bool delete})
      toggleisUpdateClicked;

  var dateRange;
  var _selectedStartDate;
  var _selectedEndDate;
  String DisplayDate = 'Select Date Range';
  List dateSets = [];

  var startDate = dataControl.selectedStartDate;
  var endDate = dataControl.selectedEndDate;
  var isOverall = dataControl.overall;
  var percentIndicator = dataControl.percentInd;
  var card = int.parse((dataControl.cardList).toString());

  @override
  Widget build(BuildContext context) {
    _selectedStartDate = startDate;
    _selectedEndDate = endDate;
    String previousDate = '';
    return FutureBuilder<List<Map<String, Object?>>>(
        future: db_control.getAllItems(
            overall: isOverall,
            starDate: _selectedStartDate,
            endDate: _selectedEndDate,
            categoryList: card),
        builder: (context, listItem) {
          if (listItem.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          int pointer = -1;
          int counter = -1;
          dateSets = [];

          if (listItem.data == null ||
              listItem.data!.isEmpty ||
              dataControl.dataMap.isEmpty && percentIndicator == true) {
            return Tooltip(
              message: "Alert!",
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/export/clipboard.png",
                      height: 13.h,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "No Record!",
                      style: Styles.normal20,
                    ),
                    Text(
                      "Tap the + button to add a record",
                      style: Styles.normal17.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            );
          }
          List<Map<String, Object?>> AllRows = listItem.data!;
          previousDate = AllRows[0]['date'].toString();
          dateSets.add(previousDate);
          for (var i = 1; i < AllRows.length; i++) {
            if (previousDate == AllRows[i]['date']) {
              dateSets.add(null);
            } else {
              previousDate = AllRows[i]['date'].toString();
              dateSets.add(AllRows[i]['date']);
            }
          }
          dateSets.add(null); //dummy data in the end of dateset list
          return Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Styles.primary_black
                                .withOpacity(0.3), //color of shadow
                            spreadRadius: 0.5, //spread radius
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      width: 100.w,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              percentIndicator != true
                                  ? const SizedBox(
                                      height: 5,
                                    )
                                  : Container(),
                              Tooltip(
                                message: " ",
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    child: card == 1
                                        ? Text(
                                            "Income",
                                            style: Styles.normal20.copyWith(
                                              color: Colors.green[300],
                                            ),
                                          )
                                        : card == 2
                                            ? Text(
                                                "Expense",
                                                style: Styles.normal20.copyWith(
                                                  color:
                                                      Styles.custom_expense_red,
                                                ),
                                              )
                                            : card == 3
                                                ? Text(
                                                    "Lend",
                                                    style: Styles.normal20
                                                        .copyWith(
                                                      color: Styles
                                                          .custom_lend_yellow,
                                                    ),
                                                  )
                                                : card == 4
                                                    ? Text(
                                                        "Borrow",
                                                        style: Styles.normal20
                                                            .copyWith(
                                                          color: Styles
                                                              .custom_borrow_pink,
                                                        ),
                                                      )
                                                    : card == 5
                                                        ? Text(
                                                            "Savings",
                                                            style: Styles
                                                                .normal20
                                                                .copyWith(
                                                              color: Styles
                                                                  .custom_savings_blue,
                                                            ),
                                                          )
                                                        : Container(),
                                  ),
                                ),
                              ),
                              percentIndicator == true &&
                                      dataControl.dataMap.isNotEmpty
                                  ? Container(
                                      // height: 260,
                                      margin: const EdgeInsets.only(top: 10),
                                      width: 100.w,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: dataControl.dataMap != null
                                              ? Tooltip(
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: PieChart(
                                                      dataMap:
                                                          dataControl.dataMap,
                                                      animationDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  800),
                                                      ringStrokeWidth: 25,
                                                      chartLegendSpacing: 35,
                                                      chartRadius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      chartType: ChartType.ring,
                                                      legendOptions:
                                                          const LegendOptions(
                                                        showLegendsInRow: true,
                                                        legendPosition:
                                                            LegendPosition
                                                                .bottom,
                                                        showLegends: true,
                                                        legendShape:
                                                            BoxShape.circle,
                                                        legendTextStyle:
                                                            Styles.normal17,
                                                      ),
                                                      chartValuesOptions:
                                                          const ChartValuesOptions(
                                                              showChartValueBackground:
                                                                  false,
                                                              // chartValueBackgroundColor: Colors.gree,
                                                              showChartValues:
                                                                  true,
                                                              showChartValuesInPercentage:
                                                                  true,
                                                              showChartValuesOutside:
                                                                  true,
                                                              decimalPlaces: 1,
                                                              chartValueStyle:
                                                                  TextStyle(
                                                                      color: Colors
                                                                          .black)),
                                                    ),
                                                  ),
                                                  message:
                                                      "$dataControl.dataMap}",
                                                )
                                              : const Text("No datas")))
                                  : Column(
                                      children: [
                                        for (var i in AllRows)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              dateSets[++counter] != null
                                                  ? const SizedBox(
                                                      height: 15,
                                                    )
                                                  : Container(),
                                              dateSets[++pointer] != null
                                                  ? Tooltip(
                                                      message: " ",
                                                      child: InkWell(
                                                        onTap: () {},
                                                        child: Text(
                                                          DateFormat('MMM dd')
                                                              .format(DateTime
                                                                  .parse(i[
                                                                          'date']
                                                                      .toString())),
                                                          style: Styles.normal17
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .red),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(),
                                              InkWell(
                                                onTap: () {
                                                  dataControl.addButton.value =
                                                      false;
                                                  dataControl.update();
                                                  bottomSheet_edit(context, i,
                                                      toggleisUpdateClicked);
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      i['item'].toString(),
                                                      style: Styles.normal20,
                                                    ),
                                                    Text(
                                                      i['amount'].toString(),
                                                      style: Styles.normal17,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                            ]),

                        // }
                      ),
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
