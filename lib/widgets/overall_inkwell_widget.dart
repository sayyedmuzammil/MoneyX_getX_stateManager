 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management/Custom_icons.dart';
import 'package:money_management/main.dart';
import 'package:money_management/screens/controller.dart';
import 'package:money_management/widgets/menu_button_widget.dart';
import 'package:money_management/widgets/scroll_view_white_container.dart';
import 'package:sizer/sizer.dart';

Stack Overall_inkwell_main(BuildContext context) {
    return Stack(
      children: [
        Container(
          //main total savings container
          alignment: Alignment.center,
          child: Tooltip(
            message: "Tap here Switch to Overall",
            child: InkWell(
              onTap: () {
                /*   setState(() { */
                // print("this is main gesture");
                dataControl.selectedcontent={}; 
                dataControl.currentIndex.value = null;
                main_widget_controller.currentMonth = 0;
                dataControl.overall = true;
                dataControl.card = 0;
                dataControl.cardList.value = 0;
                dataControl.isUpdateClicked = false;
                dataControl.favoriteVisible=false;
                // dataControl.isAddorUpdate.value = false;
                dataControl.selectedStartDate = null;
                // dataControl.update(); 
                main_widget_controller.getTotalSavings();
                /*   }); */
              },
              child: Container(
                width: 80.w,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Styles.primary_black
                          .withOpacity(0.3), //color of shadow
                      spreadRadius: 1, //spread radius
                      blurRadius: 6,
                      // blur radius
                      offset: const Offset(0, 3), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Custom_icons.savings,
                          color: Styles.primary_black,
                          size: 27,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Total Savings',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Styles.primary_black),
                        ),
                      ],
                    ),
                    Obx(() => Text(
                          "₹${dataControl.savingsOverall}",
                          style: const TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Styles.primary_black),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          //top icons home and more
          margin: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Styles.primary_black,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                alignment: Alignment.topLeft,
                width: 35,
                height: 35,
                child: IconButton(
                  onPressed: () {
                    // dataControl.card = 0;
                    /*  setState(() { */
                    dataControl.addButton = false;
                    dataControl.overall = false;
                    // dataControl.isAddorUpdate.value = true;
                    dataControl.isUpdateClicked = false;
                    dataControl.card = 0;
                    // print( dataControl.card);
                    dataControl.currentIndex.value = null;
                    dataControl.cardList.value = 0;
                    dataControl.overall = false;
                    dataControl.favoriteVisible = false;
                    dataControl.percentInd = false;
                    dataControl.cardList.value = 0;
                    dataControl.currentIndex.value = null;
                    dataControl.selectedcontent = {};
                    main_widget_controller.currentMonth = DateTime.now().month;
                    dataControl.DisplayDate.value =
                        '''$dataControl.startText - ${dataControl.endText}''';
                    main_widget_controller.dateRange = null;
                    dataControl.selectedStartDate = null;
                    main_widget_controller.getTotalSavings();
                    // dataControl.update();
                    /*    }); */
                  },
                  icon: const Icon(
                    Icons.home_outlined,
                    semanticLabel: "Home",
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Styles.primary_black,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                alignment: Alignment.topLeft,
                width: 35,
                height: 35,
                child: Center(
                  child:popup_menu_button_main(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

