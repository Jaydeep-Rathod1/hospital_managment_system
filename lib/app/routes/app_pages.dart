import 'package:get/get.dart';
import '../modules/alldoctors/bindings/alldoctors_binding.dart';
import '../modules/alldoctors/views/alldoctors_view.dart';
import '../modules/appointment/bindings/appointment_binding.dart';
import '../modules/appointment/views/appointment_view.dart';
import '../modules/confirmappointment/bindings/confirmappointment_binding.dart';
import '../modules/confirmappointment/views/confirmappointment_view.dart';
import '../modules/departments/bindings/departments_binding.dart';
import '../modules/departments/views/departments_view.dart';
import '../modules/doctorbydepartments/bindings/doctorbydepartments_binding.dart';
import '../modules/doctorbydepartments/views/doctorbydepartments_view.dart';
import '../modules/doctordetails/bindings/doctordetails_binding.dart';
import '../modules/doctordetails/views/doctordetails_view.dart';
import '../modules/editprofileview/bindings/editprofileview_binding.dart';
import '../modules/editprofileview/views/editprofileview_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/forgotpassword/bindings/forgotpassword_binding.dart';
import '../modules/forgotpassword/views/forgotpassword_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/myappointment/bindings/myappointment_binding.dart';
import '../modules/myappointment/views/myappointment_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/passwordChangeSuceess/bindings/password_change_suceess_binding.dart';
import '../modules/passwordChangeSuceess/views/password_change_suceess_view.dart';
import '../modules/privacypolicy/bindings/privacypolicy_binding.dart';
import '../modules/privacypolicy/views/privacypolicy_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/registerComplete/bindings/register_complete_binding.dart';
import '../modules/registerComplete/views/register_complete_view.dart';
import '../modules/reports/bindings/reports_binding.dart';
import '../modules/reports/views/reports_view.dart';
import '../modules/resetpassword/bindings/resetpassword_binding.dart';
import '../modules/resetpassword/views/resetpassword_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/termsandcondition/bindings/termsandcondition_binding.dart';
import '../modules/termsandcondition/views/termsandcondition_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENT,
      page: () => const AppointmentView(),
      binding: AppointmentBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REPORTS,
      page: () => const ReportsView(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => const ForgotpasswordView(),
      binding: ForgotpasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => const ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_COMPLETE,
      page: () => const RegisterCompleteView(),
      binding: RegisterCompleteBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_CHANGE_SUCEESS,
      page: () => const PasswordChangeSuceessView(),
      binding: PasswordChangeSuceessBinding(),
    ),
    GetPage(
      name: _Paths.DEPARTMENTS,
      page: () => const DepartmentsView(),
      binding: DepartmentsBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.DOCTORBYDEPARTMENTS,
      page: () => const DoctorbydepartmentsView(),
      binding: DoctorbydepartmentsBinding(),
    ),

    GetPage(
      name: _Paths.ALLDOCTORS,
      page: () => const AlldoctorsView(),
      binding: AlldoctorsBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFILEVIEW,
      page: () => const EditprofileviewView(),
      binding: EditprofileviewBinding(),
    ),
    GetPage(
      name: _Paths.DOCTORDETAILS,
      page: () => const DoctordetailsView(),
      binding: DoctordetailsBinding(),
    ),
    GetPage(
      name: _Paths.MYAPPOINTMENT,
      page: () => const MyappointmentView(),
      binding: MyappointmentBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => const FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACYPOLICY,
      page: () => const PrivacypolicyView(),
      binding: PrivacypolicyBinding(),
    ),
    GetPage(
      name: _Paths.TERMSANDCONDITION,
      page: () => const TermsandconditionView(),
      binding: TermsandconditionBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRMAPPOINTMENT,
      page: () => const ConfirmappointmentView(),
      binding: ConfirmappointmentBinding(),
    ),

  ];
}
