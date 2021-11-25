class PostCustomerReview {
  String id;
  String name;
  String review;

  PostCustomerReview({
    required this.id,
    required this.name,
    required this.review,
  });

  factory PostCustomerReview.fromJson(Map<String, dynamic> json) => PostCustomerReview(
        id: json["id"],
        name: json["name"],
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "review": review,
      };
}
