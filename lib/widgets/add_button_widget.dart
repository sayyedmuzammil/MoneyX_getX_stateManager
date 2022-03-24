 // ignore_for_file: non_constant_identifier_names

 import 'package:flutter/material.dart';
import 'package:money_management/Custom_icons.dart';
import 'package:money_management/main.dart';
import 'package:money_management/screens/controller.dart';

Container addButton_container(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 90),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                ImageIcon(
                  AssetImage("assets/export/Union 1.png"),
                  size: 300,
                ),
              ],
            ),
            height: 150,
            width: 300, 
          ),
          Container(
            width: 280, height: 120,
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        dataControl.add_Button_controller(1);
                      },
                      child: Tooltip(
                        message: "Add your new ",
                        child: Container(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Custom_icons.income,
                                  size: 24,
                                  color: Styles.primary_black,
                                ),
                                Text(
                                  "Income",
                                  style: Styles.normal17,
                                )
                              ],
                            ),
                          ),
                          height: 40,
                          width: 130,
                          decoration: const BoxDecoration(
                            color: Styles.custom_income_green,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            //
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /*   setState(() { */
                        dataControl.add_Button_controller(2);
                        /* }); */
                      },
                      child: Tooltip(
                        message: "Add your new ",
                        child: Container(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Custom_icons.expense,
                                  size: 24,
                                  color: Styles.primary_black,
                                ),
                                Text(
                                  "Expense",
                                  style: Styles.normal17,
                                )
                              ],
                            ),
                          ),
                          height: 40,
                          width: 130,
                          decoration: const BoxDecoration(
                            color: Styles.custom_expense_red,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        /* setState(() { */
                        dataControl.add_Button_controller(3);
                        /*     }); */
                      },
                      child: Tooltip(
                        message: "Add your new ",
                        child: Container(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Custom_icons.lend,
                                  size: 24,
                                  color: Styles.primary_black,
                                ),
                                Text(
                                  "Lend",
                                  style: Styles.normal17,
                                )
                              ],
                            ),
                          ),
                          height: 40,
                          width: 130,
                          decoration: const BoxDecoration(
                            color: Styles.custom_lend_yellow,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                    Tooltip(
                      message: "Add your new ",
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            dataControl.add_Button_controller(4);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Custom_icons.borrow,
                                  size: 24,
                                  color: Styles.primary_black,
                                ),
                                Text(
                                  "Borrow",
                                  style: Styles.normal17,
                                )
                              ],
                            ),
                          ),
                        ),
                        height: 40,
                        width: 130,
                        decoration: const BoxDecoration(
                          color: Styles.custom_borrow_pink,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
