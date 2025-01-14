import 'package:c13_sat_islami/core/constants/app_assets.dart';
import 'package:c13_sat_islami/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SbhaTab extends StatefulWidget {
  const SbhaTab({super.key});

  @override
  State<SbhaTab> createState() => _SbhaTabState();
}

class _SbhaTabState extends State<SbhaTab> {
  int counter = 0;
  double angle = 0;

  int currentIndex = 0;
  List<String> list = ["سبحان الله", "الحمدلله", "لا اله الا الله"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppAssets.sbhaBG,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.islamiLogo,
                height: size.height * 0.15,
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  list[currentIndex],
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Janna",
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: GestureDetector(
                  onTap: _onSbhaTap,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: size.width * 0.35,
                        ),
                        child: Image.asset(
                          "assets/images/sbha_header.png",
                          height: size.height * 0.10,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.09,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedRotation(
                              turns: angle,
                              duration: Duration(milliseconds: 500),
                              child: Image.asset(
                                "assets/images/sebhaBody.png",
                                width: size.width * 0.70,
                              ),
                            ),
                            Text(
                              counter.toString(),
                              style: TextStyle(
                                fontSize: 32,
                                fontFamily: "Janna",
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _onSbhaTap() {
    counter++;
    angle += (1/30);

    if (counter == 33) {
      counter = 0;
      currentIndex++;
      if (currentIndex == 3) currentIndex = 0;
    }
    setState(() {});
  }
}
