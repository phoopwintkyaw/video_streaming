import 'package:zayat/models/all_post.dart';

class FeedModel {
  List<Posts>? content;
  Pageable? pageable;
  int? totalElements;
  int? totalPages;
  bool? last;
  int? size;
  int? number;
  Sort1? sort;
  int? numberOfElements;
  bool? first;
  bool? empty;

  FeedModel(
      {this.content,
      this.pageable,
      this.totalElements,
      this.totalPages,
      this.last,
      this.size,
      this.number,
      this.sort,
      this.numberOfElements,
      this.first,
      this.empty});

  FeedModel.fromJson(Map<String, dynamic> json) {
    if (json["content"] is List) {
      content = json["content"] == null
          ? null
          : (json["content"] as List).map((e) => Posts.fromJson(e)).toList();
    }
    if (json["pageable"] is Map) {
      pageable =
          json["pageable"] == null ? null : Pageable.fromJson(json["pageable"]);
    }
    if (json["totalElements"] is int) {
      totalElements = json["totalElements"];
    }
    if (json["totalPages"] is int) {
      totalPages = json["totalPages"];
    }
    if (json["last"] is bool) {
      last = json["last"];
    }
    if (json["size"] is int) {
      size = json["size"];
    }
    if (json["number"] is int) {
      number = json["number"];
    }
    if (json["sort"] is Map) {
      sort = json["sort"] == null ? null : Sort1.fromJson(json["sort"]);
    }
    if (json["numberOfElements"] is int) {
      numberOfElements = json["numberOfElements"];
    }
    if (json["first"] is bool) {
      first = json["first"];
    }
    if (json["empty"] is bool) {
      empty = json["empty"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data["content"] = content?.map((e) => e.toJson()).toList();
    }
    if (pageable != null) {
      data["pageable"] = pageable?.toJson();
    }
    data["totalElements"] = totalElements;
    data["totalPages"] = totalPages;
    data["last"] = last;
    data["size"] = size;
    data["number"] = number;
    if (sort != null) {
      data["sort"] = sort?.toJson();
    }
    data["numberOfElements"] = numberOfElements;
    data["first"] = first;
    data["empty"] = empty;
    return data;
  }
}

class Sort1 {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort1({this.empty, this.sorted, this.unsorted});

  Sort1.fromJson(Map<String, dynamic> json) {
    if (json["empty"] is bool) {
      empty = json["empty"];
    }
    if (json["sorted"] is bool) {
      sorted = json["sorted"];
    }
    if (json["unsorted"] is bool) {
      unsorted = json["unsorted"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["empty"] = empty;
    data["sorted"] = sorted;
    data["unsorted"] = unsorted;
    return data;
  }
}

class Pageable {
  int? pageNumber;
  int? pageSize;
  Sort? sort;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.pageNumber,
      this.pageSize,
      this.sort,
      this.offset,
      this.paged,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    if (json["pageNumber"] is int) {
      pageNumber = json["pageNumber"];
    }
    if (json["pageSize"] is int) {
      pageSize = json["pageSize"];
    }
    if (json["sort"] is Map) {
      sort = json["sort"] == null ? null : Sort.fromJson(json["sort"]);
    }
    if (json["offset"] is int) {
      offset = json["offset"];
    }
    if (json["paged"] is bool) {
      paged = json["paged"];
    }
    if (json["unpaged"] is bool) {
      unpaged = json["unpaged"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["pageNumber"] = pageNumber;
    data["pageSize"] = pageSize;
    if (sort != null) {
      data["sort"] = sort?.toJson();
    }
    data["offset"] = offset;
    data["paged"] = paged;
    data["unpaged"] = unpaged;
    return data;
  }
}

class Sort {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    if (json["empty"] is bool) {
      empty = json["empty"];
    }
    if (json["sorted"] is bool) {
      sorted = json["sorted"];
    }
    if (json["unsorted"] is bool) {
      unsorted = json["unsorted"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["empty"] = empty;
    data["sorted"] = sorted;
    data["unsorted"] = unsorted;
    return data;
  }
}
