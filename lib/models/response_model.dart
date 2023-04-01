class Response_Model {
  String? name;
  int? code;
  String? msg;
  Null? data;

  Response_Model({this.name, this.code, this.msg, this.data});

  Response_Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}
