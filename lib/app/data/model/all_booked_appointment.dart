class AllBookedAppointment {
  String? appointmentDate;
  String? appointmentTime;

  AllBookedAppointment({this.appointmentDate, this.appointmentTime});

  AllBookedAppointment.fromJson(Map<String, dynamic> json) {
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointment_date'] = this.appointmentDate;
    data['appointment_time'] = this.appointmentTime;
    return data;
  }
}
