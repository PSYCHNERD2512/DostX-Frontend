import 'package:flutter/material.dart';
import 'language_manager.dart';
import 'palette.dart';
import 'translations.dart';
import 'globals.dart';

class MedicalReminderPage extends StatefulWidget {
  const MedicalReminderPage({super.key});

  @override
  State<MedicalReminderPage> createState() => _MedicalReminderPageState();
}

class _MedicalReminderPageState extends State<MedicalReminderPage> {
  int modeIndex = 0;
  @override
  Widget build(BuildContext context) {
    double relFont = fontHelper(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFFFF2E3),
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Medical Reminders',
          style: TextStyle(
            fontSize: relFont * 18,
            fontFamily: 'SFProSemiBold',
            color: ColorOptions.darkblue,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
        // centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.1,
              width: screenWidth(context),
              decoration: const BoxDecoration(
                color: Color(0xFFFFF2E3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Container(
                  width: screenWidth(context)*0.91,
                  height: screenHeight(context) * 0.06,
                  decoration: BoxDecoration(
                      color: const Color(0xFFDBA497),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child:  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: modeIndex==0?Color(0xFFFFFFFF):Colors.transparent,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Center(
                                          child: TextButton(
                                            child: Text(
                                              translations[LanguageManager().currentLanguage]!['upcoming']!,
                                              style: TextStyle(
                                                  fontSize: relFont * 12.0,
                                                  fontFamily: 'SFProMedium',
                                                  color: const Color(0xFF323736),
                                                  letterSpacing: 1.1),
                                            ),
                                            onPressed: (){
                                              setState(() {
                                                modeIndex=0;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                )
                            )
                        ),
                        Expanded(
                            child: Container(
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: modeIndex==1?Color(0xFFFFFFFF):Colors.transparent,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Center(
                                          child: TextButton(
                                            child: Text(
                                              translations[LanguageManager().currentLanguage]!['available']!,
                                              style: TextStyle(
                                                  fontSize: relFont * 12.0,
                                                  fontFamily: 'SFProMedium',
                                                  color: const Color(0xFF323736),
                                                  letterSpacing: 1.1),
                                            ),
                                            onPressed: (){setState(() {
                                              modeIndex=1;
                                            });},
                                          ),
                                        ),
                                      ),
                                    )
                                )
                            )
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0EFED),
                        borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x0A000000),
                                offset: Offset(0,2),
                                blurRadius: 48,
                                spreadRadius: 10
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth(context) * 0.13,
                                  // height: screenHeight(context) * 0.09,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: const BorderSide(color: Color(0xFF707070), width: 1),

                                      ),
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,

                                    ),
                                    onPressed: (){},
                                    child: Image.asset(
                                      "assets/image/med (1).png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  // child: Image.asset(
                                  //   "assets/image/emo_wheel.png",
                                  //   fit: BoxFit.contain,
                                  // ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Click to add medicine",
                                        style: TextStyle(
                                            fontSize: relFont * 15.0,
                                            fontFamily: 'SFProMedium',
                                            color: const Color(0xFF323736),
                                            letterSpacing: 1.1),
                                        // textAlign: TextAlign.center,
                                      ),
                                      // const SizedBox(height: 10,),
                                      Text(
                                        "By Dr._________",
                                        style: TextStyle(
                                            fontSize: relFont * 12.0,
                                            fontFamily: 'SFProMedium',
                                            color: const Color(0xFF606060),
                                            letterSpacing: 1.1),
                                        // textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8FBFB),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                                      child: Container(
                                        decoration:  BoxDecoration(
                                          color: const Color(0xFFD8D8D8),
                                          borderRadius: BorderRadius.circular(12)

                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                  "Morning",
                                                  style: TextStyle(
                                                      fontSize: relFont * 12.0,
                                                      fontFamily: 'SFProMedium',
                                                      color: const Color(0xFF606060),
                                                      letterSpacing: 1.1),
                                                  // textAlign: TextAlign.center,
                                              ),
                                              SizedBox(width: screenWidth(context)*0.05,),
                                              Icon(Icons.arrow_drop_down)
                                            ],
                                          ),
                                        )
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Container(
                                        child: Text(
                                            "01:00 - 02:30 PM",
                                            style: TextStyle(
                                                fontSize: relFont * 12.0,
                                                fontFamily: 'SFProMedium',
                                                color: const Color(0xFF606060),
                                                letterSpacing: 1.1),
                                            // textAlign: TextAlign.center,
                                          ),
                                        )
                                      )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8FBFB),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 11),
                                child: Text(
                                    "Day x0",
                                  style: TextStyle(
                                      fontSize: relFont * 12.0,
                                      fontFamily: 'SFProMedium',
                                      color: const Color(0xFF606060),
                                      letterSpacing: 1.1),
                                  // textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: MedicalEntry(),
                  )


                  // USE LIST VIEW BUILDER BY USING AN ARRAY OF DATA TO DISPLAY THE DATA INTO TILES LATER


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicalEntry extends StatefulWidget {
  const MedicalEntry({super.key});

  @override
  State<MedicalEntry> createState() => _MedicalEntryState();
}

class _MedicalEntryState extends State<MedicalEntry> {
  String dayCategory = "Morning";
  @override
  Widget build(BuildContext context) {
    double relFont = fontHelper(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xFFFFFFFF),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            offset: Offset(0,2),
            blurRadius: 48,
            spreadRadius: 7
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth(context) * 0.13,
                  // height: screenHeight(context) * 0.09,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Color(0xFF707070), width: 1),

                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,

                    ),
                    onPressed: (){},
                    child: Image.asset(
                      "assets/image/med (1).png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  // child: Image.asset(
                  //   "assets/image/emo_wheel.png",
                  //   fit: BoxFit.contain,
                  // ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Click to add medicine",
                        style: TextStyle(
                            fontSize: relFont * 15.0,
                            fontFamily: 'SFProMedium',
                            color: const Color(0xFF323736),
                            letterSpacing: 1.1),
                        // textAlign: TextAlign.center,
                      ),
                      // const SizedBox(height: 10,),
                      Text(
                        "By Dr._________",
                        style: TextStyle(
                            fontSize: relFont * 12.0,
                            fontFamily: 'SFProMedium',
                            color: const Color(0xFF606060),
                            letterSpacing: 1.1),
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8FBFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: Container(
                          decoration:  BoxDecoration(
                              color: const Color(0xFFD8D8D8),
                              borderRadius: BorderRadius.circular(12)

                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  "Morning",
                                  style: TextStyle(
                                      fontSize: relFont * 12.0,
                                      fontFamily: 'SFProMedium',
                                      color: const Color(0xFF606060),
                                      letterSpacing: 1.1),
                                  // textAlign: TextAlign.center,
                                ),
                                SizedBox(width: screenWidth(context)*0.05,),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          )
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          child: Text(
                            "01:00 - 02:30 PM",
                            style: TextStyle(
                                fontSize: relFont * 12.0,
                                fontFamily: 'SFProMedium',
                                color: const Color(0xFF606060),
                                letterSpacing: 1.1),
                            // textAlign: TextAlign.center,
                          ),
                        )
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8FBFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 11),
                  child: Text(
                    "Day x0",
                    style: TextStyle(
                        fontSize: relFont * 12.0,
                        fontFamily: 'SFProMedium',
                        color: const Color(0xFF606060),
                        letterSpacing: 1.1),
                    // textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}