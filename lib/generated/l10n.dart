// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get title {
    return Intl.message(
      'Settings',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get reset_password {
    return Intl.message(
      'Change Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Change Email Address`
  String get change_email {
    return Intl.message(
      'Change Email Address',
      name: 'change_email',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get choose_language_title {
    return Intl.message(
      'Choose Language',
      name: 'choose_language_title',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `My QR Code`
  String get my_qr_code {
    return Intl.message(
      'My QR Code',
      name: 'my_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get my_account {
    return Intl.message(
      'My Account',
      name: 'my_account',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `My History`
  String get my_history {
    return Intl.message(
      'My History',
      name: 'my_history',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get enter_your_phone_number {
    return Intl.message(
      'Phone Number',
      name: 'enter_your_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get log_in {
    return Intl.message(
      'Log in',
      name: 'log_in',
      desc: '',
      args: [],
    );
  }

  /// `Not a member ? `
  String get not_member {
    return Intl.message(
      'Not a member ? ',
      name: 'not_member',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `the Password must not be empty`
  String get the_Password_must_not_be_empty {
    return Intl.message(
      'the Password must not be empty',
      name: 'the_Password_must_not_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `the phone number must not be empty`
  String get the_phone_number_must_not_be_empty {
    return Intl.message(
      'the phone number must not be empty',
      name: 'the_phone_number_must_not_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Activation`
  String get activation {
    return Intl.message(
      'Activation',
      name: 'activation',
      desc: '',
      args: [],
    );
  }

  /// `STEP 1 : Identification`
  String get step_1 {
    return Intl.message(
      'STEP 1 : Identification',
      name: 'step_1',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number and your CIN`
  String get enter_your_phone_number_and_your_cin {
    return Intl.message(
      'Enter your phone number and your CIN',
      name: 'enter_your_phone_number_and_your_cin',
      desc: '',
      args: [],
    );
  }

  /// `phone Number Already Exist`
  String get phone_number_already_exist {
    return Intl.message(
      'phone Number Already Exist',
      name: 'phone_number_already_exist',
      desc: '',
      args: [],
    );
  }

  /// `the CIN must not be empty`
  String get the_cin_must_not_be_empty {
    return Intl.message(
      'the CIN must not be empty',
      name: 'the_cin_must_not_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Cin Already Exist`
  String get cin_already_exist {
    return Intl.message(
      'Cin Already Exist',
      name: 'cin_already_exist',
      desc: '',
      args: [],
    );
  }

  /// `CIN`
  String get cin {
    return Intl.message(
      'CIN',
      name: 'cin',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, you agree to the terms and conditions of use `
  String get terms_of_use {
    return Intl.message(
      'By continuing, you agree to the terms and conditions of use ',
      name: 'terms_of_use',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get next {
    return Intl.message(
      'NEXT',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Send money`
  String get send_money {
    return Intl.message(
      'Send money',
      name: 'send_money',
      desc: '',
      args: [],
    );
  }

  /// `Receive money`
  String get receive_money {
    return Intl.message(
      'Receive money',
      name: 'receive_money',
      desc: '',
      args: [],
    );
  }

  /// `Scan Qr Code`
  String get scan_qr_code {
    return Intl.message(
      'Scan Qr Code',
      name: 'scan_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get acceuil {
    return Intl.message(
      'Home',
      name: 'acceuil',
      desc: '',
      args: [],
    );
  }

  /// `MAD`
  String get dh {
    return Intl.message(
      'MAD',
      name: 'dh',
      desc: '',
      args: [],
    );
  }

  /// `Transfer to`
  String get transfer_to {
    return Intl.message(
      'Transfer to',
      name: 'transfer_to',
      desc: '',
      args: [],
    );
  }

  /// `Services\n`
  String get services {
    return Intl.message(
      'Services\n',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Transfer\n`
  String get transfer {
    return Intl.message(
      'Transfer\n',
      name: 'transfer',
      desc: '',
      args: [],
    );
  }

  /// `Top up`
  String get top_up {
    return Intl.message(
      'Top up',
      name: 'top_up',
      desc: '',
      args: [],
    );
  }

  /// `Mobile\nRefill`
  String get mobile_refill {
    return Intl.message(
      'Mobile\nRefill',
      name: 'mobile_refill',
      desc: '',
      args: [],
    );
  }

  /// `Bill\nPayment`
  String get bill_payment {
    return Intl.message(
      'Bill\nPayment',
      name: 'bill_payment',
      desc: '',
      args: [],
    );
  }

  /// `Merchant\nPayment`
  String get merchant_payment {
    return Intl.message(
      'Merchant\nPayment',
      name: 'merchant_payment',
      desc: '',
      args: [],
    );
  }

  /// `Airplane\nTicket`
  String get airplane_ticket {
    return Intl.message(
      'Airplane\nTicket',
      name: 'airplane_ticket',
      desc: '',
      args: [],
    );
  }

  /// `More\n`
  String get more {
    return Intl.message(
      'More\n',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Top up\n`
  String get top_up_acceuil {
    return Intl.message(
      'Top up\n',
      name: 'top_up_acceuil',
      desc: '',
      args: [],
    );
  }

  /// `STEP 2 : Identification \n`
  String get step_2 {
    return Intl.message(
      'STEP 2 : Identification \n',
      name: 'step_2',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to `
  String get Enter_the_code_sent_to {
    return Intl.message(
      'Enter the code sent to ',
      name: 'Enter_the_code_sent_to',
      desc: '',
      args: [],
    );
  }

  /// `Didnt receive the code `
  String get Didnt_receive_the_code {
    return Intl.message(
      'Didnt receive the code ',
      name: 'Didnt_receive_the_code',
      desc: '',
      args: [],
    );
  }

  /// `RESEND`
  String get RESEND {
    return Intl.message(
      'RESEND',
      name: 'RESEND',
      desc: '',
      args: [],
    );
  }

  /// `MODIFY`
  String get MODIFY {
    return Intl.message(
      'MODIFY',
      name: 'MODIFY',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get NEXT {
    return Intl.message(
      'NEXT',
      name: 'NEXT',
      desc: '',
      args: [],
    );
  }

  /// `STEP 3 : information `
  String get step_3 {
    return Intl.message(
      'STEP 3 : information ',
      name: 'step_3',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first, last name and email address `
  String get Enter_your_first_last_name {
    return Intl.message(
      'Enter your first, last name and email address ',
      name: 'Enter_your_first_last_name',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get Email {
    return Intl.message(
      'E-mail',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get First_name {
    return Intl.message(
      'First name',
      name: 'First_name',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get Last_name {
    return Intl.message(
      'Last name',
      name: 'Last_name',
      desc: '',
      args: [],
    );
  }

  /// `STEP 4 Security`
  String get Security {
    return Intl.message(
      'STEP 4 Security',
      name: 'Security',
      desc: '',
      args: [],
    );
  }

  /// ` Enter your password twice`
  String get Enter_new_password {
    return Intl.message(
      ' Enter your password twice',
      name: 'Enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confrim your password`
  String get Confirm_password {
    return Intl.message(
      'Confrim your password',
      name: 'Confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `CREATE`
  String get CREATE {
    return Intl.message(
      'CREATE',
      name: 'CREATE',
      desc: '',
      args: [],
    );
  }

  /// `Open Email APP`
  String get Open_Email_App {
    return Intl.message(
      'Open Email APP',
      name: 'Open_Email_App',
      desc: '',
      args: [],
    );
  }

  /// `Transfer to`
  String get Transfer_to {
    return Intl.message(
      'Transfer to',
      name: 'Transfer_to',
      desc: '',
      args: [],
    );
  }

  /// `Money Transfer`
  String get Money_transfer {
    return Intl.message(
      'Money Transfer',
      name: 'Money_transfer',
      desc: '',
      args: [],
    );
  }

  /// `Top Up \nYour PAYIT`
  String get Top_up_your_wallet {
    return Intl.message(
      'Top Up \nYour PAYIT',
      name: 'Top_up_your_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Pay your\nmerchand`
  String get Pay_your_merchand {
    return Intl.message(
      'Pay your\nmerchand',
      name: 'Pay_your_merchand',
      desc: '',
      args: [],
    );
  }

  /// `Recharge\nMobile`
  String get Phone_charging {
    return Intl.message(
      'Recharge\nMobile',
      name: 'Phone_charging',
      desc: '',
      args: [],
    );
  }

  /// `Invoice\npayment`
  String get Invoice_payment {
    return Intl.message(
      'Invoice\npayment',
      name: 'Invoice_payment',
      desc: '',
      args: [],
    );
  }

  /// `Ticket\nPlan `
  String get Ticket_plan {
    return Intl.message(
      'Ticket\nPlan ',
      name: 'Ticket_plan',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get More {
    return Intl.message(
      'More',
      name: 'More',
      desc: '',
      args: [],
    );
  }

  /// `DISCOVER THE FUTURE WITH US`
  String get Splash_Screen {
    return Intl.message(
      'DISCOVER THE FUTURE WITH US',
      name: 'Splash_Screen',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `the Email must not be empty `
  String get emailcontrollermsg {
    return Intl.message(
      'the Email must not be empty ',
      name: 'emailcontrollermsg',
      desc: '',
      args: [],
    );
  }

  /// `First Name must not be empty `
  String get firstnamecontrollermsg {
    return Intl.message(
      'First Name must not be empty ',
      name: 'firstnamecontrollermsg',
      desc: '',
      args: [],
    );
  }

  /// `Last Name must not be empty`
  String get lastnameecontrollermsg {
    return Intl.message(
      'Last Name must not be empty',
      name: 'lastnameecontrollermsg',
      desc: '',
      args: [],
    );
  }

  /// `Email already exist`
  String get email_existe {
    return Intl.message(
      'Email already exist',
      name: 'email_existe',
      desc: '',
      args: [],
    );
  }

  /// `Email `
  String get HintEmail {
    return Intl.message(
      'Email ',
      name: 'HintEmail',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get HintFirstname {
    return Intl.message(
      'First Name',
      name: 'HintFirstname',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get HintLastname {
    return Intl.message(
      'Last Name',
      name: 'HintLastname',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `confirm password`
  String get confirm_password {
    return Intl.message(
      'confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `password must not be empty`
  String get passwordcontrollermg {
    return Intl.message(
      'password must not be empty',
      name: 'passwordcontrollermg',
      desc: '',
      args: [],
    );
  }

  /// `your phone number is verified`
  String get phonenumberverified {
    return Intl.message(
      'your phone number is verified',
      name: 'phonenumberverified',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
