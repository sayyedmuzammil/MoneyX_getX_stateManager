// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management/Custom_icons.dart';
import 'package:money_management/constant_design.dart';
import 'package:money_management/controller.dart';
import 'package:money_management/screens/homeScreen.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

final main_widget_controller = Get.put(HomeScreen());
Stack scrollView_container(BuildContext context) {
  return Stack(
    children: [
      Container(
        width: 100.w,
        height: 200,
        color: Colors.white,
      ),
      Column(
        // main horizontal scroll view
        children: [
          Obx(() => Container(
                margin: const EdgeInsets.only(left: 30),
                child: dataControl.overall == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Tooltip(
                                    message:
                                        "tap to Select a new date range! current date range is ",
                                    child: InkWell(
                                        onTap: () {
                                          main_widget_controller.currentMonth =
                                              0;
                                          pickDateRange(context);
                                        },
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_today_sharp,
                                              size: 20,
                                              color: Styles.primary_black,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              dataControl.DisplayDate.value,
                                              style: Styles.normal17.copyWith(
                                                  // fontSize: 17,
                                                  color: Colors.deepOrange,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  main_widget_controller.dateRange != null
                                      ? Tooltip(
                                          message:
                                              "tap to go default range! defaut date range is current month. ",
                                          child: InkWell(
                                              onTap: () {
                                                /* setState(() { */
                                                main_widget_controller
                                                        .currentMonth =
                                                    DateTime.now().month;
                                                // dataControl.DisplayDate.value = 'Choose Date Range';
                                                dataControl.DisplayDate.value =
                                                    '''.startText - ${dataControl.endText}''';
                                                main_widget_controller
                                                    .dateRange = null;
                                                dataControl.selectedStartDate =
                                                    null;
                                                /*       }); */
                                                main_widget_controller
                                                    .getTotalSavings();
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                color: Colors.red,
                                                size: 22,
                                              )),
                                        )
                                      : Container(),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ],
                      )
                    : Tooltip(
                        message: "Viewing entire Data",
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Overall",
                                    style: Styles.normal20
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
              )),
          main_Scrollview_container(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ],
  );
}

Container main_Scrollview_container() {
  return Container(
    //scroll view main

    height: 140,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        dataControl.overall == false
            ? const SizedBox(
                width: 30,
              )
            : Container(),
        dataControl.overall == false
            ? Tooltip(
                message: " ",
                child: InkWell(
                  onTap: () {},
                  child: Stack(children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Styles.custom_savings_blue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Styles.primary_black
                                .withOpacity(0.3), //color of shadow
                            spreadRadius: 0.5, //spread radius
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                          //you can set more BoxShadow() here
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      width: 140,
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Custom_icons.savings,
                            size: 36,
                            color: Styles.primary_black,
                          ),
                          const Text(
                            "Savings",
                            style: Styles.normal17,
                          ),
                          Obx(() => Text(
                                "₹${dataControl.savingsTot}",
                                style: Styles.bold25,
                              ))
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            : Container(),
        const SizedBox(
          width: 30,
        ),
        Tooltip(
          message: "Income Chart Button",
          child: InkWell(
            onTap: () {
              dataControl.pie_chart_controller(1);
              main_widget_controller.getPieChartValue(1);
            },
            child: Stack(
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Styles.custom_income_green,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Styles.primary_black
                            .withOpacity(0.3), //color of shadow
                        spreadRadius: 0.5, //spread radius
                        blurRadius: 5,
                        // blur radius
                        offset: const Offset(0, 3),
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  width: 140,
                  height: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Custom_icons.income,
                        size: 36,
                        color: Styles.primary_black,
                      ),
                      const Text(
                        "Income",
                        style: Styles.normal17,
                      ),
                      /*  dataControl.overall == false
                                                  ? */
                      Obx(() => Text(
                            "₹${dataControl.incomeTot}",
                            style: Styles.bold25,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Tooltip(
          message: "Expense Chart Button",
          child: InkWell(
            onTap: () {
              dataControl.pie_chart_controller(2);
              main_widget_controller.getPieChartValue(2);
              // dataControl.update();
            },
            child: Stack(
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Styles.custom_expense_red,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Styles.primary_black
                            .withOpacity(0.3), //color of shadow
                        spreadRadius: 0.5, //spread radius
                        blurRadius: 5,
                        // blur radius
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  width: 140, height: 140,
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Custom_icons.expense,
                        size: 36,
                        color: Styles.primary_black,
                      ),
                      const Text(
                        "Expense",
                        style: Styles.normal17,
                      ),
                      Obx(() => Text(
                            "₹${dataControl.expenseTot}",
                            style: Styles.bold25,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Tooltip(
          message: "Lend Chart Button",
          child: InkWell(
            onTap: () {
              dataControl.pie_chart_controller(3);
              main_widget_controller.getPieChartValue(3);
              // dataControl.update();
            },
            child: Stack(
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Styles.custom_lend_yellow,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Styles.primary_black
                            .withOpacity(0.3), //color of shadow
                        spreadRadius: 0.5, //spread radius
                        blurRadius: 5,
                        // blur radius
                        offset:
                            const Offset(0, 3), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  width: 140,
                  height: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Custom_icons.lend,
                        size: 30,
                        color: Styles.primary_black,
                      ),
                      const Text(
                        "Lend",
                        style: Styles.normal17,
                      ),
                      /*    dataControl.overall == false
                                                  ? */
                      Obx(() => Text(
                            "₹${dataControl.lendTot}",
                            style: Styles.bold25,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Tooltip(
          message: "Borrow Chart Button",
          child: InkWell(
            onTap: () {
              dataControl.pie_chart_controller(4);
              main_widget_controller.getPieChartValue(4);
              // dataControl.update();
            },
            child: Stack(
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Styles.custom_borrow_pink,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Styles.primary_black
                            .withOpacity(0.3), //color of shadow
                        spreadRadius: 0.5, //spread radius
                        blurRadius: 5,
                        // blur radius
                        offset:
                            const Offset(0, 3), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  width: 140,
                  height: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Custom_icons.borrow,
                        size: 32,
                        color: Styles.primary_black,
                      ),
                      const Text(
                        "Borrow",
                        style: Styles.normal17,
                      ),
                      /* dataControl.overall == false
                                                  ? */
                      Obx(() => Text(
                            "₹${dataControl.borrowTot}",
                            style: Styles.bold25,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    ),
  );
}

Future pickDateRange(BuildContext context) async {
  // final dateFormat = DateFormat("yyyy-MM-dd");
  final initialDateRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(hours: 24 * 3)),
    end: DateTime.now(),
  );
  final newDateRange = await showDateRangePicker(
    initialEntryMode: DatePickerEntryMode.calendar,
    context: context,
    currentDate: DateTime.now(),
    firstDate: DateTime(DateTime.now().year - 5),
    lastDate: DateTime.now(),
    initialDateRange: main_widget_controller.dateRange ?? initialDateRange,
  );

  if (newDateRange == null) return;
  main_widget_controller.dateRange = newDateRange;

  dataControl.selectedStartDate =
      DateFormat('yyyy-MM-dd').format(main_widget_controller.dateRange!.start);
  dataControl.selectedEndDate =
      DateFormat('yyyy-MM-dd').format(main_widget_controller.dateRange!.end);
  var _selectedFirst =
      DateFormat('MMM dd').format(main_widget_controller.dateRange!.start);
  var _selectedEnd =
      DateFormat('MMM dd').format(main_widget_controller.dateRange!.end);
  if (main_widget_controller.dateRange != null) {
    main_widget_controller.getAllitemWidget();

    dataControl.DisplayDate.value = "$_selectedFirst - $_selectedEnd";
  }
}
