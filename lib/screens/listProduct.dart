import 'package:amazon_clone_new/Compnents/general_button.dart';
import 'package:amazon_clone_new/Compnents/loadingIcon.dart';
import 'package:amazon_clone_new/Controllers/product_c.dart';
import 'package:amazon_clone_new/Services/product.dart';
import 'package:amazon_clone_new/Util/colors.dart';
import 'package:amazon_clone_new/Util/constants.dart';
import 'package:amazon_clone_new/Util/dimen.dart';
import 'package:amazon_clone_new/Util/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class ProductListingScreen extends StatelessWidget {
   ProductListingScreen({Key? key}) : super(key: key);
   final controller = Get.put(ProductController());

  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productType= TextEditingController();
  final TextEditingController _productSize= TextEditingController();
  final TextEditingController _productStock = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget spacing(){
    return SizedBox(height: 20.h);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   bottomNavigationBar:  SizedBox(
     height: 56.h,
     width: MediaQuery.of(context).size.width,
     child: GeneralButton(
       title: "Add Product".toUpperCase(),
       color: kNavyColor,
       tapSmsButton: () async {
         final form = _formKey.currentState;
         if (form!.validate()) {
           form.save();
           //await controller.addProduct();

           await controller.addProduct();
         }

       },
     ),
   ),
      body: GetBuilder<ProductController>(
          builder: (_) => ProgressHUDFunction(
      inAsyncCall: controller.isRegLoading,
      child:Container(
        margin: const EdgeInsets.symmetric(horizontal: kMargin),
        child: SingleChildScrollView(
          child: Column(
            children: [


      Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        spacing(),
         TextHeading(title: AppLocalizations.of(context)!.productName),

        TextFormField(
          controller: _productName,
          autocorrect: true,
          autofocus: true,
          cursorColor: (kOrangeColor),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          style: Theme.of(context).textTheme.bodyText1,
          validator: Validator.validateProductName,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.productName,
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
            productName= value!;
          },
        ),

        spacing(),
        TextHeading(title: AppLocalizations.of(context)!.productType),
        TextFormField(
          controller: _productType,
          autocorrect: true,
          autofocus: true,
          cursorColor: (kOrangeColor),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          style: Theme.of(context).textTheme.bodyText1,
          validator: Validator.validateProductType,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.productType,
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
            productType= value!;
          },
        ),



        spacing(),
        TextHeading(title: AppLocalizations.of(context)!.productSize),
        TextFormField(
          controller: _productSize,
          autocorrect: true,
          autofocus: true,
          cursorColor: (kOrangeColor),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          style: Theme.of(context).textTheme.bodyText1,
          validator: Validator.validateProductSize,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.productSize,
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
            productSize= value!;
          },
        ),


        spacing(),
        TextHeading(title: AppLocalizations.of(context)!.productStock),
        TextFormField(
          controller: _productStock,
          autocorrect: true,
          autofocus: true,
          cursorColor: (kOrangeColor),
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.bodyText1,
          validator: Validator.validateProductStock,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,

          ],
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.productStock,
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
            productStock = value;
          },
        ),


        spacing(),
        TextHeading(title: AppLocalizations.of(context)!.productPrice),
        TextFormField(
          controller: _productPrice,
          autocorrect: true,
          autofocus: true,
          cursorColor: (kOrangeColor),
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.bodyText1,
          validator: Validator.validateProductStock,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,

          ],
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.productPrice,
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
            productPrice = double.parse(value!);
          },
        ),


        spacing(),
        TextHeading(title: AppLocalizations.of(context)!.productImage),

        GeneralButton(
          title: "Choose product image",
          color: Colors.cyan,
          tapSmsButton: () async {
            await controller.getImageFromGallery();

          },

      ),


        imageFile == null?const Text("No product photo picked"):TextHeading(title: imageFile.toString()),



      ])),


            ],
          ),
        ),
      ),
    )));
  }
}

class TextHeading extends StatelessWidget {
  const TextHeading({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Text(title, style: Theme.of(context).textTheme.subtitle1);

  }
}
