import 'package:auth_task/auth/pages/phone_verification.dart';
import 'package:auth_task/widgets/default_button.dart';
import 'package:auth_task/widgets/phone_number_field.dart';
import 'package:auth_task/widgets/text_field.dart';
import 'package:flutter/material.dart';

class AuthWithNumber extends StatelessWidget {
  const AuthWithNumber({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 6),
                Text(
                  'Авторизация',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const Flexible(
                  child: SizedBox(height: 15),
                ),
                Text(
                  'Введите номер телефона для авторизации',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Flexible(child: SizedBox(height: 100)),
                PhoneNumberWidget(controller: controller1),
                const Flexible(child: SizedBox(height: 25)),
                DefaultTextField(
                    controller: controller2, hintText: 'Введите ваше имя'),
                const Flexible(child: SizedBox(height: 30)),
                DefaultButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhoneVerification(
                                  text: controller1.text,
                                )));
                  },
                  text: 'Продолжить',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
