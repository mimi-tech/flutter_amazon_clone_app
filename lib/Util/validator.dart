class Validator {


  static String? validateFullName(String? value) {
    if (value!.isEmpty) {
      return "Full name can't be empty";
    }
    if (value.length < 6) {
      return "Full name is too short";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Password can't be empty";
    }
    if (value.length < 6) {
      return "Password is too short";
    }

    return null;
  }

  static String? validateProductName(String? value) {
    if (value!.isEmpty) {
      return "Product name can't be empty";
    }
    if (value.length < 2) {
      return "Product name is too short";
    }

    return null;
  }


  static String? validateProductType(String? value) {
    if (value!.isEmpty) {
      return "Product type can't be empty";
    }
    if (value.length < 4) {
      return "Product type is too short";
    }

    return null;
  }


  static String? validateProductSize(String? value) {
    if (value!.isEmpty) {
      return "product size can't be empty";
    }


    return null;
  }


  static String? validateProductStock(String? value) {
    if (value!.isEmpty) {
      return "Product stock can't be empty";
    }
    if (int.parse(value) <= 0) {
      return "Product stock should be 0";
    }

    return null;
  }

  static String? validateEmail(String? value) {
    RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value!.isEmpty) {
      return "Email address can't be empty";
    }
    if (value.length < 2) {
      return "Email address is too short";
    }
    if (!regex.hasMatch(value)) {
      return "Please provide a valid email address";
    }
    return null;
  }


  static String? validateAmount(String? value) {
    if (value!.isEmpty) {
      return "Amount can't be empty";
    }
    if (int.parse(value) < 100) {
      return "Amount should be less than 100 NGN";
    }

    return null;
  }

}
