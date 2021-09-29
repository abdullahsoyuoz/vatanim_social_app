import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:readmore/readmore.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:vatanim_app/Data/FakeData.dart';
import 'package:vatanim_app/Data/FakeModel.dart';
import 'package:vatanim_app/Pages/MainPageViewBuilder.dart';
import 'package:vatanim_app/Pages/Message/MessageListPage.dart';
import 'package:vatanim_app/Pages/Post/PostCommentPage.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Colors.dart';
import 'package:vatanim_app/Utility/Utility.dart';
import 'package:vatanim_app/Widget/GhostLike.dart';

class HomePage extends StatefulWidget {
  MainPageViewState mpvState;
  HomePage(this.mpvState);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  SnappingSheetController snappingSheetController;

  @override
  void initState() {
    super.initState();
    snappingSheetController = SnappingSheetController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: WithoutGlow(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 0,
          centerTitle: false,
          titleSpacing: 10,
          title: Row(
            children: [
              Image.asset(
                iconPathLogoSolidVatanim,
                color: appColorMainRed,
                width: 40,
                height: 40,
                fit: BoxFit.fitHeight,
              ),
              Text(
                'Vatanım',
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {
                  setState(() {});
                },
                child: Center(
                  child: Badge(
                    badgeContent: Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Image.asset(
                      iconPathNotify,
                      width: 25,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => MessageListPage(),
                        ));
                  });
                },
                child: Center(
                  child: Badge(
                    badgeContent: Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Image.asset(
                      iconPathMessageSend,
                      width: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          width: getSize(context),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 65,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: fakeStoriesList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return buildStoryItemMe();
                    }
                    var item = fakeStoriesList[index - 1];
                    return buildStorieItem(item);
                  },
                ),
              ),
              Divider(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  bottom: 60,
                ),
                itemCount: fakePostList.length,
                itemBuilder: (context, index) {
                  var item = fakePostList[index];
                  return PostItem(item, widget.mpvState);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStoryItemMe() {
    return Container(
      height: 75,
      margin: EdgeInsets.only(right: 10),
      width: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage(currentUser.profilePhotoUrl),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10,
                      child: Image.asset(
                        iconPathStarCircle,
                        width: 20,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            height: 15,
            width: 50,
            padding: EdgeInsets.only(top: 1),
            child: Center(
              child: Text('Sen'),
            ),
          )
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

class PostItem extends StatefulWidget {
  FakePost item;
  MainPageViewState mpvState;
  PostItem(this.item, this.mpvState);
  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  TextEditingController commentController = new TextEditingController();
  bool hasLiked = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage:
                        NetworkImage(widget.item.user.profilePhotoUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      widget.item.user.name,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              IconButton(
                icon: Image.asset(
                  iconPathMenuCircles,
                  width: 20,
                  height: 20,
                ),
                iconSize: 20,
                splashRadius: 20,
                onPressed: () {},
              )
            ],
          ),
          Container(
            width: getSize(context),
            constraints: BoxConstraints(
              maxHeight: 300,
              maxWidth: getSize(context),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GhostLike(
                width: getSize(context),
                isLiked: hasLiked,
                iconData: FontAwesomeIcons.solidHeart,
                onDoubleTap: () {
                  setState(() {
                    hasLiked = !hasLiked;
                  });
                },
                child: Image.network(
                  widget.item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       wasLiked = !wasLiked;
                  //     });
                  //   },
                  //   // icon: Image.asset(
                  //   //   wasLiked ? iconPathLike : iconPathLikeAlt,
                  //   //   width: 30,
                  //   //   height: 30,
                  //   //   color: wasLiked ? appColorMainRed : Colors.black,
                  //   //   fit: BoxFit.fitHeight,
                  //   // ),
                  //   icon: Icon(
                  //     wasLiked
                  //         ? FontAwesomeIcons.solidHeart
                  //         : FontAwesomeIcons.heart,
                  //     color: wasLiked ? appColorMainRed : Colors.black,
                  //     size: 25,
                  //   ),
                  //   iconSize: 30,
                  //   padding: EdgeInsets.zero,
                  //   splashColor: Colors.transparent,
                  //   splashRadius: 20,
                  //   visualDensity: VisualDensity.compact,
                  // ),
                  SizedBox(
                    height: 30,
                    width: 35,
                    child: LikeButton(
                      isLiked: hasLiked,
                      circleSize: 30,
                      size: 30,
                      onTap: onLikeButtonTapped,
                      likeBuilder: (isLiked) {
                        return Icon(
                          isLiked
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: isLiked ? appColorMainRed : Colors.black,
                          size: 23,
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PostCommentPage(widget.item),
                          ));
                    },
                    icon: Image.asset(
                      iconPathComment,
                      width: 30,
                      height: 30,
                      color: Colors.black,
                    ),
                    iconSize: 30,
                    splashRadius: 20,
                    visualDensity: VisualDensity.compact,
                  ),
                  IconButton(
                    onPressed: () {
                      // setState(() {
                      //   widget.mpvState.snappingSheetController
                      //       .snapToPosition(SnapPosition(positionPixel: 400));
                      // });
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return buildShowModalBottomSheet();
                        },
                      );
                    },
                    icon: Image.asset(
                      iconPathMessageSendAlt,
                      width: 30,
                      height: 30,
                      fit: BoxFit.fitWidth,
                      color: Colors.black,
                    ),
                    iconSize: 30,
                    splashRadius: 20,
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              IconButton(
                icon: Image.asset(
                  iconPathBookmarkBlack,
                  width: 30,
                  height: 30,
                ),
                iconSize: 30,
                splashRadius: 20,
                onPressed: () {},
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.item.likedUserList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            widget.item.likedUserList[index].profilePhotoUrl),
                      ),
                    );
                  },
                ),
                width: 35,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Beğenenleri Gör',
                  style: GoogleFonts.montserrat(
                      height: 1,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: ReadMoreText(
              widget.item.description,
              trimLines: 1,
              colorClickableText: Colors.grey,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'devamı',
              trimExpandedText: 'kapat',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: InkWell(
              onTap: () {},
              child: Text(
                '${widget.item.comments.length} yorumun tümünü gör',
                style: GoogleFonts.montserrat(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage:
                      NetworkImage(widget.item.user.profilePhotoUrl),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextField(
                      controller: commentController,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Yorum Ekle...',
                          hintStyle: GoogleFonts.montserrat(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    return !isLiked;
  }

  Widget buildShowModalBottomSheet() {
    return Container(
      width: getSize(context),
      height: 500,
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
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10),
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
          Container(
            width: getSize(context),
            height: 75,
            padding: const EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
        ],
      ),
    );
  }
}
