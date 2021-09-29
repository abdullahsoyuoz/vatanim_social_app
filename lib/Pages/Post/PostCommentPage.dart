import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:readmore/readmore.dart';
import 'package:vatanim_app/Data/FakeData.dart';
import 'package:vatanim_app/Data/FakeModel.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Colors.dart';
import 'package:vatanim_app/Utility/Decorations.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class PostCommentPage extends StatefulWidget {
  FakePost item;
  PostCommentPage(this.item);
  @override
  _PostCommentPageState createState() => _PostCommentPageState();
}

class _PostCommentPageState extends State<PostCommentPage> {
  TextEditingController _commentController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
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
          'Yorumlar',
          style: GoogleFonts.montserrat(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              iconPathBackAlt,
              height: 30,
              width: 30,
            ),
          )
        ],
      ),
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        decoration: decorationBackgroundWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: getSize(context),
              height: 60,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.item.imageUrl),
                    radius: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: SizedBox()),
                        Text(widget.item.user.name,
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        Expanded(
                            child: Text('2s önce',
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        widget.item.description,
                        style: GoogleFonts.montserrat(
                            color: Colors.black, fontWeight: FontWeight.w300),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: fakeCommentList.length,
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  var item = fakeCommentList[index];
                  return CommentItem(item, index);
                },
              ),
            ),
            Container(
              width: getSize(context),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.grey.shade400)),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(currentUser.profilePhotoUrl),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '${currentUser.name} olarak yorum yap...'),
                    ),
                  )),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      iconPathMessageSend,
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentItem extends StatefulWidget {
  FakeComment item;
  int parentIndex;
  CommentItem(this.item, this.parentIndex);
  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool hasLiked = false;
  bool hasSubCommmentExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.item.user.profilePhotoUrl),
            radius: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.user.name,
                        style: GoogleFonts.montserrat(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: ReadMoreText(
                            widget.item.message,
                            trimLines: 1,
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                            colorClickableText: Colors.grey,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'devamı',
                            trimExpandedText: 'kapat',
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Image.asset(
                              iconPathComment,
                              width: 25,
                              height: 25,
                            ),
                          ),
                          LikeButton(
                            isLiked: hasLiked,
                            circleSize: 25,
                            size: 25,
                            onTap: onLikeButtonTapped,
                            likeBuilder: (isLiked) {
                              return Icon(
                                isLiked
                                    ? FontAwesomeIcons.solidHeart
                                    : FontAwesomeIcons.heart,
                                color: isLiked ? appColorMainRed : Colors.black,
                                size: 20,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.item.timeInterval}s önce',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          '${widget.item.likeCount} beğenme',
                          style: GoogleFonts.montserrat(
                              color: Colors.grey.shade600, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                  widget.item.subComments.isNotEmpty
                      ? FlatButton(
                          onPressed: () {
                            setState(() {
                              hasSubCommmentExpanded = !hasSubCommmentExpanded;
                            });
                          },
                          visualDensity: VisualDensity.compact,
                          color: Colors.grey.shade400,
                          child: Text(
                            hasSubCommmentExpanded
                                ? 'Yanıtları Gizle'
                                : '${widget.item.subComments.length} yorumu gör',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : SizedBox(),
                  hasSubCommmentExpanded && widget.item.subComments.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.item.subComments.length,
                          itemBuilder: (context, index) {
                            var item = widget.item.subComments[index];
                            return SubCommentItem(item);
                          },
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubCommentItem extends StatefulWidget {
  FakeComment item;
  SubCommentItem(this.item);

  @override
  _SubCommentItemState createState() => _SubCommentItemState();
}

class _SubCommentItemState extends State<SubCommentItem> {
  bool hasSubLiked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.item.user.profilePhotoUrl),
          radius: 15,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.user.name,
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: ReadMoreText(
                          widget.item.message,
                          trimLines: 1,
                          colorClickableText: Colors.grey,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'devamı',
                          trimExpandedText: 'kapat',
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${widget.item.timeInterval}s önce',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        '${widget.item.likeCount} beğenme',
                        style: GoogleFonts.montserrat(
                            color: Colors.grey.shade600, fontSize: 12),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                iconPathComment,
                width: 25,
                height: 25,
              ),
            ),
            LikeButton(
              isLiked: hasSubLiked,
              circleSize: 25,
              size: 25,
              onTap: onLikeButtonTapped,
              likeBuilder: (isLiked) {
                return Icon(
                  isLiked
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: isLiked ? appColorMainRed : Colors.black,
                  size: 20,
                );
              },
            ),
          ],
        )
      ],
    );
  }
}

Future<bool> onLikeButtonTapped(bool isLiked) async {
  /// send your request here
  // final bool success= await sendRequest();

  /// if failed, you can do nothing
  // return success? !isLiked:isLiked;
  return !isLiked;
}
