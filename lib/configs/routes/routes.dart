import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/screens/bottom/about_us_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/check_balance_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/deposit_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/packages_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/quick_loan_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/referrals_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/withdraw_screen.dart';
import 'package:v1_micro_finance/screens/profile/edit_profile_screen.dart';
import 'package:v1_micro_finance/screens/auth/forgot_password.dart';
import 'package:v1_micro_finance/screens/bottom/home_screen.dart';
import 'package:v1_micro_finance/screens/auth/signin_screen.dart';
import 'package:v1_micro_finance/screens/auth/signup_screen.dart';
import 'package:v1_micro_finance/screens/profile/my_account_screen.dart';
import 'package:v1_micro_finance/screens/profile/nominee_screen.dart';
import 'package:v1_micro_finance/screens/profile/profile.dart';
import 'package:v1_micro_finance/screens/splash_screen.dart';
import 'package:v1_micro_finance/screens/bottom/statement_screen.dart';
import 'package:v1_micro_finance/screens/auth/verification.dart';
import 'package:v1_micro_finance/screens/withdraw/bank_withdrawal_screen.dart';
import 'package:v1_micro_finance/screens/withdraw/crypto_withdrawal_screen.dart';
import 'package:v1_micro_finance/test/test.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.aboutUsScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => AboutUsScreen());

      case RoutesName.editProfileScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => EditProfileScreen());

      case RoutesName.forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => ForgotPasswordScreen());

      case RoutesName.homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());

      case RoutesName.signInScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignInScreen());

      case RoutesName.signupScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignupScreen());

      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());

      case RoutesName.statementScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => StatementScreen());

      case RoutesName.verificationScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => VerificationScreen());

      case RoutesName.checkBalanceScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => CheckBalanceScreen());

      case RoutesName.depositScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => DepositScreen());

      case RoutesName.packagesScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => PackagesScreen());

      case RoutesName.quickLoanScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => QuickLoanScreen());

      case RoutesName.referralsScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => ReferralsScreen());

      case RoutesName.withdrawScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => WithdrawScreen());

      case RoutesName.bankWithdrawalScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => BankWithdrawalScreen());

      case RoutesName.cryptoWithdrawalScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => CryptoWithdrawalScreen());

      case RoutesName.testScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => TestScreen());

      case RoutesName.profileScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => ProfileScreen());

      case RoutesName.nomineeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => NomineeScreen());

      case RoutesName.userScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => UserScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
