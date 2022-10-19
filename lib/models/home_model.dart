class HomeModel {
  String? message;
  Data? data;

  HomeModel({this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? banners;

  Data(
      {this.banners});

  Data.fromJson(Map<String, dynamic> json) {
    try{
      ///--- conditioning
      banners = (json['banners'] != null) ? json['banners'].cast<String>():<String>[];
    } on Exception catch (e){
      banners = <String>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banners'] = banners;
    return data;
  }
}


