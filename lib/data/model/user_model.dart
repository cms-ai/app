import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userId;
  final String? email;
  final bool? isDeleted;
  final int? createdAt;
  final int? updatedAt;
  final String? displayName;
  const UserModel({
    this.userId = "",
    this.email = "",
    this.isDeleted = false,
    this.createdAt,
    this.updatedAt,
    this.displayName,
  });
  @override
  List<Object?> get props =>
      [userId, email, isDeleted, createdAt, updatedAt, displayName];
  UserModel copyWith({
    String? userId,
    String? email,
    String? password,
    bool? isDeleted,
    int? createdAt,
    int? updatedAt,
    String? displayName,
  }) {
    return copyWith(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      displayName: displayName ?? this.displayName,
    );
  }

  /// convert json to usermodel

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"],
      email: json["email"],
      isDeleted: json["isDeleted"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      displayName: json["displayName"],
    );
  }

  /// convert model to json

  Map<String, dynamic> toMap() {
    return {
      if (userId != null) "userId": userId,
      if (email != null) "email": email,
      if (isDeleted != null) "isDeleted": isDeleted,
      if (createdAt != null) "createdAt": createdAt,
      if (updatedAt != null) "updatedAt": updatedAt,
      if (displayName != null) "displayName": displayName,
    };
  }
}

extension UserModelExt on UserModel {}
