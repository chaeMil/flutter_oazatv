class Video {
  int id;
  String hash_id;
  String date;
  List<String> tags;
  String created_at;
  String updated_at;
  int views;
  String title;
  String description;

  //String translations;
  List<ArchiveFile> archive_files;

  Video({
    this.id,
    this.hash_id,
    this.date,
    this.tags,
    this.created_at,
    this.updated_at,
    this.views,
    this.title,
    this.description,
    //this.translations,
    this.archive_files,
  });

  String getTags() {
    return this.tags.join(", ");
  }

  String getThumb() {
    return this
        .archive_files
        .where((archiveFile) => archiveFile.file_type == "image")
        .toList()
        .first
        .file
        .thumb
        .url;
  }

  static Video fromJson(Map<String, dynamic> json) {
    List<String> tags = (json['tags'] as String).split(",");
    var archiveFiles = List<ArchiveFile>();
    (json['archive_files'] as List<Object>).forEach((jsonElement) {
      archiveFiles
          .add(ArchiveFile.fromJson(jsonElement as Map<String, dynamic>));
    });
    return Video(
        id: json['id'],
        hash_id: json['hash_id'],
        date: json['date'],
        tags: tags,
        created_at: json['created_at'],
        updated_at: json['updated_at'],
        views: json['views'],
        title: json['title'],
        description: json['description'],
        //translations: json['translations'],
        archive_files: archiveFiles);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'hash_id': hash_id,
        'date': date,
        'tags': tags,
        'created_at': created_at,
        'updated_at': updated_at,
        'views': views,
        'title': title,
        'description': description,
        //'translations': translations,
        //'archive_files': archive_files,
      };
}

class ArchiveFile {
  int id;
  File file;
  String file_type;
  String language;

  ArchiveFile({
    this.id,
    this.file,
    this.file_type,
    this.language,
  });

  static ArchiveFile fromJson(Map<String, dynamic> json) {
    return ArchiveFile(
      id: json['id'],
      file: File.fromJson(json['file']),
      file_type: json['file_type'],
      //language: json['language'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'file': file,
        'file_type': file_type,
        //'language': language,
      };
}

class File {
  String url;
  Variant thumb;
  Variant thumb_big;
  Variant tiny;
  Variant small;
  Variant medium;
  Variant big;

  File({
    this.url,
    this.thumb,
    this.thumb_big,
    this.tiny,
    this.small,
    this.medium,
    this.big,
  });

  static File fromJson(Map<String, dynamic> json) {
    return File(
      url: json['url'],
      thumb: Variant.fromJson(json['thumb']),
      thumb_big: Variant.fromJson(json['thumb_big']),
      tiny: Variant.fromJson(json['tiny']),
      small: Variant.fromJson(json['small']),
      medium: Variant.fromJson(json['medium']),
      big: Variant.fromJson(json['big']),
    );
  }
}

class Variant {
  String url;

  Variant({
    this.url,
  });

  static Variant fromJson(Map<String, dynamic> json) {
    return Variant(
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}
