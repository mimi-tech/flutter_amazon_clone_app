import 'package:amazon_clone_new/Compnents/appbar.dart';
import 'package:amazon_clone_new/Compnents/general_button.dart';
import 'package:amazon_clone_new/Compnents/loadingIcon.dart';
import 'package:amazon_clone_new/Util/colors.dart';
import 'package:amazon_clone_new/Controllers/auth_controller.dart';
import 'package:amazon_clone_new/Util/dimen.dart';
import 'package:amazon_clone_new/Util/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends  StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.put(GeneralController());

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget spacing(){
    return SizedBox(height: 20.h);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: GeneralAppbar(color: kNavyColor,
          title: AppLocalizations.of(context)!.loginText),
      body: GetBuilder<GeneralController>(
        builder: (_) => ProgressHUDFunction(
        inAsyncCall: controller.isRegLoading,
        child: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: kMargin),
                child: Column(
                  children: [
                    spacing(),

                    Center(
                      child: Text(
                          AppLocalizations.of(context)!.loginText.toUpperCase(),
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.bold)
                      ),
                    ),
                    spacing(),

                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          spacing(),
                          Text(AppLocalizations.of(context)!.firstName, style: Theme.of(context).textTheme.subtitle1),
                          TextFormField(

                            controller: _firstName,
                            autocorrect: true,
                            autofocus: true,
                            cursorColor: (kOrangeColor),
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            style: Theme.of(context).textTheme.bodyText1,
                            validator: Validator.validateFullName,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.firstNameText,
                              hintStyle: Theme.of(context).inputDecorationTheme.helperStyle,
                              errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
                              border: Theme.of(context).inputDecorationTheme.border,
                              enabledBorder:Theme.of(context).inputDecorationTheme.enabledBorder,
                              focusedBorder:Theme.of(context).inputDecorationTheme.focusedBorder,
                              focusedErrorBorder:Theme.of(context).inputDecorationTheme.focusedErrorBorder,
                              errorBorder:Theme.of(context).inputDecorationTheme.errorBorder,
                              contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
                            ),
                            onSaved: (String? value) {
                              controller.firstName = value!;
                            },
                          ),
                          spacing(),
                          Text(AppLocalizations.of(context)!.lastName, style: Theme.of(context).textTheme.subtitle1),

                          TextFormField(

                            controller: _lastName,
                            autocorrect: true,
                            autofocus: true,
                            cursorColor: (kOrangeColor),
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            style: Theme.of(context).textTheme.bodyText1,
                            validator: Validator.validateFullName,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.lastNameText,
                              hintStyle: Theme.of(context).inputDecorationTheme.helperStyle,
                              errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
                              border: Theme.of(context).inputDecorationTheme.border,
                              enabledBorder:Theme.of(context).inputDecorationTheme.enabledBorder,
                              focusedBorder:Theme.of(context).inputDecorationTheme.focusedBorder,
                              focusedErrorBorder:Theme.of(context).inputDecorationTheme.focusedErrorBorder,
                              errorBorder:Theme.of(context).inputDecorationTheme.errorBorder,
                              contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
                            ),
                            onSaved: (String? value) {
                              controller.lastName = value!;
                            },
                          ),

                          spacing(),
                          Text(AppLocalizations.of(context)!.email,style: Theme.of(context).textTheme.subtitle1),

                          TextFormField(
                            controller: _email,
                            autocorrect: true,
                            autofocus: true,
                            cursorColor: (kOrangeColor),
                            keyboardType: TextInputType.emailAddress,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                            validator: Validator.validateEmail,

                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.emailText,
                              hintStyle: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .hintStyle,
                              errorStyle: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .errorStyle,
                              border: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .border,
                              enabledBorder: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .enabledBorder,
                              focusedBorder: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .focusedBorder,
                              focusedErrorBorder: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .focusedErrorBorder,
                              errorBorder: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .errorBorder,
                              contentPadding: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .contentPadding,
                            ),
                            onSaved: (String? value) {
                              controller.emailAddress = value!;
                            },
                          ),
                          spacing(),
                          Text(AppLocalizations.of(context)!.password, style: Theme.of(context).textTheme.subtitle1),

                          TextFormField(
                            controller: _password,
                            autocorrect: true,
                            autofocus: true,
                            cursorColor: (kOrangeColor),
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            validator: Validator.validatePassword,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.passwordText,

                              hintStyle: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .hintStyle,
                              errorStyle: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .errorStyle,
                              border: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .border,
                              enabledBorder: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .enabledBorder,
                              focusedBorder: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .focusedBorder,
                              focusedErrorBorder: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .focusedErrorBorder,
                              errorBorder: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .errorBorder,
                              contentPadding: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .contentPadding,
                            ),
                            onSaved: (String? value) {
                              controller.password = value!;
                            },
                          ),
                        ],
                      ),
                    ),


                    spacing(),
                    spacing(),
                    Center(
                      child: GeneralButton(
                        title: AppLocalizations.of(context)!.register.toUpperCase(),
                        color: kNavyColor,
                        tapSmsButton: () async {
                      final form = _formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                       await controller.registerUser();
                      }
                        },
                      ),
                    )


                  ],
                )
            ),
          ),
      ),
      ),
    ));

  }
}