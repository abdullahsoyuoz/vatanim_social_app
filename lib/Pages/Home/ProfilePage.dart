import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vatanim_app/Data/FakeData.dart';
import 'package:vatanim_app/Data/FakeModel.dart';
import 'package:vatanim_app/Pages/MainPageViewBuilder.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Colors.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class ProfilePage extends StatefulWidget {
  MainPageViewState mpvState;
  ProfilePage(this.mpvState);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedView = 0; // listView, gridView, taggedView

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: WithoutGlow(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: getSize(context),
            height: MediaQuery.of(context).size.height,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 20, bottom: 75),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: buildStoryItemMe()),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade300))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${currentUser.name}',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.grey.shade700,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Image.asset(
                                        iconPathLock,
                                        height: 25,
                                        width: 25,
                                        color: Colors.grey.shade500,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text('334',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text('Gönderi',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text('500K',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text('Takipçi',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text('134',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text('Takip',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${currentUser.name}',
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                      Text('benim köyüm bir başka güzeldir',
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      InkWell(
                        onTap: () {},
                        child: Text('vatanim.com',
                            style: GoogleFonts.montserrat(
                                color: Colors.blueAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: OutlineButton(
                    onPressed: () {
                      widget.mpvState.zoomDrawerController.open();
                    },
                    visualDensity: VisualDensity.compact,
                    child: Row(
                      children: [
                        Text(
                          'Hesap Ayarları',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Image.asset(
                            iconPathSettings,
                            color: Colors.black,
                            width: 20,
                            height: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 65,
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: fakeStoriesList.length,
                    itemBuilder: (context, index) {
                      var item = fakeStoriesList[index];
                      return buildStorieItem(item);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
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
                                        bottom: BorderSide(
                                            color: Colors.black, width: 2))
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
                                        bottom: BorderSide(
                                            color: Colors.black, width: 2))
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
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedView = 2;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 250),
                            padding: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                border: selectedView == 2
                                    ? Border(
                                        bottom: BorderSide(
                                            color: Colors.black, width: 2))
                                    : Border(
                                        bottom: BorderSide(
                                        color: Colors.grey.shade300,
                                      ))),
                            child: Image.asset(
                              iconPathCatalogUser,
                              color: selectedView == 2
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
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                )
              ],
            ),
          )),
    );
  }

  Widget buildStoryItemMe() {
    return Container(
      height: getSize(context) / 3,
      width: getSize(context) / 3,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CircleAvatar(
              radius: getSize(context) / 8,
              backgroundColor: appColorMainRed,
              child: CircleAvatar(
                radius: getSize(context) / 9,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(currentUser.profilePhotoUrl),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  iconPathStarCircle,
                  height: 32,
                  width: 32,
                ),
              )),
        ],
      ),
    );
  }

  Widget buildStorieItem(FakeStories item) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 25,
                      child: Image.asset(
                        iconPathStoryFrame,
                      )),
                ),
                Positioned(
                  left: 6,
                  top: 10,
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 18,
                      backgroundImage: NetworkImage(
                        item.user.profilePhotoUrl,
                      )),
                ),
              ],
            ),
          ),
          Container(
            height: 15,
            width: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  item.user.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
