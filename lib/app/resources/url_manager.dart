
class UrlManager{
  static String MAIN_URL = "http://192.168.0.105/hms/";
  static String BASE_URL = "${MAIN_URL}api/";
  static String DEPARTMENTPHOTO_URL = "${MAIN_URL}admin/images/department_img/";
  static String DOCTORPHOTO_URL = "${MAIN_URL}admin/images/doctor_img/";
  static String PATIENTPHOTO_URL = "${MAIN_URL}admin/images/patient_img/";
  // static String DEPARTMENTPHOTO_URL = "http://192.168.0.108/hms/admin/images/department_img/";
  static String LOGIN_URL = "${BASE_URL}login.php";
  static String REGISTER_URL = "${BASE_URL}register.php";
  static String FORGOTPASSWORD_URL = "${BASE_URL}forgot_password.php";
  static String RESETPASSWORD_URL = "${BASE_URL}reset_password.php";
  static String DASHBORAD = "${BASE_URL}dashboard.php";
  static String DEPARTMENT_URL = "${BASE_URL}department_all.php";
  static String DOCTOR_BY_DEPARTMENT_URL = "${BASE_URL}doctor_by_department.php";
  static String DOCTOR_ALL = "${BASE_URL}all_doctors.php";
  // static String CLIENTLIST_URL = BASE_URL+"userlist";
  // static String STATELIST_URL = BASE_URL+"statelist";
}