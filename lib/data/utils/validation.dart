
class GValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName را وارد کنید';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'ایمیل را وارد کنید';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'ادرس ایمیل درست نیست';
    }
    return null;
  }

  static String? validationPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'گذرواژه را وارد کنید';
    }
    if (value.length < 6) {
      return 'گذرواژه حداقل باید ۶ حرف باشد';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'گذرواژه باید حداقل شامل یک حرف بزرگ باشد';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'گذرواژه باید حداقل شامل یک عدد باشد';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'گذرواژه باید حداقل شامل یک علامت خاص باشد';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'شماره موبایل را وارد کنید';
    }
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'شماره موبایل نامعتبر است';
    }
    return null;
  }
}
