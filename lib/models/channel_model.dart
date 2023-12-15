// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChannelModel {
  List<Channel>? content;
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

  ChannelModel(
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

  ChannelModel.fromJson(Map<String, dynamic> json) {
    if (json["content"] is List) {
      content = json["content"] == null
          ? null
          : (json["content"] as List).map((e) => Channel.fromJson(e)).toList();
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

class Channel {
  int? channelId;
  String? channelName;
  String? channelUrl;
  String? description;
  String? profilePicture;
  String? coverPhoto;

  Channel(
      {this.channelId,
      this.channelName,
      this.channelUrl,
      this.description,
      this.profilePicture,
      this.coverPhoto});

  Channel.fromJson(Map<String, dynamic> json) {
    if (json["channelId"] is int) {
      channelId = json["channelId"];
    }
    if (json["channelName"] is String) {
      channelName = json["channelName"];
    }
    if (json["channelUrl"] is String) {
      channelUrl = json["channelUrl"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["profilePicture"] is String) {
      profilePicture = json["profilePicture"];
    }
    if (json["coverPhoto"] is String) {
      coverPhoto = json["coverPhoto"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["channelId"] = channelId;
    data["channelName"] = channelName;
    data["channelUrl"] = channelUrl;
    data["description"] = description;
    data["profilePicture"] = profilePicture;
    data["coverPhoto"] = coverPhoto;
    return data;
  }

  @override
  String toString() {
    return 'Channel(channelId: $channelId, channelName: $channelName, channelUrl: $channelUrl, description: $description, profilePicture: $profilePicture, coverPhoto: $coverPhoto)';
  }
}
