import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vatanim_app/Data/FakeData.dart';
import 'package:vatanim_app/Data/FakeModel.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Colors.dart';
import 'package:vatanim_app/Utility/Decorations.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class MessageDetailPage extends StatefulWidget {
  FakeMessage item;
  MessageDetailPage(this.item);
  @override
  _MessageDetailPageState createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
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
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.item.user.profilePhotoUrl),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.item.user.name,
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 1),
                    ),
                    Text(
                      widget.item.user.isOnline ? 'Çevrimiçi' : 'Çevrimdışı',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        height: 1,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Container(
          width: getSize(context),
          height: MediaQuery.of(context).size.height,
          decoration: decorationBackgroundWhite,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    if (!index.isOdd) {
                      return buildOpponentMessageItem();
                    } else
                      return buildMessageItem(index);
                  },
                ),
              ),
              Container(
                width: getSize(context),
                height: 50,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          iconPathPicture,
                          width: 30,
                          height: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mesajınızı giriniz...'),
                      ),
                    )),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        width: 48,
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: appColorMainRed,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          iconPathMessageSend,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildOpponentMessageItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(fakeUserList[0].profilePhotoUrl),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: SizedBox(
              width: getSize(context) * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 16,
                      left: 8,
                      right: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(Faker().lorem.sentences(2).toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 3,
                      left: 2,
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${DateTime.now().hour.toString()}.${DateTime.now().minute.toString()}',
                          style: GoogleFonts.montserrat(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Icon(
                            FontAwesomeIcons.check,
                            color: Colors.grey.shade600,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildMessageItem(int index) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: SizedBox(
                width: getSize(context) * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: index == 3
                          ? EdgeInsets.zero
                          : EdgeInsets.only(
                              top: 8,
                              bottom: 16,
                              left: 8,
                              right: 8,
                            ),
                      decoration: BoxDecoration(
                        color: appColorMainRed,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: index == 3
                          ? ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: Image.network(
                                  Faker().image.image(keywords: ['natural'])))
                          : Text(
                              Faker().lorem.sentences(2).toString(),
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 3,
                        left: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${DateTime.now().hour.toString()}.${DateTime.now().minute.toString()}',
                            style: GoogleFonts.montserrat(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Icon(
                              FontAwesomeIcons.check,
                              color: Colors.grey.shade600,
                              size: 12,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              currentUser.profilePhotoUrl,
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
