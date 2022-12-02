// ignore_for_file: unnecessary_null_comparison, unrelated_type_equality_checks, non_constant_identifier_names, prefer_typing_uninitialized_variables, must_be_immutable, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:money_management/constant_design.dart';
import 'package:money_management/controller.dart';
import 'package:money_management/widgets/bottom_sheet.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class home_content_all_widget extends StatelessWidget {
  home_content_all_widget(
    this.toggleisUpdateClicked,
  );

  void Function(Map<String, Object?> _selectedcontent, {bool delete, bool fav})
      toggleisUpdateClicked;

  var val;
  var dateRange;
  var _selectedStartDate;
  var _selectedEndDate;
  String DisplayDate = 'Select Date Range';
  List dateSets = [];
  bool isOverall = dataControl.overall;

  @override
  Widget build(BuildContext context) {
    _selectedStartDate = dataControl.selectedStartDate;
    _selectedEndDate = dataControl.selectedEndDate;
    String previousDate = '';
    return FutureBuilder<List<Map<String, Object?>>>(
        future: dataControl.favoriteVisible == false
            ? db_control.getAllItems(
                starDate: _selectedStartDate,
                endDate: _selectedEndDate,
                overall: isOverall)
            : db_control.getAllItems(
                favoriteVisible: dataControl.favoriteVisible,
                starDate: _selectedStartDate,
                endDate: _selectedEndDate,
              ),
        builder: (context, listItem) {
          if (listItem.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
print("777 $listItem");
          int pointer = -1;
          int counter = -1;
          dateSets = [];

          if (listItem.data == null || listItem.data!.isEmpty) {
            return Tooltip(
              message: "Alert",
              child: InkWell(
                onTap: () {},
                child: Column(
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
                    )
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
                        child: Column(children: [
                          Tooltip(
                            message: " ",
                            enableFeedback: true,
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                dataControl.favoriteVisible == true
                                    ? "Favourites"
                                    : "All Transactions",
                                style: Styles.normal17.copyWith(
                                    fontSize: 16,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          for (var i in AllRows)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                            DateFormat('MMM dd').format(
                                                DateTime.parse(
                                                    i['date'].toString())),
                                            style: Styles.normal17.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                Tooltip(
                                  message: "Tap!",
                                  child: InkWell(
                                    onTap: () {
                                      dataControl.addButton.value = false;
                                      dataControl.update();
                                      bottomSheet_edit(
                                          context, i, toggleisUpdateClicked);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          i['item'].toString(),
                                          style: Styles.normal20,
                                        ),
                                        i['category'] == '1'
                                            ? Text(
                                                i['amount'].toString(),
                                                style: Styles.normal17.copyWith(
                                                    color: /*  Styles.custom_income_green  */ Colors
                                                        .green[200]),
                                              )
                                            : i['category'] == '2'
                                                ? Text(
                                                    i['amount'].toString(),
                                                    style: Styles.normal17.copyWith(
                                                        color: Styles
                                                            .custom_expense_red),
                                                  )
                                                : i['category'] == '3'
                                                    ? Text(
                                                        i['amount'].toString(),
                                                        style: Styles.normal17
                                                            .copyWith(
                                                                color: Styles
                                                                    .custom_lend_yellow),
                                                      )
                                                    : Text(
                                                        i['amount'].toString(),
                                                        style: Styles.normal17
                                                            .copyWith(
                                                                color: Styles
                                                                    .custom_borrow_pink),
                                                      ),
                                      ],
                                    ),
                                  ),
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
