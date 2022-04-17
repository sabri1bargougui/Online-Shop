class ChannelModel {
  final String? channelID;
  final String? createdAT;
  final List<String>? participants;
  final Map<String, dynamic>? announce;
  final Map<String, dynamic>? users;
  const ChannelModel({
    this.createdAT,
    this.channelID,
    this.participants,
    this.announce,
    this.users,
  });

  ChannelModel copyWith({
    String? createdAt,
    String? channelID,
    List<String>? participants,
    Map<String, dynamic>? announce,
    Map<String, dynamic>? users,
  }) =>
      ChannelModel(
        createdAT: createdAt ?? this.createdAT,
        channelID: channelID ?? this.channelID,
        participants: participants ?? this.participants,
        announce: announce ?? this.announce,
        users: users ?? this.users,
      );

  static ChannelModel fromJson(Map<String, dynamic> json) => ChannelModel(
        createdAT: json['createdAT'],
        channelID: json['channelID'],
        participants: json['participants'],
        announce: json['announce'],
        users: json['Users'],
      );

  Map<String, dynamic> toJson() => {
        'createdAT': createdAT,
        'channelID': channelID,
        'announce': announce,
        'participants': participants,
        'Users': users,
      };
}
