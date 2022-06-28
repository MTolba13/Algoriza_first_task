// ignore: file_names
import 'package:algoriza_first_task/components/components.dart';
import 'package:algoriza_first_task/modules/register_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: signingIn(context),
    );
  }

  // signing In Method

  SingleChildScrollView signingIn(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://images.wuzzuf-data.net/files/company_covers/thumbs/44b117c63b444536c28db2fbec246c3d.png',
            fit: BoxFit.fill,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Welcome to Fashion Daily',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Sign IN',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        TextButton(onPressed: () {}, child: const Text('Help')),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Phone Number',
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'EG',
                      onChanged: (phone) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultButton(
                      width: double.infinity,
                      color: Colors.blue,
                      isUpperCase: false,
                      onPressed: () {},
                      radius: 5,
                      text: 'Sign In',
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // ignore: prefer_const_constructors
                    Text('Or'),
                    const SizedBox(
                      height: 20,
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 48,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 1.0,
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  'https://icon-library.com/images/login-with-google-icon/login-with-google-icon-14.jpg',
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('Sign with by Google')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Does\'t have an acount ?',
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(context, RegisterScreen());
                          },
                          child: const Text('Register Now'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Use the application according to policy rules. Any \nKinds of violations will be subject to sanctions. ',
                      style: TextStyle(color: Colors.grey[400]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
