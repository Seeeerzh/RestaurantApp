import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _keyUsername = 'username';
  // ignore: constant_identifier_names
   static const _keyAddress = 'address';
  static const _keyNumber = 'number';
  static const _keyCurrency = 'currency';
   static const _keyUsername1 = 'username1';
  // ignore: constant_identifier_names
   static const _keyAddress1 = 'address1';
    static const _keyNumber1 = 'number1';
    static const _keyemail = 'email';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async =>
      await _preferences.setString(_keyUsername, username);

  static String? getUsername() => _preferences.getString(_keyUsername);

  static Future setAddress(String address) async =>
      await _preferences.setString(_keyAddress, address);

  static String? getAddress() => _preferences.getString(_keyAddress);

  static Future setNumber(String number) async =>
      await _preferences.setString(_keyNumber, number);

  static String? getNumber() => _preferences.getString(_keyNumber);

  static Future setCurrency(String currency) async =>
      await _preferences.setString(_keyCurrency, currency);

  static String? getCurrency() => _preferences.getString(_keyCurrency);
  
  static Future setUsername1(String username1) async =>
      await _preferences.setString(_keyUsername1, username1);

  static String? getUsername1() => _preferences.getString(_keyUsername1);

  static Future setAddress1(String address1) async =>
      await _preferences.setString(_keyAddress1, address1);

  static String? getAddress1() => _preferences.getString(_keyAddress1);

  static Future setNumber1(String number1) async =>
      await _preferences.setString(_keyNumber1, number1);

  static String? getNumber1() => _preferences.getString(_keyNumber1);

  static Future setEmail(String email) async =>
      await _preferences.setString(_keyemail,email);

  static String? getEmail() => _preferences.getString(_keyemail);
}