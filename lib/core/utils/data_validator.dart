class DataValidator {
  /// Check if string is empty or null
  static bool isStringEmpty(String? value) {
    return value == null|| value.trim() == "null" || value.trim().isEmpty ;
  }

  /// Check if string is not empty and not null
  static bool isStringNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  /// Check if map is empty or null
  static bool isMapEmpty(Map? value) {
    return value == null || value.isEmpty;
  }

  /// Check if map is not empty and not null
  static bool isMapNotEmpty(Map? value) {
    return value != null && value.isNotEmpty;
  }

  /// Check if list is empty or null
  static bool isListEmpty(List? value) {
    return value == null || value.isEmpty;
  }

  /// Check if list is not empty and not null
  static bool isListNotEmpty(List? value) {
    return value != null && value.isNotEmpty;
  }

  /// Check if value is null
  static bool isNull(dynamic value) {
    return value == null;
  }

  /// Check if value is not null
  static bool isNotNull(dynamic value) {
    return value != null;
  }

  /// Check if number is empty or null
  static bool isNumberEmpty(num? value) {
    return value == null;
  }

  /// Check if number is zero
  static bool isZero(num? value) {
    return value == null || value == 0;
  }

  /// Check if boolean is true
  static bool isTrue(bool? value) {
    return value == true;
  }

  /// Check if boolean is false
  static bool isFalse(bool? value) {
    return value == false;
  }

  static bool checkString(dynamic value) {
   
    

    

    return value.toString().trim().isEmpty || value.toString().trim() == "null" || value.toString().trim() == "Null" ? false : true;
  }
  /// Check if value is empty (works for String, List, Map)
  static bool checkData(dynamic value) {
    if (value == null) {
      return false;
    }

    if (value is String) {
      return value.trim().isEmpty || value.trim() == "null" || value.trim() == "Null" ? false : true;
    }

    if (value is List) {
      return value.isEmpty;
    }

    if (value is Map) {
      return value.isEmpty;
    }

    return false;
  }

  /// Check if value is not empty (works for String, List, Map)
  static bool isNotEmpty(dynamic value) {
    return !checkData(value);
  }

  /// Check if email is valid
  static bool isValidEmail(String? value) {
    if (isStringEmpty(value)) return false;
    
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    return emailRegExp.hasMatch(value!);
  }

  /// Check if phone number is valid (10 digits)
  static bool isValidPhone(String? value) {
    if (isStringEmpty(value)) return false;
    
    final phoneRegExp = RegExp(r'^\d{10}$');
    return phoneRegExp.hasMatch(value!);
  }

  /// Check if URL is valid
  static bool isValidUrl(String? value) {
    if (isStringEmpty(value)) return false;
    
    final urlRegExp = RegExp(
      r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$',
    );
    return urlRegExp.hasMatch(value!);
  }

  /// Check if password is strong
  static bool isStrongPassword(String? value) {
    if (isStringEmpty(value)) return false;
    
    // At least 8 characters, 1 uppercase, 1 lowercase, 1 number
    final passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$',
    );
    return passwordRegExp.hasMatch(value!);
  }
}