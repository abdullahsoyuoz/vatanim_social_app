import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vatanim_app/Data/FakeData.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class SavesPage extends StatefulWidget {
  @override
  _SavesPageState createState() => _SavesPageState();
}

class _SavesPageState extends State<SavesPage> {
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
              width: 30,
              height: 30,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        title: Text(
          'Kayıt Ettiklerim',
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
                      iconPathGridView,
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
            childAspectRatio: 1,
            padding: EdgeInsets.all(5),
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            children: fakePostList.map((e) {
              var item = e;
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    )),
              );
            }).toList(),
          ),
        )
    );
  }
}
