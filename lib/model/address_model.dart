class AddressModel {
  bool? error;
  List<ProvinceList>? data;
  String? msg;

  AddressModel({this.error, this.data, this.msg});

  AddressModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = <ProvinceList>[];
      json['data'].forEach((v) {
        data!.add(new ProvinceList.fromJson(v));
      });
    }
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    return data;
  }
}

class ProvinceList {
  int? id;
  String? engName;
  String? status;
  Null? createdAt;
  String? updatedAt;
  int? publishStatus;
  List<DistrictsList>? districts;

  ProvinceList(
      {this.id,
      this.engName,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.publishStatus,
      this.districts});

  ProvinceList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    engName = json['eng_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    publishStatus = json['publishStatus'];
    if (json['districts'] != null) {
      districts = <DistrictsList>[];
      json['districts'].forEach((v) {
        districts!.add(new DistrictsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['eng_name'] = this.engName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['publishStatus'] = this.publishStatus;
    if (this.districts != null) {
      data['districts'] = this.districts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DistrictsList {
  int? id;
  int? province;
  int? distId;
  int? publishStatus;
  String? npName;
  String? createdAt;
  String? updatedAt;
  List<LocalArea>? localarea;

  DistrictsList(
      {this.id,
      this.province,
      this.distId,
      this.publishStatus,
      this.npName,
      this.createdAt,
      this.updatedAt,
      this.localarea});

  DistrictsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    province = json['province'];
    distId = json['dist_id'];
    publishStatus = json['publishStatus'];
    npName = json['np_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['localarea'] != null) {
      localarea = <LocalArea>[];
      json['localarea'].forEach((v) {
        localarea!.add(new LocalArea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['province'] = this.province;
    data['dist_id'] = this.distId;
    data['publishStatus'] = this.publishStatus;
    data['np_name'] = this.npName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.localarea != null) {
      data['localarea'] = this.localarea!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocalArea {
  int? id;
  int? provinceId;
  int? distId;
  int? localLevelId;
  double? localId;
  int? publishStatus;
  String? localName;
  String? createdAt;
  String? updatedAt;
  List<GetRouteCharge>? getRouteCharge;

  LocalArea(
      {this.id,
      this.provinceId,
      this.distId,
      this.localLevelId,
      this.localId,
      this.publishStatus,
      this.localName,
      this.createdAt,
      this.updatedAt,
      this.getRouteCharge});

  LocalArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provinceId = json['province_id'];
    distId = json['dist_id'];
    localLevelId = json['local_level_id'];
    localId = json['local_id'];
    publishStatus = json['publishStatus'];
    localName = json['local_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['get_route_charge'] != null) {
      getRouteCharge = <GetRouteCharge>[];
      json['get_route_charge'].forEach((v) {
        getRouteCharge!.add(new GetRouteCharge.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['province_id'] = this.provinceId;
    data['dist_id'] = this.distId;
    data['local_level_id'] = this.localLevelId;
    data['local_id'] = this.localId;
    data['publishStatus'] = this.publishStatus;
    data['local_name'] = this.localName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.getRouteCharge != null) {
      data['get_route_charge'] =
          this.getRouteCharge!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetRouteCharge {
  int? id;
  int? localId;
  String? title;
  String? slug;
  Null? image;
  String? zipCode;

  GetRouteCharge(
      {this.id, this.localId, this.title, this.slug, this.image, this.zipCode});

  GetRouteCharge.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    localId = json['local_id'];
    title = json['title'];
    slug = json['slug'];
    image = json['image'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['local_id'] = this.localId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['zip_code'] = this.zipCode;
    return data;
  }
}
