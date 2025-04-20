class Rating {

  const Rating({required this.rate, required this.count,});

  final num? rate;
  final int count;

  factory Rating.fromJson(Map<String,dynamic> jsonData) {
    return Rating(
        rate: jsonData["rate"] as num?,
        count: jsonData["count"] as int
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "rate": rate,
      "count" : count,
    };
  }

}