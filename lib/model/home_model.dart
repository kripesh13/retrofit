class HomeModel {
  bool? status;
  int? statusCode;
  Data? data;
  String? message;

  HomeModel({this.status, this.statusCode, this.data, this.message});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<Sliders>? sliders;
  List<Categories>? categories;
  List<Services>? services;
  List<Feedback>? feedback;
  List<Advertisement>? advertisement;

  Data(
      {this.sliders,
      this.categories,
      this.services,
      this.feedback,
      this.advertisement});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(new Sliders.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    if (json['feedback'] != null) {
      feedback = <Feedback>[];
      json['feedback'].forEach((v) {
        feedback!.add(new Feedback.fromJson(v));
      });
    }
    if (json['advertisement'] != null) {
      advertisement = <Advertisement>[];
      json['advertisement'].forEach((v) {
        advertisement!.add(new Advertisement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sliders != null) {
      data['sliders'] = this.sliders!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.feedback != null) {
      data['feedback'] = this.feedback!.map((v) => v.toJson()).toList();
    }
    if (this.advertisement != null) {
      data['advertisement'] =
          this.advertisement!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sliders {
  int? id;
  String? title;
  String? image;
  Null? externalUrl;

  Sliders({this.id, this.title, this.image, this.externalUrl});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    externalUrl = json['external_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['external_url'] = this.externalUrl;
    return data;
  }
}

class Categories {
  int? id;
  String? title;
  String? description;
  String? image;
  Null? parentId;
  List<Null>? subCategory;

  Categories(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.parentId,
      this.subCategory});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    parentId = json['parentId'];
    // if (json['sub_category'] != null) {
    //   subCategory = <Null>[];
    //   json['sub_category'].forEach((v) {
    //     subCategory!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['parentId'] = this.parentId;
    // if (this.subCategory != null) {
    //   data['sub_category'] = this.subCategory!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Services {
  int? id;
  String? title;
  String? image;
  String? description;
  String? price;
  String? originalPrice;

  Services(
      {this.id,
      this.title,
      this.image,
      this.description,
      this.price,
      this.originalPrice});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    originalPrice = json['originalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['originalPrice'] = this.originalPrice;
    return data;
  }
}

class Feedback {
  String? name;
  Null? image;
  String? feedback;
  int? rating;

  Feedback({this.name, this.image, this.feedback, this.rating});

  Feedback.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    feedback = json['feedback'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['feedback'] = this.feedback;
    data['rating'] = this.rating;
    return data;
  }
}

class Advertisement {
  String? title;
  String? image;
  String? url;

  Advertisement({this.title, this.image, this.url});

  Advertisement.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['url'] = this.url;
    return data;
  }
}
