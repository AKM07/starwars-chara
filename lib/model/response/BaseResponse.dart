class BaseResponse<T> {
  int count;
  String next;
  List<T> results;

  BaseResponse(
      {required this.count,
      required this.next,
      required this.results});

  factory BaseResponse.fromJson(
      Map<String, dynamic> jsonData, Function fromJson) {
    final items = jsonData['results'];

    List<T> output = [];

    if (items != null) {
      if (items is Iterable) {
        for (Map<String, dynamic> json in items) {
          output.add(fromJson(json));
        }
      } else {
        output.add(fromJson(items));
      }
    }

    return BaseResponse<T>(
      count: jsonData["count"],
      next: jsonData["next"],
      results: output,
    );
  }
}
