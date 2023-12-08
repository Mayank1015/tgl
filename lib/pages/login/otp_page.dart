import 'package:flutter/material.dart';
import 'package:tgl_ai/pages/home_page.dart';
import 'package:tgl_ai/utilities/regular/colors.dart';
import 'package:tgl_ai/utilities/regular/company_name.dart';
import 'package:tgl_ai/utilities/custom_widgets/custom_elevated_button.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CompanyName(),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter otp",
                        hintStyle: TextStyle(color: Colors.grey)
                        // prefixIcon: Icon(Icons.email_outlined,)
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomElevatedButton(
                title: "Verify OTP",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                backGroundColor: tglColor1,
                foreGroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
