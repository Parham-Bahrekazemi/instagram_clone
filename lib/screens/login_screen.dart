import 'package:flutter/material.dart';
import 'package:instagram/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode myFocusNodeEmail = FocusNode();
  FocusNode myFocusNodePassword = FocusNode();
  @override
  void initState() {
    myFocusNodeEmail.addListener(() {
      setState(() {});
    });
    myFocusNodePassword.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    myFocusNodeEmail.dispose();
    myFocusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff323A99),
            Color(0xffF98BFC),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            _getImageContainerBox(),
            _getContainerBox(context),
          ],
        ),
      ),
    );
  }

  Widget _getContainerBox(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Color(0xff1C1F2E),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(width: double.infinity),
                const SizedBox(height: 35),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Sign to ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Image.asset('assets/images/mood.png')
                  ],
                ),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: myFocusNodeEmail,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'GM',
                    ),
                    cursorColor: const Color(0xffF35383),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: myFocusNodeEmail.hasFocus
                            ? const Color(0xffF35383)
                            : const Color(0xffC5C5C5),
                        fontSize: 14,
                        fontFamily: 'GB',
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xffC5C5C5),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xffF35383),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: myFocusNodePassword,
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'GM',
                    ),
                    textAlign: TextAlign.justify,
                    cursorColor: const Color(0xffF35383),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: myFocusNodePassword.hasFocus
                              ? const Color(0xffF35383)
                              : const Color(0xffC5C5C5),
                          fontSize: 14,
                          fontFamily: 'GB'),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xffC5C5C5),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xffF35383),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: 129,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const MainScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign In',
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account? / ',
                      style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 16,
                        color: const Color(
                          0xffC5C5C5,
                        ).withOpacity(0.5),
                      ),
                    ),
                    Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getImageContainerBox() {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      top: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Expanded(
            child: Image(
              image: AssetImage(
                'assets/images/rocket.png',
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
