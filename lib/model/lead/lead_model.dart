

class LeadModel {
  String? name;
  int? mobile;
  String? address;
  String? occupation;
  String? business;
  String? turnover;
  String? dob;
  String? remarks;
  String? date;
  int? type;

  LeadModel({this.name, this.mobile, this.address, this.occupation,this.business,
    this.turnover,this.dob,this.type});

  LeadModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    address = json['address'];
    occupation = json['occupation'];
    business = json['business'];
    turnover = json['turnover'];
    dob = json['dob'];
    type = json['type'];
    remarks = json['remarks'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['mobile'] = mobile;
    data['address'] = address;
    data['occupation'] = occupation;
    data['business'] = business;
    data['turnover'] = turnover;
    data['dob'] = dob;
    data['type'] = type;
    data['remarks'] = remarks;
    data['date'] = date;

    return data;
  }
}
