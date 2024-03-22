import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/constants/asset_consts.dart';
import '../../../../core/widgets/custom_raised_button.dart';
import 'onboarding_profile_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String flagIcon = '🇬🇧';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  const Icon(Icons.arrow_back),
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        exclude: <String>['KN', 'MF'],
                        favorite: <String>['SE'],
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          print('Select country: ${country.displayName}');
                          setState(() {
                            flagIcon = country.flagEmoji;
                          });
                        },
                        countryListTheme: CountryListThemeData(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                          inputDecoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Start typing to search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                            ),
                          ),
                          searchTextStyle: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          flagIcon,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        const Gap(3),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  )
                ],
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(10),
              const Text(
                'We need some information which will be visible to the Sports '
                'Coaches, Nutritionists, Dieticians and other fitness instructors',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(30),
              Image.asset(
                AssetConsts.introImg,
              ),
              const Gap(30),
              CustomRaisedButton(
                text: const Text(
                  'LET\'S START',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const OnboardingProfileScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
