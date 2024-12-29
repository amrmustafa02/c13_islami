import 'package:c13_sat_islami/core/constants/app_assets.dart';
import 'package:c13_sat_islami/core/theme/app_colors.dart';
import 'package:c13_sat_islami/models/sura_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = "/quran_details";

  QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as SuraDataModel;

    // async
    if (versesList.isEmpty) loadSuraData(data.id.toString());

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.quranDetailsBackground,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: AppColors.primaryColor,
          ),
          centerTitle: true,
          title: Text(
            data.nameEN,
            style: TextStyle(
              fontFamily: "Janna",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            Text(
              data.nameAR,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Janna",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    "[${index + 1}] ${versesList[index]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.8,
                      fontFamily: "Janna",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  itemCount: versesList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadSuraData(String suraID) async {
    String content = await rootBundle.loadString("assets/files/$suraID.txt");
    setState(() {
      versesList = content.split("\n");
    });
    print(content);
  }
}
