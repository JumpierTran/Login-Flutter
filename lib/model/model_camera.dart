// class CameraModel {
//   List<Data>? data;
//   Links? links;
//   Meta? meta;
//   Jsonapi? jsonapi;

//   CameraModel({this.data, this.links, this.meta, this.jsonapi});

//   CameraModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//     links = json['links'] != null ? Links.fromJson(json['links']) : null;
//     meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
//     jsonapi =
//         json['jsonapi'] != null ? Jsonapi.fromJson(json['jsonapi']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (links != null) {
//       data['links'] = links!.toJson();
//     }
//     if (meta != null) {
//       data['meta'] = meta!.toJson();
//     }
//     if (jsonapi != null) {
//       data['jsonapi'] = jsonapi!.toJson();
//     }
//     return data;
//   }
// }

class CameraModel {
  String? type;
  Attributes? attributes;
  String? id;
  Links? links;

  CameraModel({this.type, this.attributes, this.id, this.links});

  CameraModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    id = json['id'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    data['id'] = id;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? deviceId;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  int? status;
  String? fiberCode;
  String? deletedAt;
  String? userId;
  String? updatedAt;

  Attributes(
      {this.deviceId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.status,
      this.fiberCode,
      this.deletedAt,
      this.userId,
      this.updatedAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    deviceId = json['device_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    status = json['status'];
    fiberCode = json['fiber_code'];
    deletedAt = json['deleted_at'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device_id'] = deviceId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['status'] = status;
    data['fiber_code'] = fiberCode;
    data['deleted_at'] = deletedAt;
    data['user_id'] = userId;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    return data;
  }
}

class Meta {
  int? count;

  Meta({this.count});

  Meta.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    return data;
  }
}

class Jsonapi {
  String? version;

  Jsonapi({this.version});

  Jsonapi.fromJson(Map<String, dynamic> json) {
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    return data;
  }
}
