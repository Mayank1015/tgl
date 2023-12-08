import 'package:flutter/material.dart';
import 'package:tgl_ai/pages/login/otp_page.dart';
import 'package:tgl_ai/utilities/regular/colors.dart';
import 'package:tgl_ai/utilities/regular/company_name.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:tgl_ai/utilities/custom_widgets/custom_elevated_button.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: const AssetImage("assets/tgl_logo.png"),
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.fitWidth,
              ),
              const CompanyName(),
              const SizedBox(
                height: 30,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email address",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter email Address",
                        hintStyle: TextStyle(color: Colors.grey)
                        // prefixIcon: Icon(Icons.email_outlined,)
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              CustomElevatedButton(
                title: "Send OTP",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpVerificationPage(),
                    ),
                  );
                },
                backGroundColor: tglColor1,
                foreGroundColor: Colors.white,
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(
                    width: 5,
                  ),
                  Text("or continue with"),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomElevatedButton(
                title: "GOOGLE",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
