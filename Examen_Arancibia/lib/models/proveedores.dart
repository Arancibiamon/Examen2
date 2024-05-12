import 'dart:convert';

class Providers {
  Providers({
    required this.listado,
  });

  List<Listado> listado;

  factory Providers.fromJson(String str) => Providers.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Providers.fromMap(Map<String, dynamic> json) => Providers(
        listado:
            List<Listado>.from(json["Listado"].map((x) => Listado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Listado {
  Listado({
    required this.providerId,
    required this.providerName,
    required this.providerLastName,
    required this.providerEmail,
    required this.providerState,
  });

  int providerId;
  String providerName;
  String providerLastName;
  String providerEmail;
  String providerState;

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
        providerId: json["provider_id"],
        providerName: json["provider_name"],
        providerLastName: json["provider_last_name"],
        providerEmail: json["provider_mail"],
        providerState: json["provider_state"],
      );

  Map<String, dynamic> toMap() => {
        "provider_id": providerId,
        "provider_name": providerName,
        "provider_last_name": providerLastName,
        "provider_mail": providerEmail,
        "provider_state": providerState,
      };

  Listado copy() => Listado(
      providerId: providerId,
      providerName: providerName,
      providerLastName: providerLastName,
      providerEmail: providerEmail,
      providerState: providerState);
}
