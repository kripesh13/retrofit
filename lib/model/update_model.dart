class UpdateModel {
  String? name;
  String? job;
  String? role;
  String? updatedAt;

  UpdateModel({this.name, this.job, this.role, this.updatedAt});

  UpdateModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    role = json['role'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    data['role'] = this.role;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
