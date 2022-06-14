//Packages
import 'package:flutter/material.dart';
import 'package:test_gonosen/constants/error_handling.dart';
import 'package:test_gonosen/widgets/custom_button.dart';
import 'package:test_gonosen/widgets/custom_textfield.dart';
import 'package:test_gonosen/widgets/text_bold.dart';

//Pages
import 'welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();
  late double widthDevice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Screen 1"),
        ),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    widthDevice = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextBold(text: "Enter your name"),
            const SizedBox(
              height: 150,
            ),
            CustomTextField(
              controller: _textController,
              hintText: "Your name",
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              text: "Next Screen",
              onTap: () {
                _textController.text.isNotEmpty
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomePage(
                            yourName: _textController.text,
                          ),
                        ),
                      )
                    : showSnackBar(context, "Vui lòng nhập đầy đủ thông tin!");
              },
              widthDevice: widthDevice,
            ),
          ],
        ),
      ),
    );
  }
}
