import 'package:c13_sat_islami/core/constants/app_assets.dart';
import 'package:c13_sat_islami/core/constants/local_storage_keys.dart';
import 'package:c13_sat_islami/core/services/local_storage_service.dart';
import 'package:c13_sat_islami/core/theme/app_colors.dart';
import 'package:c13_sat_islami/features/layout/quran/quran_details_view.dart';
import 'package:c13_sat_islami/features/layout/quran/widgets/recent_card_widget.dart';
import 'package:c13_sat_islami/features/layout/quran/widgets/sura_card_widget.dart';
import 'package:c13_sat_islami/models/recent_sura_data.dart';
import 'package:c13_sat_islami/models/sura_data_model.dart';
import 'package:flutter/material.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  void initState() {
    super.initState();
    _loadRecentSura();
  }

  String searchQuery = '';

  List<SuraDataModel> recentSuraModels = [];

  List<SuraDataModel> searchSuraModels = [];

  List<String> recentSuraIndexs = [];

  List<SuraDataModel> suraList = [
    SuraDataModel(id: 1, nameEN: "Al-Fatihah", nameAR: "الفاتحه", verses: 7),
    SuraDataModel(id: 2, nameEN: "Al-Baqarah", nameAR: "البقرة", verses: 286),
    SuraDataModel(
        id: 3, nameEN: "Aal-E-Imran", nameAR: "آل عمران", verses: 200),
    SuraDataModel(id: 4, nameEN: "An-Nisa", nameAR: "النساء", verses: 176),
    SuraDataModel(id: 5, nameEN: "Al-Maidah", nameAR: "المائدة", verses: 120),
    SuraDataModel(id: 6, nameEN: "Al-An'am", nameAR: "الأنعام", verses: 165),
    SuraDataModel(id: 7, nameEN: "Al-A'raf", nameAR: "الأعراف", verses: 206),
    SuraDataModel(id: 8, nameEN: "Al-Anfal", nameAR: "الأنفال", verses: 75),
    SuraDataModel(id: 9, nameEN: "At-Tawbah", nameAR: "التوبة", verses: 129),
    SuraDataModel(id: 10, nameEN: "Yunus", nameAR: "يونس", verses: 109),
    SuraDataModel(id: 11, nameEN: "Hud", nameAR: "هود", verses: 123),
    SuraDataModel(id: 12, nameEN: "Yusuf", nameAR: "يوسف", verses: 111),
    SuraDataModel(id: 13, nameEN: "Ar-Ra'd", nameAR: "الرعد", verses: 43),
    SuraDataModel(id: 14, nameEN: "Ibrahim", nameAR: "إبراهيم", verses: 52),
    SuraDataModel(id: 15, nameEN: "Al-Hijr", nameAR: "الحجر", verses: 99),
    SuraDataModel(id: 16, nameEN: "An-Nahl", nameAR: "النحل", verses: 128),
    SuraDataModel(id: 17, nameEN: "Al-Isra", nameAR: "الإسراء", verses: 111),
    SuraDataModel(id: 18, nameEN: "Al-Kahf", nameAR: "الكهف", verses: 110),
    SuraDataModel(id: 19, nameEN: "Maryam", nameAR: "مريم", verses: 98),
    SuraDataModel(id: 20, nameEN: "Ta-Ha", nameAR: "طه", verses: 135),
    SuraDataModel(id: 21, nameEN: "Al-Anbiya", nameAR: "الأنبياء", verses: 112),
    SuraDataModel(id: 22, nameEN: "Al-Hajj", nameAR: "الحج", verses: 78),
    SuraDataModel(
        id: 23, nameEN: "Al-Mu'minun", nameAR: "المؤمنون", verses: 118),
    SuraDataModel(id: 24, nameEN: "An-Nur", nameAR: "النّور", verses: 64),
    SuraDataModel(id: 25, nameEN: "Al-Furqan", nameAR: "الفرقان", verses: 77),
    SuraDataModel(
        id: 26, nameEN: "Ash-Shu'ara", nameAR: "الشعراء", verses: 227),
    SuraDataModel(id: 27, nameEN: "An-Naml", nameAR: "النّمل", verses: 93),
    SuraDataModel(id: 28, nameEN: "Al-Qasas", nameAR: "القصص", verses: 88),
    SuraDataModel(id: 29, nameEN: "Al-Ankabut", nameAR: "العنكبوت", verses: 69),
    SuraDataModel(id: 30, nameEN: "Ar-Rum", nameAR: "الرّوم", verses: 60),
    SuraDataModel(id: 31, nameEN: "Luqman", nameAR: "لقمان", verses: 34),
    SuraDataModel(id: 32, nameEN: "As-Sajda", nameAR: "السجدة", verses: 30),
    SuraDataModel(id: 33, nameEN: "Al-Ahzab", nameAR: "الأحزاب", verses: 73),
    SuraDataModel(id: 34, nameEN: "Saba", nameAR: "سبأ", verses: 54),
    SuraDataModel(id: 35, nameEN: "Fatir", nameAR: "فاطر", verses: 45),
    SuraDataModel(id: 36, nameEN: "Ya-Sin", nameAR: "يس", verses: 83),
    SuraDataModel(id: 37, nameEN: "As-Saffat", nameAR: "الصافات", verses: 182),
    SuraDataModel(id: 38, nameEN: "Sad", nameAR: "ص", verses: 88),
    SuraDataModel(id: 39, nameEN: "Az-Zumar", nameAR: "الزمر", verses: 75),
    SuraDataModel(id: 40, nameEN: "Ghafir", nameAR: "غافر", verses: 85),
    // Add the remaining Suras following this pattern...
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppAssets.quranBg,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/islami_logo.png",
                height: size.height * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  style: TextStyle(
                    fontFamily: "Janna",
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.titleTextColor,
                  ),
                  cursorColor: AppColors.primaryColor,
                  onChanged: (value) {
                    searchQuery = value;
                    search();
                    setState(() {});
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.secondaryColor.withOpacity(0.5),
                    hintText: "Sura Name",
                    hintStyle: TextStyle(
                      fontFamily: "Janna",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.titleTextColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage(
                          AppAssets.quranIcn,
                        ),
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: searchQuery.isEmpty,
                replacement: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => _onSuraTab(searchSuraModels[index].id-1),
                    child: SuraCardWidget(
                      suraDataModel: searchSuraModels[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    indent: 60,
                    endIndent: 60,
                    thickness: 2,
                  ),
                  itemCount: searchSuraModels.length,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 15,
                        bottom: 10,
                      ),
                      child: Text(
                        "Most Recently",
                        style: TextStyle(
                          fontFamily: "Janna",
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.titleTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: Visibility(
                        visible: recentSuraModels.isNotEmpty,
                        replacement: Center(
                          child: Text(
                            "No Recent Sura",
                            style: TextStyle(
                              fontFamily: "Janna",
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                QuranDetailsView.routeName,
                                arguments: recentSuraModels[index],
                              );
                            },
                            child: RecentCardWidget(
                              suraData: recentSuraModels[index],
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 16,
                          ),
                          itemCount: recentSuraModels.length,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15),
                      child: Text(
                        "Sura List",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Janna",
                          fontWeight: FontWeight.bold,
                          color: AppColors.titleTextColor,
                        ),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => _onSuraTab(suraList[index].id-1),
                        child: SuraCardWidget(
                          suraDataModel: suraList[index],
                        ),
                      ),
                      separatorBuilder: (context, index) => Divider(
                        indent: 60,
                        endIndent: 60,
                        thickness: 2,
                      ),
                      itemCount: suraList.length,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onSuraTab(int index) {
    _cacheSura(index);

    Navigator.of(context).pushNamed(
      QuranDetailsView.routeName,
      arguments: suraList[index],
    );
  }

  _cacheSura(int index) async {
    var indexString = index.toString();

    if (recentSuraIndexs.contains(indexString)) return;

    if (recentSuraIndexs.length == 5) {
      recentSuraIndexs.removeLast();
    }
    recentSuraIndexs.insert(0, indexString);

    await LocalStorageService.setList(
      LocalStorageKeys.recentSuras,
      recentSuraIndexs,
    );
    _loadRecentSura();
    setState(() {});
  }

  _loadRecentSura() {
    recentSuraIndexs = [];
    recentSuraModels = [];

    recentSuraIndexs =
        LocalStorageService.getStringList(LocalStorageKeys.recentSuras) ?? [];

    for (var index in recentSuraIndexs) {
      var indexInt = int.parse(index);
      recentSuraModels.add(suraList[indexInt]);
    }
  }

  void search() {
    searchSuraModels = [];

    for (var sura in suraList) {
      if (sura.nameAR.toLowerCase().contains(searchQuery.toLowerCase()) ||
          sura.nameEN.toLowerCase().contains(searchQuery.toLowerCase())) {
        searchSuraModels.add(sura);
      }
    }
  }
}
