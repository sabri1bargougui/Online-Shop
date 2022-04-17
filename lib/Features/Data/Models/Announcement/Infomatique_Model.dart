class InformatiqueModel {
  final String? categorie;
  final String? condition;
  final String? description;
  final String? delegation;
  final String? governorate;
  final Map<String, dynamic>? details;
  final List? images;
  final String? announceID;
  final String? announceTitle;
  final String? createdAt;
  final double? price;
  final Map<String, dynamic>? seller;
  final String? idAnnounce;
  final List? keyWord;
  var location;

  InformatiqueModel({
    this.announceID,
    this.announceTitle,
    this.categorie,
    this.condition,
    this.delegation,
    this.description,
    this.details,
    this.governorate,
    this.images,
    this.price,
    this.seller,
    this.createdAt,
    this.location,
    this.idAnnounce,
    this.keyWord,
  });
  InformatiqueModel copyWith({
    String? categorie,
    String? condition,
    String? description,
    String? delegation,
    String? governorate,
    Map<String, dynamic>? details,
    List? images,
    String? announceID,
    String? announceTitle,
    double? price,
    final String? createdAt,
    Map<String, dynamic>? seller,
    String? idAnnounce,
    List? keyWord,
    var location,
  }) =>
      InformatiqueModel(
        categorie: categorie ?? this.categorie,
        condition: condition ?? this.condition,
        description: description ?? this.description,
        delegation: delegation ?? this.delegation,
        governorate: governorate ?? this.governorate,
        details: details ?? this.details,
        images: images ?? this.images,
        announceID: announceID ?? this.announceID,
        price: price ?? this.price,
        seller: seller ?? this.seller,
        createdAt: createdAt ?? this.createdAt,
        location: location ?? this.location,
        idAnnounce: idAnnounce ?? this.idAnnounce,
        keyWord: keyWord ?? this.keyWord,
      );

  static InformatiqueModel fromJson(Map<String, dynamic> json) =>
      InformatiqueModel(
        categorie: json['categorie'],
        condition: json['condition'],
        description: json['description'],
        delegation: json['delegation'],
        governorate: json['governorate'],
        details: json['details'],
        announceID: json['announce_ID'],
        images: json['images'],
        announceTitle: json['announce_Title'],
        price: json['announce_Price'],
        seller: json['Seller'],
        createdAt: json['CreatedAt'],
        location: json['location'],
        idAnnounce: json['ID_Announce'],
        keyWord: json['SearchKey'],
      );

  Map<String, dynamic> toJson() => {
        'categorie': categorie,
        'condition': condition,
        'description': description,
        'delegation': delegation,
        'governorate': governorate,
        'details': details,
        'announce_ID': announceID,
        'announce_Title': announceTitle,
        'announce_Price': price,
        'Seller': seller,
        'images': images,
        'CreatedAt': createdAt,
        'location': location,
        'ID_Announce': idAnnounce,
        'SearchKey': keyWord,
      };
}
