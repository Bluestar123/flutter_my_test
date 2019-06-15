class PicModel {
  String tag1;
  String tag2;
  int totalNum;
  int startIndex;
  int returnNumber;
  List<PicData> data;

  PicModel(
      {this.tag1,
      this.tag2,
      this.totalNum,
      this.startIndex,
      this.returnNumber,
      this.data});

  PicModel.fromJson(Map<String, dynamic> json) {
    tag1 = json['tag1'];
    tag2 = json['tag2'];
    totalNum = json['totalNum'];
    startIndex = json['start_index'];
    returnNumber = json['return_number'];
    if (json['data'] != null) {
      data = new List<PicData>();
      json['data'].forEach((v) {
        data.add(new PicData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag1'] = this.tag1;
    data['tag2'] = this.tag2;
    data['totalNum'] = this.totalNum;
    data['start_index'] = this.startIndex;
    data['return_number'] = this.returnNumber;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PicData {
  String id;
  String setId;
  int pn;
  String abs;
  String desc;
  List<String> tags;
  String tag;
  String date;
  String likeNum;
  String isSingle;
  String fashionId;
  String dressId;
  String fushiObjNum;
  String fushiObjArray;
  String dressBuyLink;
  String dressPrice;
  String dressTag;
  String dressNum;
  String dressDiscount;
  String dressOther;
  String dressExtendType;
  String dressExtendName;
  String childrenVote;
  String dislikeNum;
  String imageUrl;
  int imageWidth;
  int imageHeight;
  String downloadUrl;
  String thumbnailUrl;
  int thumbnailWidth;
  int thumbnailHeight;
  int thumbLargeWidth;
  int thumbLargeHeight;
  String thumbLargeUrl;
  String siteName;
  String siteLogo;
  String siteUrl;
  String fromUrl;
  String objUrl;
  String shareUrl;
  int downloadNum;
  int collectNum;
  int startIndex;
  int returnNumber;
  String albumDi;
  String canAlbumId;
  String albumObjNum;
  String userId;
  String appId;
  String colum;
  String photoId;
  int isAlbum;
  int isVip;
  int fromName;
  String hostname;
  String parentTag;
  String descInfo;
  List<Null> otherUrls;
  int isAdapted;

  PicData(
      {this.id,
      this.setId,
      this.pn,
      this.abs,
      this.desc,
      this.tags,
      this.tag,
      this.date,
      this.likeNum,
      this.isSingle,
      this.fashionId,
      this.dressId,
      this.fushiObjNum,
      this.fushiObjArray,
      this.dressBuyLink,
      this.dressPrice,
      this.dressTag,
      this.dressNum,
      this.dressDiscount,
      this.dressOther,
      this.dressExtendType,
      this.dressExtendName,
      this.childrenVote,
      this.dislikeNum,
      this.imageUrl,
      this.imageWidth,
      this.imageHeight,
      this.downloadUrl,
      this.thumbnailUrl,
      this.thumbnailWidth,
      this.thumbnailHeight,
      this.thumbLargeWidth,
      this.thumbLargeHeight,
      this.thumbLargeUrl,
      this.siteName,
      this.siteLogo,
      this.siteUrl,
      this.fromUrl,
      this.objUrl,
      this.shareUrl,
      this.downloadNum,
      this.collectNum,
      this.startIndex,
      this.returnNumber,
      this.albumDi,
      this.canAlbumId,
      this.albumObjNum,
      this.userId,
      this.appId,
      this.colum,
      this.photoId,
      this.isAlbum,
      this.isVip,
      this.fromName,
      this.hostname,
      this.parentTag,
      this.descInfo,
      this.otherUrls,
      this.isAdapted});

  PicData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    setId = json['setId'];
    pn = json['pn'];
    abs = json['abs'];
    desc = json['desc'];
    tags = json['tags'].cast<String>();
    tag = json['tag'];
    date = json['date'];
    likeNum = json['like_num'];
    isSingle = json['is_single'];
    fashionId = json['fashion_id'];
    dressId = json['dress_id'];
    fushiObjNum = json['fushi_obj_num'];
    fushiObjArray = json['fushi_obj_array'];
    dressBuyLink = json['dress_buy_link'];
    dressPrice = json['dress_price'];
    dressTag = json['dress_tag'];
    dressNum = json['dress_num'];
    dressDiscount = json['dress_discount'];
    dressOther = json['dress_other'];
    dressExtendType = json['dress_extend_type'];
    dressExtendName = json['dress_extend_name'];
    childrenVote = json['children_vote'];
    dislikeNum = json['dislike_num'];
    imageUrl = json['image_url'];
    imageWidth = json['image_width'];
    imageHeight = json['image_height'];
    downloadUrl = json['download_url'];
    thumbnailUrl = json['thumbnail_url'];
    thumbnailWidth = json['thumbnail_width'];
    thumbnailHeight = json['thumbnail_height'];
    thumbLargeWidth = json['thumb_large_width'];
    thumbLargeHeight = json['thumb_large_height'];
    thumbLargeUrl = json['thumb_large_url'];
    siteName = json['site_name'];
    siteLogo = json['site_logo'];
    siteUrl = json['site_url'];
    fromUrl = json['from_url'];
    objUrl = json['obj_url'];
    shareUrl = json['share_url'];
    downloadNum = json['download_num'];
    collectNum = json['collect_num'];
    startIndex = json['start_index'];
    returnNumber = json['return_number'];
    albumDi = json['album_di'];
    canAlbumId = json['can_album_id'];
    albumObjNum = json['album_obj_num'];
    userId = json['user_id'];
    appId = json['app_id'];
    colum = json['colum'];
    photoId = json['photo_id'];
    isAlbum = json['is_album'];
    isVip = json['is_vip'];
    fromName = json['from_name'];
    hostname = json['hostname'];
    parentTag = json['parent_tag'];
    descInfo = json['desc_info'];
    if (json['other_urls'] != null) {
      otherUrls = new List<Null>();
      json['other_urls'].forEach((v) {
        // otherUrls.add(new Null.fromJson(v));
      });
    }
    isAdapted = json['isAdapted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['setId'] = this.setId;
    data['pn'] = this.pn;
    data['abs'] = this.abs;
    data['desc'] = this.desc;
    data['tags'] = this.tags;
    data['tag'] = this.tag;
    data['date'] = this.date;
    data['like_num'] = this.likeNum;
    data['is_single'] = this.isSingle;
    data['fashion_id'] = this.fashionId;
    data['dress_id'] = this.dressId;
    data['fushi_obj_num'] = this.fushiObjNum;
    data['fushi_obj_array'] = this.fushiObjArray;
    data['dress_buy_link'] = this.dressBuyLink;
    data['dress_price'] = this.dressPrice;
    data['dress_tag'] = this.dressTag;
    data['dress_num'] = this.dressNum;
    data['dress_discount'] = this.dressDiscount;
    data['dress_other'] = this.dressOther;
    data['dress_extend_type'] = this.dressExtendType;
    data['dress_extend_name'] = this.dressExtendName;
    data['children_vote'] = this.childrenVote;
    data['dislike_num'] = this.dislikeNum;
    data['image_url'] = this.imageUrl;
    data['image_width'] = this.imageWidth;
    data['image_height'] = this.imageHeight;
    data['download_url'] = this.downloadUrl;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['thumbnail_width'] = this.thumbnailWidth;
    data['thumbnail_height'] = this.thumbnailHeight;
    data['thumb_large_width'] = this.thumbLargeWidth;
    data['thumb_large_height'] = this.thumbLargeHeight;
    data['thumb_large_url'] = this.thumbLargeUrl;
    data['site_name'] = this.siteName;
    data['site_logo'] = this.siteLogo;
    data['site_url'] = this.siteUrl;
    data['from_url'] = this.fromUrl;
    data['obj_url'] = this.objUrl;
    data['share_url'] = this.shareUrl;
    data['download_num'] = this.downloadNum;
    data['collect_num'] = this.collectNum;
    data['start_index'] = this.startIndex;
    data['return_number'] = this.returnNumber;
    data['album_di'] = this.albumDi;
    data['can_album_id'] = this.canAlbumId;
    data['album_obj_num'] = this.albumObjNum;
    data['user_id'] = this.userId;
    data['app_id'] = this.appId;
    data['colum'] = this.colum;
    data['photo_id'] = this.photoId;
    data['is_album'] = this.isAlbum;
    data['is_vip'] = this.isVip;
    data['from_name'] = this.fromName;
    data['hostname'] = this.hostname;
    data['parent_tag'] = this.parentTag;
    data['desc_info'] = this.descInfo;
    if (this.otherUrls != null && this.otherUrls.length>0) {
      // data['other_urls'] = this.otherUrls.map((v) => v.toJson()).toList();
    }
    data['isAdapted'] = this.isAdapted;
    return data;
  }
}