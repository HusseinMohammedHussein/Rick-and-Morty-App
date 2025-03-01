class ErrorModel {
  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData['status'].toString(),
      errorMessage: jsonData['errorMessage'].toString(),
    );
  }

  final String status;
  final String errorMessage;
}
