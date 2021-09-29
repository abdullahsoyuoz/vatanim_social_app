import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vatanim_app/Data/FakeData.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Decorations.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
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
            'Hareketler',
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bugün',
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        iconPathHareketlerIcon,
                        fit: BoxFit.fitWidth,
                        height: 25,
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage(fakeUserList[index].profilePhotoUrl),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'vatanim',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Gönderisine yorum yaptı',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey.shade800,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'şimdi',
                          style: GoogleFonts.montserrat(
                              color: Colors.grey.shade800,
                              fontSize: 10,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  );
                },
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bu Hafta',
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        iconPathHareketlerIcon,
                        fit: BoxFit.fitWidth,
                        height: 25,
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage(fakeUserList[index].profilePhotoUrl),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'vatanim',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Gönderisine yorum yaptı',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey.shade800,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'şimdi',
                          style: GoogleFonts.montserrat(
                              color: Colors.grey.shade800,
                              fontSize: 10,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
