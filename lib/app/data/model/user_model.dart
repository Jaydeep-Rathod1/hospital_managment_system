class UserModel {
  String? userId;
  String? userType;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? designation;
  String? departmentId;
  String? address;
  String? mobileNo;
  String? altMobileNo;
  String? profilePicture;
  String? dateOfBirth;
  String? education;
  String? descritption;
  String? status;
  String? gender;
  String? bloodGroup;
  String? charge;
  String? experience;
  String? isVerify;
  String? isApporve;
  String? isDelete;
  String? createdAt;
  String? updatedAt;
  String? departmentName;

  UserModel(
      {this.userId,
        this.userType,
        this.firstname,
        this.lastname,
        this.email,
        this.password,
        this.designation,
        this.departmentId,
        this.address,
        this.mobileNo,
        this.altMobileNo,
        this.profilePicture,
        this.dateOfBirth,
        this.education,
        this.descritption,
        this.status,
        this.gender,
        this.bloodGroup,
        this.charge,
        this.experience,
        this.isVerify,
        this.isApporve,
        this.isDelete,
        this.createdAt,
        this.updatedAt,
        this.departmentName
      });

  // UserModel.fromJson(Map<String, dynamic> json) {
  //   userId = json['user_id'];
  //   userType = json['user_type'];
  //   firstname = json['firstname'];
  //   lastname = json['lastname'];
  //   email = json['email'];
  //   password = json['password'];
  //   designation = json['designation'] ?? "";
  //   departmentId = json['department_id'];
  //   address = json['address'] ?? "";
  //   mobileNo = json['mobile_no'];
  //   altMobileNo = json['alt_mobile_no'];
  //   profilePicture = json['profile_picture'] ?? "";
  //   dateOfBirth = json['date_of_birth'] ?? "";
  //   education = json['education'] ?? "";
  //   descritption = json['descritption'] ?? "";
  //   status = json['status'] ?? "";
  //   gender = json['gender'] ?? "";
  //   bloodGroup = json['blood_group'] ?? "";
  //   charge = json['charge'] != null ? json['charge'] :  "";
  //   experience = json['experience'] != null ? json['experience'] :  "";
  //   isVerify = json['is_verify'] ?? "";
  //   isApporve = json['is_apporve'] ?? "";
  //   isDelete = json['is_delete'] ?? "";
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  // }
  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? "";
    userType = json['user_type'] ?? "";
    firstname = json['firstname'] ?? "";
    lastname = json['lastname']  ?? "" ;
    email = json['email'] ?? "";
    password = json['password'] ?? "";
    designation = json['designation'] ?? "";
    departmentId = json['department_id'] ?? "";
    address = json['address'] ?? "";
    mobileNo = json['mobile_no'] ?? "";
    altMobileNo = json['alt_mobile_no'] ?? ""; // Set to empty string if null
    profilePicture = json['profile_picture'] ?? "";
    dateOfBirth = json['date_of_birth'] ?? "";
    education = json['education'] ?? "";
    descritption = json['descritption'] ?? "";
    status = json['status'] ?? "";
    gender = json['gender'] ?? "";
    bloodGroup = json['blood_group'] ?? "";
    charge = json['charge'] ?? ""; // Set to empty string if null
    experience = json['experience'] ?? ""; // Set to empty string if null
    isVerify = json['is_verify'] ?? "";
    isApporve = json['is_apporve'] ?? "";
    isDelete = json['is_delete'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "" ;
    departmentName = json['department_name'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['designation'] = this.designation;
    data['department_id'] = this.departmentId;
    data['address'] = this.address;
    data['mobile_no'] = this.mobileNo;
    data['alt_mobile_no'] = this.altMobileNo;
    data['profile_picture'] = this.profilePicture;
    data['date_of_birth'] = this.dateOfBirth;
    data['education'] = this.education;
    data['descritption'] = this.descritption;
    data['status'] = this.status;
    data['gender'] = this.gender;
    data['blood_group'] = this.bloodGroup;
    data['charge'] = this.charge;
    data['experience'] =  this.experience;
    data['is_verify'] = this.isVerify;
    data['is_apporve'] = this.isApporve;
    data['is_delete'] = this.isDelete;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['department_name'] = this.departmentName;
    return data;
  }
}
