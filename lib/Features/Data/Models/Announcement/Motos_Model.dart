class MotoModel {
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
  var location;
  final List? keyWord;

  MotoModel({
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
  MotoModel copyWith({
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
    Map<String, dynamic>? seller,
    String? createdAt,
    String? idAnnounce,
    var location,
    List? keyWord,
  }) =>
      MotoModel(
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

  static MotoModel fromJson(Map<String, dynamic> json) => MotoModel(
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
        location: json['Location'],
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
        'Location': location,
        'ID_Announce': idAnnounce,
        'SearchKey': keyWord,
      };
}
