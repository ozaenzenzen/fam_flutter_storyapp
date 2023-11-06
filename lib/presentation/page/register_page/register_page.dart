import 'package:fam_flutter_storyapp/data/model/request/register_request_model.dart';
import 'package:fam_flutter_storyapp/data/repository/remote/account_repository.dart';
import 'package:fam_flutter_storyapp/presentation/page/register_page/register_bloc/register_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/register_page/show_password_register_bloc/show_password_register_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_mainbutton_widget.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_screen_loading_widget.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_textfield_widget.dart';
import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:fam_flutter_storyapp/support/app_dialog_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameTextFieldController = TextEditingController(text: "");
  TextEditingController emailTextFieldController = TextEditingController(text: "");
  TextEditingController passwordTextFieldController = TextEditingController(text: "");
  // TextEditingController confirmPasswordTextFieldController = TextEditingController(text: "");

  bool showPassword = true;
  // bool showConfirmPassword = true;

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
                    SizedBox(height: 100.h),
                    Text(
                      "Register Page",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    AppTextFieldWidget(
                      textFieldTitle: "Name",
                      textFieldHintText: "Name",
                      controller: nameTextFieldController,
                    ),
                    SizedBox(height: 10.h),
                    AppTextFieldWidget(
                      textFieldTitle: "Email / Username",
                      textFieldHintText: "Email / Username",
                      controller: emailTextFieldController,
                    ),
                    SizedBox(height: 10.h),
                    BlocBuilder<ShowPasswordRegisterBloc, ShowPasswordRegisterState>(
                      builder: (context, state) {
                        if (state is ShowPasswordRegisterFalse) {
                          return AppTextFieldWidget(
                            textFieldTitle: "Password",
                            textFieldHintText: "Password",
                            controller: passwordTextFieldController,
                            obscureText: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                context.read<ShowPasswordRegisterBloc>().add(ActionShowPasswordRegister(value: false));
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
                                context.read<ShowPasswordRegisterBloc>().add(ActionShowPasswordRegister(value: true));
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
                        if (nameTextFieldController.text.isEmpty || emailTextFieldController.text.isEmpty || passwordTextFieldController.text.isEmpty) {
                          AppDialogAction.showFailedPopup(
                            context: context,
                            title: "Something's wrong",
                            description: "There's still empty field",
                            buttonTitle: 'Back',
                          );
                        } else {
                          context.read<RegisterBloc>().add(
                                ActionRegister(
                                  registerRequestModel: RegisterRequestModel(
                                    name: nameTextFieldController.text,
                                    email: emailTextFieldController.text,
                                    password: passwordTextFieldController.text,
                                  ),
                                  accountRepository: AccountRepository(),
                                ),
                              );
                        }
                      },
                      text: 'Register Now',
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        "Already have an account?",
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
                        Navigator.pop(context);
                      },
                      text: "Login",
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
    return BlocConsumer<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const AppScreenLoadingWidget();
        } else {
          return const SizedBox();
        }
      },
      listener: (context, state) {
        if (state is RegisterFailed) {
          AppDialogAction.showFailedPopup(
            context: context,
            title: "Something's wrong",
            description: state.errorMessage,
            buttonTitle: "Back",
          );
        }
        if (state is RegisterSuccess) {
          AppDialogAction.showSuccessPopup(
            context: context,
            title: "Success",
            description: "Success create account",
            buttonTitle: "Route to Login Page",
            mainButtonAction: () {
              Navigator.pop(context);
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const MainPage();
              //     },
              //   ),
              // );
            },
          );
        }
      },
    );
  }
}
