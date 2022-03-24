// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management/Custom_icons.dart';
import 'package:money_management/main.dart';
import 'package:money_management/screens/controller.dart';
import 'package:sizer/sizer.dart';

Positioned bottomNavigation_buttons() {
    return Positioned(
      //bottom navigation bar
      bottom: 0,
      left: 0,
      child: SizedBox(
        width: 100.w,
        height: 7.5.h,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(100.w, 7.5.h),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.2,
              child: FloatingActionButton(
                  backgroundColor: Styles.primary_black,
                  child: Tooltip(
                    message: "Add new item +",
                    child: Icon(
                      Icons.add,
                      size: 10.w,
                    ),
                  ),
                  elevation: 0.2,
                  onPressed: () {
                    dataControl.addButton == false
                        ? dataControl.addButton = true
                        : dataControl.addButton = false;
                    dataControl.update();
                  }),
            ),
            SizedBox(
              width: 100.w,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tooltip(
                    message: "List your Income",
                    child: IconButton(
                      icon: Obx(() => Icon(
                            Custom_icons.income,
                            color: dataControl.currentIndex.value == 0
                                ? Styles.primary_black
                                : Colors.grey.shade400,
                          )),
                      onPressed: () {
                        dataControl.navigation_control(1);
                        setBottomBarIndex(0);
                      },
                      splashColor: Colors.white,
                    ),
                  ),
                  Tooltip(
                    message: "List your Expense",
                    child: IconButton(
                        icon: Obx(() => Icon(
                              Custom_icons.expense,
                              color: dataControl.currentIndex.value == 1
                                  ? Styles.primary_black
                                  : Colors.grey.shade400,
                            )),
                        onPressed: () {
                          dataControl.navigation_control(2);
                          setBottomBarIndex(1);
                        }),
                  ),
                  Container(
                    width: 20.w,
                  ),
                  Tooltip(
                    message: "List your lend",
                    child: IconButton(
                        icon: Obx(() => Icon(
                              Custom_icons.lend,
                              color: dataControl.currentIndex.value == 2
                                  ? Styles.primary_black
                                  : Colors.grey.shade400,
                            )),
                        onPressed: () {
                          dataControl.navigation_control(3);
                          setBottomBarIndex(2);
                        }),
                  ),
                  Tooltip(
                    message: "List your borrow",
                    child: IconButton(
                        icon: Obx(() => Icon(
                              Custom_icons.borrow,
                              color: dataControl.currentIndex.value == 3
                                  ? Styles.primary_black
                                  : Colors.grey.shade400,
                            )),
                        onPressed: () {
                          dataControl.navigation_control(4);
                          setBottomBarIndex(3);
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
setBottomBarIndex(index) {
    /*  setState(() { */
    dataControl.currentIndex.value = index;
    /*     super.setState(() {});
    }); */
  }
 class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 10); // Start
    path.quadraticBezierTo(20.w, 0, 35.w, 0);
    path.quadraticBezierTo(40.w, 0, 40.w, 10);
    path.arcToPoint(
      Offset(60.w, 2.w),
      radius: Radius.circular(10.08.w),
      clockwise: false,
    );
    path.quadraticBezierTo(60.w, 0, 65.w, 0);
    path.quadraticBezierTo(80.w, 0, 100.w, 10);
    path.lineTo(100.w, 100.h);
    path.lineTo(0, 100.h);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
