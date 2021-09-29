import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vatanim_app/Pages/MainPageViewBuilder.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Colors.dart';
import 'package:vatanim_app/Utility/Decorations.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nicknameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  MaskTextInputFormatter _phoneNumberMask = new MaskTextInputFormatter(mask: '### ### ## ##');
  int selectedSelectorIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _nicknameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: WithoutGlow(),
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: Container(
            width: getSize(context),
            height: MediaQuery.of(context).size.height,
            decoration: decorationBackgroundRed,
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    bottom: 40,
                    left: 30,
                    right: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        iconPathLogoSolidVatanim,
                        color: Colors.white,
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        'Vatanım',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: buildLoginRegisterSelector(0, 'GİRİŞ YAP')),
                      Expanded(
                          child: buildLoginRegisterSelector(1, 'KAYIT OL')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 20,
                    right: 20,
                  ),
                  child: AnimatedCrossFade(
                    duration: Duration(milliseconds: 250),
                    crossFadeState: selectedSelectorIndex == 0
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: buildLoginController(),
                    secondChild: buildRegisterController(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginController() {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Text(
          'Kullanıcı Adı',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: _nicknameController,
          style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w200),
          decoration: InputDecoration(
            hintText: 'kullanıcı adınızı giriniz',
            hintStyle: GoogleFonts.montserrat(color: Colors.white.withOpacity(.6), fontWeight: FontWeight.w200),
            prefixIconConstraints: BoxConstraints.tight(Size(20, 20)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.asset(
                iconPathUser,
                width: 14,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1)),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.white.withOpacity(.3), width: 1)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Text(
            'Şifre',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w200),
          decoration: InputDecoration(
            hintText: 'şifrenizi giriniz',
            hintStyle: GoogleFonts.montserrat(color: Colors.white.withOpacity(.6), fontWeight: FontWeight.w200),
            prefixIconConstraints: BoxConstraints.tight(Size(20, 20)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.asset(
                iconPathPassword,
                width: 14,
              ),
            ),
            suffixIcon: FlatButton(
              child: Text(
                'Unuttum?',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onPressed: () {},
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1)),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.white.withOpacity(.3), width: 1)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 1,
            right: 1,
          ),
          child: OutlineButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => MainPageView(),
                  ),
                  (route) => false);
            },
            textColor: Colors.white,
            highlightedBorderColor: appColorMainRed,
            borderSide: BorderSide(width: 2, color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text('Giriş Yap'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  iconPathFacebook,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  iconPathGoogle,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  iconPathApple,
                  color: Colors.white,
                ),
              ),
              Text('ile giriş olabilirsiniz.',
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.w300)),
            ],
          ),
        )
      ],
    );
  }

  Widget buildRegisterController() {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Text(
          'Kullanıcı Adı',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: _nicknameController,
          style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w200),
          decoration: InputDecoration(
            hintText: 'kullanıcı adınızı belirleyiniz',
            hintStyle: GoogleFonts.montserrat(color: Colors.white.withOpacity(.6), fontWeight: FontWeight.w200),
            prefixIconConstraints: BoxConstraints.tight(Size(20, 20)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.asset(
                iconPathUser,
                width: 14,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1)),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.white.withOpacity(.3), width: 1)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Text(
            'Şifre',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w200),
          decoration: InputDecoration(
            hintText: 'şifrenizi belirleyiniz',
            hintStyle: GoogleFonts.montserrat(color: Colors.white.withOpacity(.6), fontWeight: FontWeight.w200),
            prefixIconConstraints: BoxConstraints.tight(Size(20, 20)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.asset(
                iconPathPassword,
                width: 14,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1)),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.white.withOpacity(.3), width: 1)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Text(
            'Telefon Numarası',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFormField(
          controller: _phoneNumberController,
          style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w200),
          inputFormatters: [_phoneNumberMask],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'telefon numaranızı giriniz',
            hintStyle: GoogleFonts.montserrat(color: Colors.white.withOpacity(.6), fontWeight: FontWeight.w200),
            prefixIconConstraints: BoxConstraints.tight(Size(20, 20)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.asset(
                iconPathPhone,
                width: 14,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1)),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.white.withOpacity(.3), width: 1)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 1,
            right: 1,
          ),
          child: OutlineButton(
            onPressed: () {},
            textColor: Colors.white,
            highlightedBorderColor: appColorMainRed,
            borderSide: BorderSide(width: 2, color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text('Kayıt Ol'),
          ),
        ),
      ],
    );
  }

  Widget buildLoginRegisterSelector(int index, String title) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedSelectorIndex = index;
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.white,
                    width: selectedSelectorIndex == index ? 4 : 0.5))),
        child: AnimatedDefaultTextStyle(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 250),
          style: GoogleFonts.montserrat(
            color: selectedSelectorIndex == index
                ? Colors.white
                : Colors.white.withOpacity(.3),
            fontSize: 18,
            fontWeight: selectedSelectorIndex == index
                ? FontWeight.w600
                : FontWeight.w500,
          ),
          child: Text(
            '$title',
          ),
        ),
      ),
    );
  }
}
