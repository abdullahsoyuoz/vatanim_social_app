import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Colors.dart';
import 'package:vatanim_app/Utility/Decorations.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool switchPrivacy = false;
  bool switchCooments = false;
  bool switchPosts = false;
  bool switchTagged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Center(
            child: Image.asset(
              iconPathBack,
              width: 30,
              height: 30,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        title: Text(
          'Gizlilik',
          style: GoogleFonts.montserrat(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              iconPathBackAlt,
              height: 25,
              width: 25,
            ),
          )
        ],
      ),
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        decoration: decorationBackgroundWhite,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          children: [
            OutlineButton(
              onPressed: () {
                setState(() {
                        switchPrivacy = !switchPrivacy;
                      });
              },
              highlightedBorderColor: appColorMainRed,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              visualDensity: VisualDensity.compact,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        iconPathSettings,
                        color: Colors.black,
                        width: 25,
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Hesap Gizliliği',
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                  CupertinoSwitch(
                    onChanged: (value) {
                      setState(() {
                        switchPrivacy = !switchPrivacy;
                      });
                    },
                    value: switchPrivacy,
                    activeColor: appColorMainRed,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: OutlineButton(
                onPressed: () {
                  setState(() {
                        switchCooments = !switchCooments;
                      });
                },
                highlightedBorderColor: appColorMainRed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                visualDensity: VisualDensity.compact,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          iconPathComment,
                          width: 25,
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Yorumlar',
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)),
                        )
                      ],
                    ),
                    CupertinoSwitch(
                    onChanged: (value) {
                      setState(() {
                        switchCooments = !switchCooments;
                      });
                    },
                    value: switchCooments,
                    activeColor: appColorMainRed,
                  )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: OutlineButton(
                onPressed: () {
                  setState(() {
                        switchPosts = !switchPosts;
                      });
                },
                highlightedBorderColor: appColorMainRed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                visualDensity: VisualDensity.compact,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          iconPathNavAddUnSelected,
                          width: 25,
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Gönderiler',
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)),
                        )
                      ],
                    ),
                    CupertinoSwitch(
                    onChanged: (value) {
                      setState(() {
                        switchPosts = !switchPosts;
                      });
                    },
                    value: switchPosts,
                    activeColor: appColorMainRed,
                  )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: OutlineButton(
                onPressed: () {
                  setState(() {
                        switchTagged = !switchTagged;
                      });
                },
                highlightedBorderColor: appColorMainRed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                visualDensity: VisualDensity.compact,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          iconPathUserCircle,
                          width: 25,
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Bahsetmeler',
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)),
                        )
                      ],
                    ),
                    CupertinoSwitch(
                    onChanged: (value) {
                      setState(() {
                        switchTagged = !switchTagged;
                      });
                    },
                    value: switchTagged,
                    activeColor: appColorMainRed,
                  )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
