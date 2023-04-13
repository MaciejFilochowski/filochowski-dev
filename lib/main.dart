import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:filochowski_dev/bloc/language_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageBloc()..add(LoadLanguage()))
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [Locale("en"), Locale("pl")],
            debugShowCheckedModeBanner: false,
            title: "Maciej Filochowski - Software developer",
            theme: ThemeData(
                hoverColor: Colors.black.withOpacity(0.2),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 35,
                ),
                textTheme: const TextTheme(
                  headline1:
                      TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  bodyText1: TextStyle(),
                  bodyText2: TextStyle(),
                ).apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                )),
            home: const HomePage(
                title: "Maciej Filochowski - Software developer"),
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Stack(
            children: [
              CircularParticle(
                awayRadius: 200,
                numberOfParticles: 100,
                speedOfParticles: 0.2,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                onTapAnimation: true,
                particleColor: Colors.white.withAlpha(230),
                awayAnimationDuration: const Duration(milliseconds: 20000),
                maxParticleSize: 8,
                isRandSize: true,
                isRandomColor: false,
                hoverColor: Colors.white,
                hoverRadius: 100,
                connectDots: true,
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DropdownButton<String>(
                                    value: context
                                        .read<LanguageBloc>()
                                        .state
                                        .locale
                                        .languageCode,
                                    dropdownColor: Colors.black87,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.white),
                                    underline: Container(
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                    onChanged: (String? value) {
                                      context
                                          .read<LanguageBloc>()
                                          .add(ChangeLanguage(Locale(value!)));
                                    },
                                    items: [
                                      DropdownMenuItem(
                                        value: "pl",
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .polish),
                                      ),
                                      DropdownMenuItem(
                                        value: "en",
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .english),
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/avatar.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                    AppLocalizations.of(context)!.name,
                                    textStyle:
                                        Theme.of(context).textTheme.headline1,
                                    speed: const Duration(milliseconds: 300)),
                              ],
                            ),
                          ),
                          Text(AppLocalizations.of(context)!.position),
                          const SizedBox(height: 20),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 800),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  tooltip: AppLocalizations.of(context)!.gitHub,
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        "https://github.com/MaciejFilochowski"));
                                  },
                                  icon: const FaIcon(FontAwesomeIcons.github),
                                ),
                                IconButton(
                                    tooltip: AppLocalizations.of(context)!
                                        .stackoverflow,
                                    onPressed: () {
                                      launchUrl(Uri.parse(
                                          "https://stackoverflow.com/users/17966769/maciejfilochowski"));
                                    },
                                    icon: const FaIcon(
                                        FontAwesomeIcons.stackOverflow)),
                                IconButton(
                                    tooltip:
                                        AppLocalizations.of(context)!.phone,
                                    onPressed: () {
                                      launchUrl(
                                          Uri.parse("tel:+48-602-670-402"));
                                    },
                                    icon: const FaIcon(FontAwesomeIcons.phone)),
                                IconButton(
                                    tooltip: AppLocalizations.of(context)!.mail,
                                    onPressed: () {
                                      launchUrl(Uri.parse(
                                          "mailto: contact@filochowski.dev"));
                                    },
                                    icon: const FaIcon(
                                        FontAwesomeIcons.envelope)),
                                IconButton(
                                    tooltip:
                                        AppLocalizations.of(context)!.linkedIn,
                                    onPressed: () {
                                      launchUrl(Uri.parse(
                                          "https://www.linkedin.com/in/maciej-filochowski/"));
                                    },
                                    icon: const FaIcon(
                                        FontAwesomeIcons.linkedinIn)),
                                IconButton(
                                    tooltip:
                                        AppLocalizations.of(context)!.facebook,
                                    onPressed: () {
                                      launchUrl(Uri.parse(
                                          "https://www.facebook.com/maciej.filochowski.93/"));
                                    },
                                    icon: const FaIcon(
                                        FontAwesomeIcons.facebookF)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: <TextSpan>[
                              TextSpan(
                                  text: AppLocalizations.of(context)!.madeWith),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => {
                                          launchUrl(Uri.parse(
                                              "https://flutter.dev/")),
                                        },
                                  text: "Flutter",
                                  style: const TextStyle(
                                    color: Color(0xFF7cc6f4),
                                  )),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
