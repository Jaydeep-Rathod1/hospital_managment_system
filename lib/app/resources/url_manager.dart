
class UrlManager{
  static String MAIN_URL = "http://192.168.0.108/hms/";
  static String BASE_URL = "${MAIN_URL}api/";
  static String LOGIN_URL = "${BASE_URL}login.php";
  static String REGISTER_URL = "${BASE_URL}register.php";
  static String FORGOTPASSWORD_URL = "${BASE_URL}forgot_password.php";
  static String RESETPASSWORD_URL = "${BASE_URL}reset_password.php";
  static String DEPARTMENT_URL = "${BASE_URL}department_all.php";
  static String DOCTOR_BY_DEPARTMENT_URL = "${BASE_URL}doctor_all.php";
  // static String CLIENTLIST_URL = BASE_URL+"userlist";
  // static String STATELIST_URL = BASE_URL+"statelist";
}