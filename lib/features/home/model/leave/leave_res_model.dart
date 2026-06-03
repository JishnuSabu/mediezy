class ApplyLeaveResponse {

  final bool status;
  final String message;

  ApplyLeaveResponse({

    required this.status,
    required this.message,

  });

  factory ApplyLeaveResponse.fromJson(
    Map<String,dynamic> json,
  ){

    return ApplyLeaveResponse(

      status:
      json["status"] ?? false,

      message:
      json["message"] ?? "",

    );

  }

}