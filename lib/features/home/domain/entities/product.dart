import 'dart:convert';

class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final double? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Review>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final String? thumbnail;
  final List<String>? images;

  Product({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required  this.warrantyInformation,
    required   this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required  this.returnPolicy,
    required  this.minimumOrderQuantity,
    required  this.meta,
    required  this.thumbnail,
    required  this.images,
  });

}

class Dimensions {
  final double? width;
  final double? height;
  final double? depth;

  Dimensions({required this.width,required this.height,required this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      depth: (json['depth'] as num?)?.toDouble(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'depth': depth,
    };
  }
}

class Review {
  final int? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  Review({required this.rating,required this.comment,required this.date,required this.reviewerName,required this.reviewerEmail});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'] as int?,
      comment: json['comment'] as String?,
      date: json['date'] != null ? DateTime.tryParse(json['date']) : null,
      reviewerName: json['reviewerName'] as String?,
      reviewerEmail: json['reviewerEmail'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date.toString(),
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }
}

class Meta {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  Meta({required this.createdAt, required this.updatedAt,required this.barcode, required this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
      barcode: json['barcode'] as String?,
      qrCode: json['qrCode'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }
}