import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maciej Filochowski - Software developer',
      theme: ThemeData(
          hoverColor: Colors.black.withOpacity(0.2),
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 35,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          )),
      home: const HomePage(title: 'Maciej Filochowski'),
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
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/avatar.jpeg'),
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
                            TypewriterAnimatedText('Maciej Filochowski',
                                textStyle:
                                    Theme.of(context).textTheme.headline1,
                                speed: const Duration(milliseconds: 300)),
                          ],
                        ),
                      ),
                      const Text("Software Developer"),
                      const SizedBox(height: 20),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              tooltip: "Visit my GitHub",
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    "https://github.com/MaciejFilochowski"));
                              },
                              icon: const FaIcon(FontAwesomeIcons.github),
                            ),
                            IconButton(
                                tooltip: "Visit my Stack Overflow",
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      "https://stackoverflow.com/users/17966769/maciejfilochowski"));
                                },
                                icon: const FaIcon(
                                    FontAwesomeIcons.stackOverflow)),
                            IconButton(
                                tooltip: "Call me",
                                onPressed: () {
                                  launchUrl(Uri.parse("tel:+48-602-670-402"));
                                },
                                icon: const FaIcon(FontAwesomeIcons.phone)),
                            IconButton(
                                tooltip: "Send me an email",
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      "mailto: contact@filochowski.dev"));
                                },
                                icon: const FaIcon(FontAwesomeIcons.envelope)),
                            IconButton(
                                tooltip: "Visit my LinkedIn",
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      "https://www.linkedin.com/in/maciej-filochowski/"));
                                },
                                icon:
                                    const FaIcon(FontAwesomeIcons.linkedinIn)),
                            IconButton(
                                tooltip: "Visit my Facebook",
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      "https://www.facebook.com/maciej.filochowski.93/"));
                                },
                                icon: const FaIcon(FontAwesomeIcons.facebookF)),
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
                          const TextSpan(text: "Made with "),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {
                                      launchUrl(
                                          Uri.parse("https://flutter.dev/")),
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
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
