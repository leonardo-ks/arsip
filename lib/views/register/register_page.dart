import 'package:arsip/data/api/api_service.dart';
import 'package:arsip/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscured = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void register(String username, String email, String password) async {
    var response = (await ApiService().register(username, email, password));
    if (response?.username != null) {
      if (response?.username != null) {
        Future.delayed(const Duration(seconds: 1)).then(
              (value) => setState(
                () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        );
      } else {
        Future.delayed(const Duration(seconds: 1)).then(
              (value) => setState(
                () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Register Failed",
                  ),
                ),
              );
            },
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.string(
                '<svg id="google_streetview" data-name="google streetview" xmlns="http://www.w3.org/2000/svg" width="167" height="167" viewBox="0 0 167 167"> <path id="Path_35" data-name="Path 35" d="M16,27.833A27.833,27.833,0,1,1,43.833,55.667,27.826,27.826,0,0,1,16,27.833Z" transform="translate(39.667)" fill="#fff"/> <path id="Path_36" data-name="Path 36" d="M51.767,19.2A38.947,38.947,0,0,0,12.8,58.167V80.433A5.583,5.583,0,0,0,18.367,86h66.8a5.583,5.583,0,0,0,5.567-5.567V58.167A38.947,38.947,0,0,0,51.767,19.2Z" transform="translate(31.733 47.6)" fill="#fff"/> <path id="Path_37" data-name="Path 37" d="M15.517,48.1c-3.166,3.27-4.384,6.3-4.384,8.976,0,2.714,1.252,5.81,4.523,9.081,3.27,3.34,8.28,6.576,14.926,9.429C43.838,81.26,62.555,84.913,83.5,84.913s39.663-3.653,52.918-9.324c6.645-2.853,11.655-6.089,14.926-9.429,3.27-3.27,4.523-6.367,4.523-9.081,0-2.679-1.218-5.706-4.384-8.976-3.2-3.27-8.072-6.471-14.543-9.289l4.453-10.194c7.306,3.166,13.569,7.1,18.057,11.725C163.973,45.007,167,50.678,167,57.08c0,6.506-3.1,12.212-7.724,16.909-4.627,4.662-11.029,8.628-18.474,11.829-14.96,6.4-35.209,10.229-57.3,10.229S41.159,92.219,26.2,85.818c-7.445-3.2-13.847-7.167-18.474-11.829C3.1,69.291,0,63.586,0,57.08c0-6.4,3.027-12.073,7.55-16.735C12.038,35.717,18.3,31.786,25.607,28.62L30.06,38.814C23.589,41.632,18.718,44.833,15.517,48.1Z" transform="translate(0 70.954)" fill="#fff"/> <path id="Path_38" data-name="Path 38" d="M0,0H167V167H0Z" fill="none"/></svg>'),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'ARSIP\nDIGITAL',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                controller: usernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                  hintText: 'Username',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  hintText: 'Email',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: obscured,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscured ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        obscured = !obscured;
                      });
                    },
                  ),
                  prefixIcon: Transform.rotate(
                    angle: 12,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(3.14),
                      child: const Icon(
                        Icons.vpn_key_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        '',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      register(usernameController.text, emailController.text, passwordController.text);
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black12,
                      ),
                    ),
                    child: const SizedBox(
                      width: 60,
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
