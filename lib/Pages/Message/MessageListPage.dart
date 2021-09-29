import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vatanim_app/Data/FakeData.dart';
import 'package:vatanim_app/Data/FakeModel.dart';
import 'package:vatanim_app/Pages/Message/MessageDetailPage.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Decorations.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class MessageListPage extends StatefulWidget {
  @override
  _MessagePageListState createState() => _MessagePageListState();
}

class _MessagePageListState extends State<MessageListPage> {
  TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorationBackgroundWhite,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
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
              'Mesajlaşma',
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
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
            bottom: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              title: Container(
                width: getSize(context),
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 1.5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Image.asset(
                        iconPathNavSearchSelected,
                        color: Colors.grey.shade500,
                        width: 20,
                        height: 20,
                      ),
                      hintText: 'Arama'),
                ),
              ),
            ),
          ),
          body: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: fakeMessageList.length,
            itemBuilder: (context, index) {
              var item = fakeMessageList[index];
              return MessageItem(item);
            },
          )),
    );
  }
}

class MessageItem extends StatefulWidget {
  FakeMessage item;
  MessageItem(this.item);
  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  SlidableController _slidableController = new SlidableController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => MessageDetailPage(widget.item),
            ));
      },
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
        child: Slidable(
          actionPane: SlidableStrechActionPane(),
          actionExtentRatio: 0.25,
          direction: Axis.horizontal,
          controller: _slidableController,
          child: Container(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      NetworkImage(widget.item.user.profilePhotoUrl),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.item.user.name,
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.item.message,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                          style: GoogleFonts.montserrat(
                              color: Colors.grey.shade700,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          secondaryActions: [
            IconSlideAction(
              onTap: () {
                
              },
              caption: 'Sil',
              iconWidget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.white,
                ),
              ),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
