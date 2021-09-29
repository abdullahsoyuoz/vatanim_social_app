import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vatanim_app/Data/FakeData.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class ArchivePage extends StatefulWidget {
  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  int selectedView = 0;

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
                height: 30,
                width: 30,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          title: Text(
            'Arşiv',
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
          bottom: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0,
            toolbarHeight: 46,
            title: Row(
              children: [
                Container(
                  height: 36,
                  width: 20,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey.shade300,
                  ))),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedView = 0;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          border: selectedView == 0
                              ? Border(
                                  bottom:
                                      BorderSide(color: Colors.black, width: 2))
                              : Border(
                                  bottom: BorderSide(
                                  color: Colors.grey.shade300,
                                ))),
                      child: Image.asset(
                        iconPathListView,
                        color: selectedView == 0
                            ? Colors.black
                            : Colors.grey.shade300,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedView = 1;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          border: selectedView == 1
                              ? Border(
                                  bottom:
                                      BorderSide(color: Colors.black, width: 2))
                              : Border(
                                  bottom: BorderSide(
                                  color: Colors.grey.shade300,
                                ))),
                      child: Image.asset(
                        iconPathCalendarArchive,
                        color: selectedView == 1
                            ? Colors.black
                            : Colors.grey.shade300,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 36,
                  width: 20,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey.shade300,
                  ))),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          width: getSize(context),
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 0.6,
            padding: EdgeInsets.all(5),
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: fakePostList.map((e) {
              var item = e;
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: AspectRatio(
                    aspectRatio: 0.6,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                children: [
                                  Text(
                                    item.postTime.day.toString(),
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        height: 1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Nisan',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        height: 1,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              );
            }).toList(),
          ),
        ));
  }
}
