import 'package:fam_flutter_storyapp/data/model/request/login_request_model.dart';
import 'package:fam_flutter_storyapp/data/repository/remote/account_repository.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/login_bloc/login_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/show_password_login_bloc/show_password_login_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/main_page/main_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/register_page/register_page.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_mainbutton_widget.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_screen_loading_widget.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_textfield_widget.dart';
import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:fam_flutter_storyapp/support/app_dialog_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: Stack(
          children: [
            SingleChildScrollView(
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
                    BlocBuilder<ShowPasswordLoginBloc, ShowPasswordLoginState>(
                      builder: (context, state) {
                        if (state is ShowPasswordLoginFalse) {
                          return AppTextFieldWidget(
                            textFieldTitle: "Password",
                            textFieldHintText: "Password",
                            controller: passwordTextFieldController,
                            obscureText: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                context.read<ShowPasswordLoginBloc>().add(ActionShowPasswordLogin(value: false));
                              },
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: AppColor.disabled,
                              ),
                            ),
                          );
                        } else {
                          return AppTextFieldWidget(
                            textFieldTitle: "Password",
                            textFieldHintText: "Password",
                            controller: passwordTextFieldController,
                            obscureText: false,
                            suffixIcon: IconButton(
                              onPressed: () {
                                context.read<ShowPasswordLoginBloc>().add(ActionShowPasswordLogin(value: true));
                              },
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: AppColor.primary,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    AppMainButtonWidget(
                      onPressed: () {
                        if (emailTextFieldController.text.isEmpty || passwordTextFieldController.text.isEmpty) {
                          AppDialogAction.showFailedPopup(
                            context: context,
                            title: "Something's wrong",
                            description: "There's still empty field",
                            buttonTitle: 'Back',
                          );
                        } else {
                          context.read<LoginBloc>().add(
                                ActionLogin(
                                  loginRequestModel: LoginRequestModel(
                                    email: emailTextFieldController.text,
                                    password: passwordTextFieldController.text,
                                  ),
                                  accountRepository: AccountRepository(),
                                ),
                              );
                        }
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
            loadingState(),
            // const AppScreenLoadingWidget(),
          ],
        ),
      ),
    );
  }

  Widget loadingState() {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return const AppScreenLoadingWidget();
        } else {
          return const SizedBox();
        }
      },
      listener: (context, state) {
        if (state is LoginFailed) {
          AppDialogAction.showFailedPopup(
            context: context,
            title: "Something's wrong",
            description: state.errorMessage,
            buttonTitle: "Back",
          );
        }
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const MainPage();
              },
            ),
          );
        }
      },
    );
  }
}
