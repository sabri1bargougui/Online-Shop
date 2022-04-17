class AutreModel {
  final String? categorie;
  final String? condition;
  final String? description;
  final String? delegation;
  final String? governorate;
  final List? images;
  final String? announceID;
  final String? idAnnounce;
  final String? announceTitle;
  final double? price;
  final Map<String, dynamic>? seller;
  final String? createdAt;
  var location;
  final List? keyWord;

  AutreModel({
    this.announceID,
    this.idAnnounce,
    this.announceTitle,
    this.categorie,
    this.condition,
    this.delegation,
    this.description,
    this.governorate,
    this.images,
    this.price,
    this.seller,
    this.createdAt,
    this.location,
    this.keyWord,
  });
  AutreModel copyWith({
    String? categorie,
    String? condition,
    String? description,
    String? delegation,
    String? governorate,
    List? images,
    String? announceID,
    String? idAnnounce,
    String? announceTitle,
    double? price,
    Map<String, dynamic>? seller,
    String? createdAt,
    var location,
    List? keyWord,
  }) =>
      AutreModel(
        categorie: categorie ?? this.categorie,
        condition: condition ?? this.condition,
        description: description ?? this.description,
        delegation: delegation ?? this.delegation,
        governorate: governorate ?? this.governorate,
        images: images ?? this.images,
        announceID: announceID ?? this.announceID,
        price: price ?? this.price,
        seller: seller ?? this.seller,
        createdAt: createdAt ?? this.createdAt,
        location: location ?? this.location,
        idAnnounce: idAnnounce ?? this.idAnnounce,
        keyWord: keyWord ?? this.keyWord,
      );

  static AutreModel fromJson(Map<String, dynamic> json) => AutreModel(
        categorie: json['categorie'],
        condition: json['condition'],
        description: json['description'],
        delegation: json['delegation'],
        governorate: json['governorate'],
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
