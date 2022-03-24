// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:money_management/main.dart';
import 'package:money_management/screens/controller.dart';
import 'package:intl/intl.dart';

Future<void> bottomSheet_edit(BuildContext context,
    Map<String, Object?> _selectedcontent, toggleisUpdateClicked) {
  String val = '${_selectedcontent['favourite']}'.toString();

  bool fav =
      val == false ? val.toLowerCase() == 'false' : val.toLowerCase() == 'true';

  return showModalBottomSheet<void>(
    backgroundColor: Styles.primary_color.withOpacity(0),
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Styles.primary_black,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Styles.primary_black.withOpacity(0.3), //color of shadow
              spreadRadius: 0.5, //spread radius
              blurRadius: 5,
              offset: const Offset(0, -3), // changes position of shadow
            ),
          ],
        ),
        height: 250,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Tooltip(
                  message: " ",
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedcontent['item'].toString(),
                              style: Styles.boldwhite,
                            ),
                            Text(
                              _selectedcontent['amount'].toString(),
                              style: Styles.boldwhite,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Remark :  ${_selectedcontent['remark'].toString()}",
                              style: Styles.boldwhite,
                            ),
                            Text(
                              DateFormat('MMM dd').format(DateTime.parse(
                                  _selectedcontent['date'].toString())),
                              style: Styles.boldwhite,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 2, color: Colors.white),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add to Favourite",
                      style: Styles.boldwhite,
                    ),
                    Tooltip(
                      message:
                          "favourite is $fav on ${_selectedcontent['item']}! tap to switch",
                      child: FavoriteButton(
                        isFavorite: fav,
                        iconSize: 28,
                        valueChanged: (_isFavorite) {
                          // Scaffold.of(context).activate;
                          db_control.AddtoFavorite(
                              int.parse('${_selectedcontent['id']}'));
                          toggleisUpdateClicked(_selectedcontent, fav: fav);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Edit Entry",
                      style: Styles.boldwhite,
                    ),
                    Container(
                      height: 40, width: 33,
                      alignment: Alignment.center,
                      //  color: Colors.red,
                      child: Tooltip(
                        message: "Edit ${_selectedcontent['item']} item",
                        child: IconButton(
                            onPressed: () {
                              toggleisUpdateClicked(_selectedcontent);
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.edit_outlined,
                              size: 24,
                              color: Styles.custom_income_green,
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Delete Entry",
                      style: Styles.boldwhite,
                    ),
                    Container(
                      height: 40,
                      width: 33,
                      alignment: Alignment.center,
                      child: Tooltip(
                        message: "delete ${_selectedcontent['item']} item",
                        child: IconButton(
                          onPressed: () {
                            db_control.deleteMoney(int.parse('${_selectedcontent['id']}'));
                            toggleisUpdateClicked(_selectedcontent,delete: true);
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            size: 24,
                            color: Styles.custom_expense_red,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
