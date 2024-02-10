


class CommonResponseModel {
  String? accessToken;
  int? id;
  String? status;

  CommonResponseModel({this.accessToken, this.id, this.status});

  CommonResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['id'] = this.id;
    data['status'] = this.status;
    return data;
  }
}
