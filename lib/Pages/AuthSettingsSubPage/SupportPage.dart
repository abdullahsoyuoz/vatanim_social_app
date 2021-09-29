import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Colors.dart';
import 'package:vatanim_app/Utility/Decorations.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class SupoortPage extends StatefulWidget {
  @override
  _SupoortPageState createState() => _SupoortPageState();
}

class _SupoortPageState extends State<SupoortPage> {
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
            'Yardım',
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
                
              },
              highlightedBorderColor: appColorMainRed,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Image.asset(iconPathStarRounded, width: 25, height: 25,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Sorun Bildir', style: GoogleFonts.montserrat(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: OutlineButton(
                onPressed: () {
                  
                },
                highlightedBorderColor: appColorMainRed,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Image.asset(iconPathSupportHearth, width: 25, height: 25,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Yardım Merkezi', style: GoogleFonts.montserrat(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: OutlineButton(
                onPressed: () {
                  
                },
                highlightedBorderColor: appColorMainRed,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Image.asset(iconPathClock, width: 25, height: 25,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Destek Talepleri', style: GoogleFonts.montserrat(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600)),
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