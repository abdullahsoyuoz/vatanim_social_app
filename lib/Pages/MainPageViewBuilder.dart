import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:vatanim_app/Data/FakeData.dart';
import 'package:vatanim_app/Pages/Auth/LoginPage.dart';
import 'package:vatanim_app/Pages/AuthSettingsSubPage/AboutPage.dart';
import 'package:vatanim_app/Pages/AuthSettingsSubPage/ArchivePage.dart';
import 'package:vatanim_app/Pages/AuthSettingsSubPage/EditProfilePage.dart';
import 'package:vatanim_app/Pages/AuthSettingsSubPage/PrivacyPage.dart';
import 'package:vatanim_app/Pages/AuthSettingsSubPage/SavesPage.dart';
import 'package:vatanim_app/Pages/AuthSettingsSubPage/SettingsPage.dart';
import 'package:vatanim_app/Pages/AuthSettingsSubPage/SupportPage.dart';
import 'package:vatanim_app/Pages/AuthSettingsSubPage/TimelinePage.dart';
import 'package:vatanim_app/Pages/Home/AddPage.dart';
import 'package:vatanim_app/Pages/Home/HomePage.dart';
import 'package:vatanim_app/Pages/Home/ProfilePage.dart';
import 'package:vatanim_app/Pages/Home/SearchPage.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Colors.dart';
import 'package:vatanim_app/Utility/CustomPainter.dart';
import 'package:vatanim_app/Utility/Decorations.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class MainPageView extends StatefulWidget {
  @override
  MainPageViewState createState() => MainPageViewState();
}

class MainPageViewState extends State<MainPageView> {
  ZoomDrawerController zoomDrawerController = new ZoomDrawerController();
  SnappingSheetController snappingSheetController;
  PageController pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    snappingSheetController = SnappingSheetController();
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(this),
      SearchPage(),
      AddPage(),
      ProfilePage(this),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      resizeToAvoidBottomInset: false,
      body: SnappingSheet(
        snappingSheetController: snappingSheetController,
        grabbingHeight: 0,
        initSnapPosition: SnapPosition(positionPixel: 0),
        lockOverflowDrag: true,
        sheetBelow:
            SnappingSheetContent(draggable: true, child: buildSnappingSheet()),
        child: Container(
          child: ZoomDrawer(
            controller: zoomDrawerController,
            mainScreenScale: 0.20,
            style: DrawerStyle.DefaultStyle,
            menuScreen: buildZoomDrawerMenu(),
            mainScreen: Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: pages.length,
                  itemBuilder: (context, index) => pages[currentPageIndex],
                  onPageChanged: (value) {
                    setState(() {
                      currentPageIndex = value;
                    });
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: getSize(context),
                    height: 70,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Positioned(
                          top: 20,
                          child: CustomPaint(
                            painter: NavBarPainter(getSize(context)),
                            child: buildNavBar(),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topCenter,
                            child: IconButton(
                              onPressed: () {},
                              icon: Center(
                                  child: Image.asset(iconPathLogoVatanim)),
                              padding: EdgeInsets.zero,
                              splashRadius: 1,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildZoomDrawerMenu() {
    List<Widget> menuItems = [
      FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ArchivePage(),
              ));
        },
        child: Row(
          children: [
            Image.asset(
              iconPathArchive,
              width: 25,
              color: Colors.white.withOpacity(.6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Arşiv',
                style: GoogleFonts.montserrat(
                    color: Colors.white.withOpacity(.6),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => TimelinePage(),
              ));
        },
        child: Row(
          children: [
            Image.asset(
              iconPathClockSync,
              width: 25,
              color: Colors.white.withOpacity(.6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Hareketler',
                style: GoogleFonts.montserrat(
                    color: Colors.white.withOpacity(.6),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    '24',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => PrivacyPage(),
              ));
        },
        child: Row(
          children: [
            Image.asset(
              iconPathGizlilikIcon,
              width: 25,
              color: Colors.white.withOpacity(.6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Gizlilik',
                style: GoogleFonts.montserrat(
                    color: Colors.white.withOpacity(.6),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => SavesPage(),
              ));
        },
        child: Row(
          children: [
            Image.asset(
              iconPathBookmarkWhite,
              width: 25,
              color: Colors.white.withOpacity(.6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Kaydedilenler',
                style: GoogleFonts.montserrat(
                    color: Colors.white.withOpacity(.6),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => SettingsPage(),
              ));
        },
        child: Row(
          children: [
            Image.asset(
              iconPathSettings,
              width: 25,
              color: Colors.white.withOpacity(.6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Ayarlar',
                style: GoogleFonts.montserrat(
                    color: Colors.white.withOpacity(.6),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => SupoortPage(),
              ));
        },
        child: Row(
          children: [
            Image.asset(
              iconPathHelp,
              width: 25,
              color: Colors.white.withOpacity(.6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Yardım',
                style: GoogleFonts.montserrat(
                    color: Colors.white.withOpacity(.6),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => AboutPage(),
              ));
        },
        child: Row(
          children: [
            Image.asset(
              iconPathAbout,
              width: 25,
              color: Colors.white.withOpacity(.6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Hakkında',
                style: GoogleFonts.montserrat(
                    color: Colors.white.withOpacity(.6),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    ];
    return Container(
      width: getSize(context),
      height: MediaQuery.of(context).size.height,
      decoration: decorationBackgroundRed,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: getSize(context) * 0.7,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 15,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: appColorMainRed,
                      child: Image.asset(
                        currentUser.profilePhotoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentUser.name,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => EditProfilePage(),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  iconPathEditProfile,
                                  color: Colors.white.withOpacity(.6),
                                  width: 15,
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: Text(
                                    'Profili Düzenle',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(.6),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: Icon(
                                    FontAwesomeIcons.chevronDown,
                                    size: 15,
                                    color: Colors.white.withOpacity(.6),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 15),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: menuItems,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    splashColor: appColorRedLighter,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(
                            color: Colors.white.withOpacity(.6), width: 1)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                          (route) => false);
                    },
                    child: Center(
                        child: Text(
                      'Çıkış Yap',
                      style: GoogleFonts.montserrat(
                          color: Colors.white.withOpacity(.6),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavBar() {
    return SizedBox(
      width: getSize(context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  currentPageIndex = 0;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  child: Center(
                    child: AnimatedCrossFade(
                      duration: Duration(milliseconds: 250),
                      crossFadeState: currentPageIndex == 0
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Image.asset(
                        iconPathNavHomeSelected,
                        fit: BoxFit.contain,
                        width: 25,
                        height: 25,
                      ),
                      secondChild: Image.asset(
                        iconPathNavHomeUnSelected,
                        fit: BoxFit.contain,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  currentPageIndex = 1;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  child: Center(
                    child: AnimatedCrossFade(
                      duration: Duration(milliseconds: 250),
                      crossFadeState: currentPageIndex == 1
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Image.asset(
                        iconPathNavSearchSelected,
                        fit: BoxFit.contain,
                        width: 25,
                        height: 25,
                      ),
                      secondChild: Image.asset(
                        iconPathNavSearchUnSelected,
                        fit: BoxFit.contain,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              child: InkWell(
                onTap: () {
                  currentPageIndex = 2;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  child: Center(
                    child: AnimatedCrossFade(
                      duration: Duration(milliseconds: 250),
                      crossFadeState: currentPageIndex == 2
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Image.asset(
                        iconPathNavAddSelected,
                        fit: BoxFit.contain,
                        width: 25,
                        height: 25,
                      ),
                      secondChild: Image.asset(
                        iconPathNavAddUnSelected,
                        fit: BoxFit.contain,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  currentPageIndex = 3;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  child: Center(
                    child: AnimatedCrossFade(
                      duration: Duration(milliseconds: 250),
                      crossFadeState: currentPageIndex == 3
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Image.asset(
                        iconPathNavUserSelected,
                        fit: BoxFit.contain,
                        width: 25,
                        height: 25,
                      ),
                      secondChild: Image.asset(
                        iconPathNavUserUnSelected,
                        fit: BoxFit.contain,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSnappingSheet() {
    return Container(
      height: 300,
      width: getSize(context),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              width: 70,
              height: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(100)),
            ),
          ),
          Container(
            width: getSize(context),
            height: 75,
            padding: const EdgeInsets.all(10.0),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 65,
                  width: 65,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        fakePostList[0].imageUrl,
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Mesaj yaz...'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade300,
              ),
              itemBuilder: (context, index) {
                var item = fakeUserList[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(item.profilePhotoUrl),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(item.id.toString())
                            ],
                          ),
                        )
                      ],
                    ),
                    FlatButton(
                        color: appColorMainRed,
                        height: 25,
                        minWidth: 30,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        onPressed: () {},
                        child: Text('Gönder',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                            )))
                  ],
                );
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
