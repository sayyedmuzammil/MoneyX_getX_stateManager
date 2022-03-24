// import 'package:flutter/cupertino.dart';
// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management/db_functions/data_model.dart';
import 'package:intl/intl.dart';
import 'package:money_management/screens/controller.dart';
import 'package:sizer/sizer.dart';
import 'main.dart';

class category_cards extends StatelessWidget {
  category_cards({
    this.toggleAddorUpdateClicked,
  });

  final Map<String, Object?> selectedcontent = dataControl.selectedcontent;
  void Function(String category)? toggleAddorUpdateClicked;

  final snackBarAdd = SnackBar(
      content: Text(' Item Added Successfully.',
          style: Styles.normal17.copyWith(
            color: Colors.white,
          )));
  final snackBarUpdate = SnackBar(
      content: Text(' Item Updated Successfully.',
          style: Styles.normal17.copyWith(
            color: Colors.white,
          )));
  final _categoryController = TextEditingController();
  final _dateController = TextEditingController();
  final _amountController = TextEditingController();
  final _remarkController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  void initState() {
    // dataControl.isClicked=true;
    // print("vvvv ${dataControl.card} ");

    selectedcontent.isNotEmpty
        ? {
            _categoryController.text = selectedcontent['item'].toString(),
            dataControl.selectedDate = DateTime.parse(
              selectedcontent['date'].toString(),
            ),
            _amountController.text = selectedcontent['amount'].toString(),
            _remarkController.text = selectedcontent['remark'].toString(),
          }
        : dataControl.selectedDate = DateTime.now();
      // dataControl.update();
  }

  void clickItem() {
db_control.simpleListNotifier.clear();
    _categoryController.text.length > 1
        ? dataControl.isClicked.value = false
        : dataControl.isClicked.value = true;

    print("vv ${dataControl.isClicked}");
  }

  @override //this widget is add student
  Widget build(BuildContext context) {
    print("building add or update");
    initState();
    _dateController.text =
        DateFormat("MMM dd").format(dataControl.selectedDate);

    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 50.h,
          margin: const EdgeInsets.symmetric(horizontal: 10),

          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Styles.primary_black
                            .withOpacity(0.3), //color of shadow
                        spreadRadius: 0.5, //spread radius
                        blurRadius: 5,

                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  margin: const EdgeInsets.all(10),
                  width: 100.w,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Tooltip(
                          message: " ",
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              child: dataControl.card == 1
                                  ? Text(
                                      "Income",
                                      style: Styles.normal20.copyWith(
                                        color: Colors.green[300],
                                      ),
                                    )
                                  : dataControl.card == 2
                                      ? Text(
                                          "Expense",
                                          style: Styles.normal20.copyWith(
                                            color: Styles.custom_expense_red,
                                          ),
                                        )
                                      : dataControl.card == 3
                                          ? Text(
                                              "Lend",
                                              style: Styles.normal20.copyWith(
                                                color:
                                                    Styles.custom_lend_yellow,
                                              ),
                                            )
                                          : dataControl.card == 4
                                              ? Text(
                                                  "Borrow",
                                                  style:
                                                      Styles.normal20.copyWith(
                                                    color: Styles
                                                        .custom_borrow_pink,
                                                  ),
                                                )
                                              : Container(),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                Form(
                                  key: _globalKey,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Card(
                                          elevation: 0,
                                          child: TextFormField(
                                            onChanged: (_) {  
                                              
                                              dataControl.isClicked.value = true;
                                     
                                              clickItem();
                                              // dataControl.update();
                                            },
                                            // onTap:(){
                                            //   dataControl.isClicked.value = true;
                                            //   clickItem();
                                            // },
                                            controller: _categoryController,
                                            decoration: InputDecoration(
                                              icon: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Icon(
                                                  Icons.category_outlined,
                                                  size: 20,
                                                  color: Styles.primary_black
                                                      .withOpacity(.8),
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                top: 20,
                                              ),
                                              hintText: 'Enter the Item',
                                              hintStyle: Styles.normal17.copyWith(
                                                  color: Colors.grey,
                                                  fontSize:
                                                      15), /*  hintStyle: Styles.Normal15 */
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Item is required';
                                              } else if (value
                                                  .startsWith(" ")) {
                                                return "Item should not contain whitespace";
                                              }
                                            },
                                          ),
                                        ),
                                        Card(
                                          elevation: 0,
                                          // width: 400, height: 50,
                                          child: TextFormField(
                                            onTap: () async {
                                              final _selectedDateTemp =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now()
                                                    .subtract(const Duration(
                                                        days: 90)),
                                                lastDate: DateTime.now(),
                                              );

                                              if (_selectedDateTemp == null) {
                                                return;
                                              } else {
                                                dataControl.selectedDate =
                                                    _selectedDateTemp;
                                                _dateController.text =
                                                    DateFormat('MMM dd').format(
                                                        dataControl
                                                            .selectedDate);
                                              }
                                            },
                                            readOnly: true,
                                            controller: _dateController,
                                            decoration: InputDecoration(
                                              icon: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Icon(
                                                  Icons.calendar_today_outlined,
                                                  size: 20,
                                                  color: Styles.primary_black
                                                      .withOpacity(.8),
                                                ),
                                              ),
                                              // enabled: false,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                top: 20,
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Date is required';
                                              } else if (value
                                                  .startsWith(" ")) {
                                                return " should not contain whitespace";
                                              }
                                            },
                                          ),
                                        ),

                                        //                                     sfDaterangepicker
                                        //                                      SfDateRangePicker(
                                        //                                        monthFormat: 'MMM',
                                        // minDate: DateTime(2010),
                                        //                                        maxDate: DateTime.now(),
                                        //                                       //  enableMultiView: true,
                                        //                                         selectionMode: DateRangePickerSelectionMode.single,
                                        //                                             view: DateRangePickerView.month,
                                        //                                              onViewChanged: (DateRangePickerViewChangedArgs args) {
                                        //                                          final PickerDateRange visibleDates = args.visibleDateRange;
                                        //                                          final DateRangePickerView view = args.view;
                                        //                                        },
                                        //                                             // monthViewSettings: DateRangePickerMonthViewSettings(showTrailingAndLeadingDates: true,
                                        //                                             // ),
                                        //                                             onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                                        //     // var _startDate =
                                        //     //     DateFormat('yyyy-MM-dd').format(args.value).toString();
                                        //         //   var  _endDate =
                                        //         // DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate).toString();
                                        // // DateTime start=new DateTime(2020, 02, 04);
                                        // // DateTime end=new DateTime(2020,03,04);
                                        // // var diff=end.difference(start);
                                        // // print("difference $diff");
                                        //         // print("start $_startDate end date $_endDate");
                                        //         // var diff= DateTime.now().difference(DateFormat('yyyy-MM-dd').format(args.value.startDate).toString()).inDays
                                        //         // print("{$_endDate - $_startDate}");
                                        //                                          final dynamic value = args.value;
                                        //                                          print("value      $value");
                                        //                                         //  now=value;
                                        //                                        },
                                        //                                             monthCellStyle: DateRangePickerMonthCellStyle(
                                        //                                                todayTextStyle: TextStyle(color: Styles.primary_black),
                                        //                                               /*   cellDecoration: BoxDecoration(color:Colors.teal), */
                                        //                                               ),
                                        //                                           ),

                                        Card(
                                          elevation: 0,
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: _amountController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'please enter the amount';
                                              } else if (value.contains(" ")) {
                                                return "white space is not acceptable";
                                              } else if (value.contains(".")) {
                                                return "decimal number is not acceptable";
                                              } else if (value.contains(",") ||
                                                  value.contains("-") ||
                                                  value.contains(",") ||
                                                  value.startsWith("0")) {
                                                return "Enter a Valid Amount";
                                              }
                                            },
                                            decoration: InputDecoration(
                                              icon: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 15,
                                                ),
                                                child: Icon(
                                                  Icons.payments_outlined,
                                                  size: 24,
                                                  color: Styles.primary_black
                                                      .withOpacity(.8),
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                top: 20,
                                              ),
                                              hintText: 'Enter the amount',
                                              hintStyle: Styles.normal17
                                                  .copyWith(
                                                      color: Colors.grey,
                                                      fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        Card(
                                          elevation: 0,
                                          child: TextFormField(
                                            controller: _remarkController,
                                            decoration: InputDecoration(
                                              icon: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Icon(
                                                  Icons.note,
                                                  size: 24,
                                                  color: Styles.primary_black
                                                      .withOpacity(.8),
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      top: 20),
                                              hintText: 'Remark',
                                              hintStyle: Styles.normal17
                                                  .copyWith(
                                                      color: Colors.grey,
                                                      fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      color: Styles.primary_black,
                                    ),
                                    primary: Styles.primary_black,
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: selectedcontent.isEmpty
                                      ? () {
                                          if (_globalKey.currentState!
                                              .validate()) {
                                            onAddorUpdateButton();
                                            toggleAddorUpdateClicked!(
                                                dataControl.card.toString());
                                            Scaffold.of(context)
                                                .showSnackBar(snackBarAdd);     
                                          }
                                        }
                                      : () {
                                          if (_globalKey.currentState!
                                              .validate()) {
                                            onAddorUpdateButton(
                                                id: selectedcontent['id']);
                                            toggleAddorUpdateClicked!(
                                                selectedcontent['category']
                                                    as String);
                                            Scaffold.of(context)
                                                .showSnackBar(snackBarUpdate);
                                          }
                                        },
                                  child: selectedcontent.isEmpty
                                      ? const Text(
                                          'ADD',
                                          style: Styles.boldwhite,
                                        )
                                      : const Text(
                                          'UPDATE',
                                          style: Styles.boldwhite,
                                        ),
                                )
                              ],
                            ),
                            Obx(()=>
                           Container(child:
                                (dataControl.isClicked ==true) ?//its for listing previus items
                                 items_list_after_click()
                                 :Container()
                           )
                            // GetBuilder<getXcontrol>(builder: (controller) {
                            ),

                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 260,
                ),
              ],
            ),
          ),

          // }
        ),
      ],
    );
  }

  Container items_list_after_click() {
    db_control.simpleListNotifier.isEmpty?
     db_control.ListForTextForm(dataControl.card):null;
    print("888  building getx builder");
    return
    db_control.simpleListNotifier.isNotEmpty?
     Container(
      color: Colors.white.withOpacity(.8),
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.fromLTRB(35, 50, 30, 0),
      child: Container(
        height: 230,
        width: 350,
        child: Obx(() => ListView.builder(
                                        itemCount: db_control.simpleListNotifier.length,
                                        itemBuilder: (ctx, index) {
                                          MainAxisSize.min;
                                          final singleItem = db_control.simpleListNotifier[index];
                                          return ListTile(
                                              isThreeLine: false,
                                              title: Text(
                                                '${singleItem.item}',
                                                style: Styles.normal17,
                                              ),
                                              selected: true,
                                              onTap: () {
                                                _categoryController.text =
                                                    singleItem.item.toString();
                                                dataControl.isClicked.value = false;
                                                
                                                // dataControl.update();
                                              });
                                        }
                                        )
                                        )
                                        )
    
              
              ):Container();
            
   
    
  }

  Future<void> onAddorUpdateButton({id}) async {
    final _item = _categoryController.text.trim().toLowerCase();
    final _date = DateFormat('yyyy-MM-dd').format(dataControl.selectedDate);
    final _amount = int.parse(_amountController.text.trim());
    final _remark = _remarkController.text.trim();

    final _singleItem = id != null
        ? MoneyModel(
            id: int.parse('$id'),
            category: dataControl.card.toString(),
            item: _item,
            date: _date,
            amount: _amount,
            remark: _remark,
            favourite: "false",
          )
        : MoneyModel(
            category: dataControl.card.toString(),
            item: _item,
            date: _date,
            amount: _amount,
            remark: _remark,
            favourite: "false",
          );
    db_control.addMoney(_singleItem);
  }
}
