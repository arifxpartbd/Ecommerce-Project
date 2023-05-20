class ResponseModel {
  final int statusCode;
  final dynamic returnData;
  final bool isSuccess;

  ResponseModel(
      {required this.statusCode,
      required this.returnData,
      required this.isSuccess});
}
