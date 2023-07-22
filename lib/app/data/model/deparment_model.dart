class DepartmentModel {
  String? departmentId;
  String? name;
  String? description;
  String? departmentPicture;
  String? status;

  DepartmentModel(
      {this.departmentId,
        this.name,
        this.description,
        this.departmentPicture,
        this.status});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    departmentId = json['department_id'];
    name = json['name'];
    description = json['description'];
    departmentPicture = json['department_picture'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department_id'] = this.departmentId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['department_picture'] = this.departmentPicture;
    data['status'] = this.status;
    return data;
  }
}
