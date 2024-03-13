import 'package:auth_task/main/pages/tiles.dart';
import 'package:auth_task/widgets/default_button.dart';
import 'package:auth_task/widgets/text_field.dart';
import 'package:flutter/material.dart';

class PhoneVerification extends StatelessWidget {
  final String text;

  const PhoneVerification({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
                const SizedBox(height: 15),
                Text(
                  'Введие код, отправленный на номер',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 70),
                DefaultTextField(
                    controller: controller, hintText: 'Код из СМС'),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      child: Text(
                    'Получить код повторно',
                    style: Theme.of(context).textTheme.labelSmall,
                  )),
                ),
                const SizedBox(height: 20),
                DefaultButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TilesPage()));
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
