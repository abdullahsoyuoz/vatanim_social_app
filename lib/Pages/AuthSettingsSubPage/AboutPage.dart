import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Colors.dart';
import 'package:vatanim_app/Utility/Decorations.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
              width: 25,
              height: 25,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        title: Text(
          'Hakkında',
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
              onPressed: () {},
              highlightedBorderColor: appColorMainRed,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Image.asset(
                    iconPathUpdate,
                    width: 25,
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Uygulama Güncellemeleri',
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: OutlineButton(
                onPressed: () {},
                highlightedBorderColor: appColorMainRed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      iconPathExternalWorld,
                      width: 25,
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Veri İlkesi',
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: OutlineButton(
                onPressed: () {},
                highlightedBorderColor: appColorMainRed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      iconPathKullanimKosullari,
                      width: 25,
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Kullanım Koşulları',
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600)),
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
