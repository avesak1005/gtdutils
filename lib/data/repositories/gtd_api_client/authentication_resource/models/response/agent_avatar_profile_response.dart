class AgentAvatarProfileRs {
  int? id;
  String? avatarImage;
  String? avatarImageContentType;
  bool? inUsed;
  DateTime? createdDate;
  int? agentProfileId;

  AgentAvatarProfileRs({
    this.id,
    this.avatarImage,
    this.avatarImageContentType,
    this.inUsed,
    this.createdDate,
    this.agentProfileId,
  });

  AgentAvatarProfileRs copyWith({
    int? id,
    String? avatarImage,
    String? avatarImageContentType,
    bool? inUsed,
    DateTime? createdDate,
    int? agentProfileId,
  }) =>
      AgentAvatarProfileRs(
        id: id ?? this.id,
        avatarImage: avatarImage ?? this.avatarImage,
        avatarImageContentType: avatarImageContentType ?? this.avatarImageContentType,
        inUsed: inUsed ?? this.inUsed,
        createdDate: createdDate ?? this.createdDate,
        agentProfileId: agentProfileId ?? this.agentProfileId,
      );

  factory AgentAvatarProfileRs.fromJson(Map<String, dynamic> json) => AgentAvatarProfileRs(
        id: json["id"],
        avatarImage: json["avatarImage"],
        avatarImageContentType: json["avatarImageContentType"],
        inUsed: json["inUsed"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        agentProfileId: json["agentProfileId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatarImage": avatarImage,
        "avatarImageContentType": avatarImageContentType,
        "inUsed": inUsed,
        "createdDate": createdDate?.toIso8601String(),
        "agentProfileId": agentProfileId,
      };
}
