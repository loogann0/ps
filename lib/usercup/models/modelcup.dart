class cupoUserClass {
  int? id;
  String? empresa;
  String? status;
  String? descuento;
  String? categoria;
  String? descripsion;
  String? domicilio;
  String? telefono;
  String? cuponDesc;
  String? restricciones;
  String? codeValid;
  String? username;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? imagenemp;

  cupoUserClass({
    this.id,
    this.empresa,
    this.status,
    this.descuento,
    this.categoria,
    this.descripsion,
    this.domicilio,
    this.telefono,
    this.cuponDesc,
    this.restricciones,
    this.codeValid,
    this.username,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.imagenemp,
  });

  cupoUserClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    empresa = json['empresa'];
    status = json['status'];
    descuento = json['descuento'];
    descuento = json['categoria'];
    descuento = json['descripsion'];
    descuento = json['domicilio'];
    descuento = json['telefono'];
    descuento = json['cuponDesc'];
    descuento = json['restricciones'];
    codeValid = json['codeValid'];
    username = json['username'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagenemp = json['imagenemp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['empresa'] = this.empresa;
    data['status'] = this.status;
    data['descuento'] = this.descuento;
    data['categoria'] = this.categoria;
    data['descripsion'] = this.descripsion;
    data['domicilio'] = this.domicilio;
    data['telefono'] = this.telefono;
    data['cuponDesc'] = this.cuponDesc;
    data['restricciones'] = this.restricciones;
    data['codeValid'] = this.codeValid;
    data['username'] = this.username;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['imagenemp'] = this.imagenemp;
    return data;
  }
}
