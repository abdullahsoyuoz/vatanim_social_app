import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vatanim_app/Data/FakeData.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Colors.dart';
import 'package:vatanim_app/Utility/Decorations.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController =
      new TextEditingController(text: currentUser.name);
  TextEditingController _surnameController =
      new TextEditingController(text: currentUser.surname);
  TextEditingController _mailController =
      new TextEditingController(text: currentUser.email);
  TextEditingController _passwordController =
      new TextEditingController(text: currentUser.password);
  TextEditingController _cityController =
      new TextEditingController(text: currentUser.city);
  TextEditingController _countyController =
      new TextEditingController(text: currentUser.county);

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
          'Profil Düzenle',
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
      body: Form(
        key: _formKey,
        child: Container(
          width: getSize(context),
          height: MediaQuery.of(context).size.height,
          decoration: decorationBackgroundWhite,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: 20, 
              right: 20, 
              bottom: 30,
            ),
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 95,
                          height: 95,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade500, width: 1.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(currentUser.profilePhotoUrl),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 45, right: 45),
                          child: InkWell(
                            onTap: () {
                              
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(iconPathCamera),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      gapPadding: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: appColorMainRed),
                      gapPadding: 20,
                    ),
                    labelText: 'İsim',
                    labelStyle: GoogleFonts.montserrat(
                      color: Colors.black,
                    ),
                    alignLabelWithHint: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _surnameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      gapPadding: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: appColorMainRed),
                      gapPadding: 20,
                    ),
                    labelText: 'Soyisim',
                    labelStyle: GoogleFonts.montserrat(
                      color: Colors.black,
                    ),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _mailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      gapPadding: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: appColorMainRed),
                      gapPadding: 20,
                    ),
                    labelText: 'E-Mail',
                    labelStyle: GoogleFonts.montserrat(
                      color: Colors.black,
                    ),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      gapPadding: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: appColorMainRed),
                      gapPadding: 20,
                    ),
                    labelText: 'Şifre',
                    labelStyle: GoogleFonts.montserrat(
                      color: Colors.black,
                    ),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      gapPadding: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: appColorMainRed),
                      gapPadding: 20,
                    ),
                    labelText: 'Şehir',
                    labelStyle: GoogleFonts.montserrat(
                      color: Colors.black,
                    ),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _countyController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      gapPadding: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: appColorMainRed),
                      gapPadding: 20,
                    ),
                    labelText: 'İlçe',
                    labelStyle: GoogleFonts.montserrat(
                      color: Colors.black,
                    ),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Tümünü Kaydet',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    color: appColorMainRed,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
