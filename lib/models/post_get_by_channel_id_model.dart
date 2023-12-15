import 'package:zayat/models/all_post.dart';

class PostGetByChannelIdModel {
  List<Posts>? post;
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

  PostGetByChannelIdModel(
      {this.post,
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

  PostGetByChannelIdModel.fromJson(Map<String, dynamic> json) {
    post = json["content"] == null
        ? null
        : (json["content"] as List).map((e) => Posts.fromJson(e)).toList();
    pageable =
        json["pageable"] == null ? null : Pageable.fromJson(json["pageable"]);
    totalElements = json["totalElements"];
    totalPages = json["totalPages"];
    last = json["last"];
    size = json["size"];
    number = json["number"];
    sort = json["sort"] == null ? null : Sort1.fromJson(json["sort"]);
    numberOfElements = json["numberOfElements"];
    first = json["first"];
    empty = json["empty"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (post != null) {
      data["content"] = post?.map((e) => e.toJson()).toList();
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
    empty = json["empty"];
    sorted = json["sorted"];
    unsorted = json["unsorted"];
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
    pageNumber = json["pageNumber"];
    pageSize = json["pageSize"];
    sort = json["sort"] == null ? null : Sort.fromJson(json["sort"]);
    offset = json["offset"];
    paged = json["paged"];
    unpaged = json["unpaged"];
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
    empty = json["empty"];
    sorted = json["sorted"];
    unsorted = json["unsorted"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["empty"] = empty;
    data["sorted"] = sorted;
    data["unsorted"] = unsorted;
    return data;
  }
}
