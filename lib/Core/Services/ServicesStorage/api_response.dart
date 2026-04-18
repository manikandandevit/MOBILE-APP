class ApiResponse<T> {
  final bool success;
  final String? message;
  final T? data;
  final int? total;
  final int? totalPages;
  final int? page;
  final int? limit;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
    this.total,
    this.page,
    this.limit,
    this.totalPages,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) create,
  ) {
    return ApiResponse(
      success: json['success'] ?? false,
      message: json['message'],
      total: json['total'],
      totalPages: json['totalPages'],
      page: json['page'],
      limit: json['limit'],
      data: create(json['data']),
    );
  }
}
