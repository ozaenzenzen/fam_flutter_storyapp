import 'package:fam_flutter_storyapp/presentation/page/main_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/register_page/register_page.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_mainbutton_widget.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_textfield_widget.dart';
import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextFieldController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 130.h),
                Text(
                  "Login Page",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 40.h),
                AppTextFieldWidget(
                  textFieldTitle: "Email / Username",
                  textFieldHintText: "Email / Username",
                  controller: emailTextFieldController,
                ),
                SizedBox(height: 10.h),
                AppTextFieldWidget(
                  textFieldTitle: "Password",
                  textFieldHintText: "Password",
                  controller: passwordTextFieldController,
                  obscureText: showPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: showPassword ? AppColor.disabled : AppColor.primary,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                AppMainButtonWidget(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MainPage();
                        },
                      ),
                    );
                  },
                  text: 'Login',
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    "Belum Ada Akun?",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                AppMainButtonWidget(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const RegisterPage();
                        },
                      ),
                    );
                  },
                  text: "Register",
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
