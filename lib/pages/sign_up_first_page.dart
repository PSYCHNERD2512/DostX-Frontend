import 'package:dostx/CustomRouteBuilder.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../palette.dart';
import '../custom_widgets.dart';
import 'sign_up_second_page.dart';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../globals.dart';

class SignUpFirst extends StatefulWidget {
  final bool isProfileEdit;
  const SignUpFirst({Key? key, this.isProfileEdit = false}) : super(key: key);

  @override
  State<SignUpFirst> createState() => _SignUpFirstState();
}

class _SignUpFirstState extends State<SignUpFirst> {
  String? selectedGender;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    var profileBox = Hive.box('ProfileBox');
    if(widget.isProfileEdit){
      _firstNameController.text = profileBox.get('first_name');
      _lastNameController.text = profileBox.get('last_name');
      selectedGender = profileBox.get('gender');
      _ageController.text = profileBox.get('age').toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: ColorOptions.skin),
        child: Stack(
          children: [
            Column(
              children: [SizedBox(height: (0.03+0.011)* screenHeight(context,),),
                Center(
                  child: SvgPicture.asset(
                    "assets/svg/grandfather.svg",
                    height: 0.33 * screenHeight(context),
                  ),),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 0.36 * screenHeight(context),
                    color: Colors.transparent,
                  ),
                  Container(
                    width: screenWidth(context),
                    height: MediaQuery.of(context).size.height -
                        (0.36) * screenHeight(context),

                    decoration: const BoxDecoration(
                      color: ColorOptions.whitish,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          30,
                        ),
                        topRight: Radius.circular(
                          30,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: (35 / 896) * screenHeight(context),
                        ),
                        Text(
                          translations[LanguageManager().currentLanguage]![
                              widget.isProfileEdit?'profile_edit':'sign_up']!,
                          style: TextStyle(
                            fontFamily: 'JostBold',
                            fontSize: 28*fontHelper(context),
                            color: ColorOptions.skin,
                          ),
                        ),
                        SizedBox(
                          height: (10 / 896) * screenHeight(context),
                        ),
                        Container(
                          width: 45,
                          height: 4,
                          decoration: BoxDecoration(
                            color: ColorOptions.skin,
                            border: Border.all(
                                color: ColorOptions.skin,
                                width: 1
                            ),
                          ),
                        ),
                        SizedBox(
                          height: (15 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 265.96,
                          height:( 61/ 896) * screenHeight(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager()
                                        .currentLanguage]!['first_name']!,
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: 'JostMedium',
                                      fontSize: 14 * fontHelper(context),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: (4 / 896) * screenHeight(context),
                              ),
                              SizedBox(
                                height: (35/ 896) * screenHeight(context),
                                child: TextField(
                                  controller: _firstNameController,
                                  inputFormatters: const [],
                                  style: TextStyle(
                                    color: ColorOptions.skin,
                                    fontFamily: "JostMedium",
                                    fontSize: 18*fontHelper(context),
                                  ),
                                  cursorColor: ColorOptions.skin,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 5),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintMaxLines: 1,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: (20 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 265.96,
                          height: (61/896)*screenHeight(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager()
                                        .currentLanguage]!['last_name']!,
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: 'JostMedium',
                                      fontSize: 14 * fontHelper(context),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: (4 / 896) * screenHeight(context),
                              ),
                              SizedBox(
                                height: (35/896)*screenHeight(context),
                                child: TextField(
                                  controller: _lastNameController,
                                  inputFormatters: const [],
                                  style: TextStyle(
                                    color: ColorOptions.skin,
                                    fontFamily: "JostMedium",
                                    fontSize: 18*fontHelper(context),
                                  ),
                                  cursorColor: ColorOptions.skin,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 5),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintMaxLines: 1,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: (20 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 265.96,
                          height: (50/896)*screenHeight(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager()
                                        .currentLanguage]!['gender']!,
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: 'JostMedium',
                                      fontSize: 14 * fontHelper(context),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: (5 / 896) * screenHeight(context),
                              ),
                              SizedBox(
                                height: (22/896)*screenHeight(context),
                                child: Row(
                                  children: [
                                    CustomRadioButton(
                                      text: translations[LanguageManager()
                                          .currentLanguage]!['male']!,
                                      value: 'Male',
                                      selected: selectedGender == 'Male',
                                      onSelect: () {
                                        setState(() {
                                          selectedGender = 'Male';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    CustomRadioButton(
                                      text: translations[LanguageManager()
                                          .currentLanguage]!['female']!,
                                      value: 'Female',
                                      selected: selectedGender == 'Female',
                                      onSelect: () {
                                        setState(() {
                                          selectedGender = 'Female';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    CustomRadioButton(
                                      text: translations[LanguageManager()
                                          .currentLanguage]!['others']!,
                                      value: 'Others',
                                      selected: selectedGender == 'Others',
                                      onSelect: () {
                                        setState(() {
                                          selectedGender = 'Others';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: (22 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 265.96,
                          height:( 61/896)*screenHeight(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager()
                                        .currentLanguage]!['age']!,
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: 'JostMedium',
                                      fontSize: 14 * fontHelper(context),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: (4 / 896) * screenHeight(context),
                              ),
                              SizedBox(
                                height: (35/896)*screenHeight(context),
                                child: TextField(
                                  controller: _ageController,
                                  inputFormatters: const [],
                                  style: TextStyle(
                                    color: ColorOptions.skin,
                                    fontFamily: "JostMedium",
                                    fontSize: 18*fontHelper(context),
                                  ),
                                  cursorColor: ColorOptions.skin,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 5),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintMaxLines: 1,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: (23/ 896) * screenHeight(context),
                        ),
                        SizedBox(
                          height: (43/896)*screenHeight(context),
                          width: 261,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: GradientOptions.signInGradient,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: null,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                var profileBox = Hive.box("ProfileBox");
                                profileBox.put("first_name", _firstNameController.text??"");
                                profileBox.put("last_name", _lastNameController.text??"");
                                profileBox.put("age", int.parse(_ageController.text??""));
                                profileBox.put("gender", selectedGender??"");
                                Navigator.push(
                                  context,
                                  createCustomPageRoute(SignUpSecond(isProfileEdit: widget.isProfileEdit,), context, transitionType: 'slide-in-left')
                                );
                              },
                              child: Text(
                                translations[LanguageManager()
                                    .currentLanguage]!['submit']!,
                                style: TextStyle(
                                  fontSize: 14*fontHelper(context),
                                  fontFamily: "JostBold",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 25, 0, 0),
                  child: SvgPicture.asset(
                    'assets/svg/lang.svg',
                    height: 94,
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Select Language'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: const Text('English'),
                                onTap: () {
                                  // Set English language
                                  LanguageManager().setLanguage('en');
                                  // Close the dialog
                                  Navigator.pop(context);
                                  setState(() {

                                  });
                                },
                              ),
                              ListTile(
                                title: const Text('Hindi'),
                                onTap: () {
                                  // Set Hindi language
                                  LanguageManager().setLanguage('hi');
                                  // Close the dialog
                                  Navigator.pop(context);
                                  setState(() {
                                    // Update UI if necessary
                                  });
                                },
                              ),
                              ListTile(
                                title: const Text('Marathi'),
                                onTap: () {
                                  // Set Marathi language
                                  LanguageManager().setLanguage('mr');
                                  // Close the dialog
                                  Navigator.pop(context);
                                  setState(() {
                                    // Update UI if necessary
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.transparent,
                      shape: CircleBorder(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18,25,0,0),
                      child: SvgPicture.asset(
                        'assets/icons/language_icon.svg',
                        width: 65,
                        height: 65,
                        // color: Colors.black, // Optionally customize the color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        ),
      );
  }
}
