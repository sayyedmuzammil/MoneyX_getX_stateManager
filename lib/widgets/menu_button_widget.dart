// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:money_management/constant_design.dart';
import 'package:money_management/screens/Settings.dart';
import 'package:money_management/screens/Sign%20Up_Screen.dart';
import 'package:money_management/controller.dart';
// import 'package:url_launcher/url_launcher.dart';


PopupMenuButton<int> popup_menu_button_main(BuildContext context) {

  // const String _url = 'https://flutter.dev';

  return PopupMenuButton(
    color: Styles.primary_black,
    icon: const Icon(
      Icons.more_vert_outlined,
      // semanticLabel: "Menu Button",
      color: Colors.white,
      size: 20,
    ),
    itemBuilder: (context) => [
      PopupMenuItem<int>(
        
        value: 0,
        onTap: () {
          /*   setState(() { */
          //  dataControl.cardList=0;
          dataControl.currentIndex.value = null;
          dataControl.card = 0;
          dataControl.cardList.value = 0;
          //  dataControl.percentInd = false;
          dataControl.favoriteVisible == true
              ? dataControl.favoriteVisible = false
              : dataControl.favoriteVisible = true;
          dataControl.update();
          /*         }); */
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Favourites",
              style: dataControl.favoriteVisible == false
                  ? Styles.boldwhite
                  : Styles.normal17red,
            ),
            const Icon(
              Icons.favorite_outlined,
              size: 20,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
      PopupMenuItem<int>(
        onTap: () {
           share();
          // Share.share('https://play.google.com/store/apps/details?id=in.brototype.money_management');
          print("abc");
          // _launchURL();
          // Share.share('https://www.typingclub.com/');
        },
        value: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Share App",
              style: Styles.boldwhite,
            ),
            Icon(
              Icons.share_outlined,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
      PopupMenuItem<int>(
        value: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Settings",
              style: Styles.boldwhite,
            ),
            Icon(
              Icons.settings_outlined,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
      PopupMenuItem<int>(
        value: 5,
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "About",
              style: Styles.boldwhite,
            ),
            Icon(
              Icons.info_outline,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),

      /*      PopupMenuItem<int>(
                                      onTap: () {
                                    
                                        Log_out();
                                      
                                      },
                                      value: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Log Out",
                                            style: Styles.boldwhite,
                                          ),
                                          Icon(
                                            Icons.logout_outlined,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                */
    ],
    onSelected: (result) {
      if (result == 5) {
        _showAbout(context);
      }
      if (result == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsScreen()),
        );
      }
    },
  );
}

Future<dynamic> _showAbout(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AboutDialog(
        applicationName: "MoneyX",
        applicationVersion: "Version 1.1.0",
        applicationIcon: Image.asset(
          'assets/export/simple_logo.png',
          width: 50.0,
          height: 50.0,
        ),
      );
    },
  );
  
}

// void _launchURL() async {
//   print("am here");
//   if (!await launch('https://play.google.com/store/apps/details?id=in.brototype.money_management')) throw 'Could not launch https://play.google.com/store/apps/details?id=in.brototype.money_management';
// }
Future<dynamic> Log_out(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 1), () {});
  await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return const SignUp_Screen();
  }));
}

  Future<void> share() async {
    await FlutterShare.share(
      title: 'Example share',
      text: 'Share MoneyX',
      linkUrl: 'https://play.google.com/store/apps/details?id=in.brototype.money_management',
    );
  }

 
