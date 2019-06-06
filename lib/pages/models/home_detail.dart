class HomeDetail {
  String msg;
  List<Map> pdfList;
  int code;
  List<Map> replyList;
  Article article;

  HomeDetail(
      {this.msg, this.pdfList, this.code, this.replyList, this.article});

  HomeDetail.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    
    code = json['code'];
    
    article =
        json['article'] != null ? new Article.fromJson(json['article']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    
    data['code'] = this.code;
    
    if (this.article != null) {
      data['article'] = this.article.toJson();
    }
    return data;
  }
}

class Article {
  String authorAbstract;
  int expertId;
  int isCollectionArticle;
  int readCount;
  String headPortraitPath;
  String articleFaq;
  int id;
  int isVote;
  String releaseTime;
  String secondAuthorName;
  String unitName;
  String headImg;
  String articleContent;
  int authorType;
  int articleCollectionCount;
  String articleTitle;
  int replyCount;
  String field;
  String authorName;
  int isCollectionExpert;
  String thirdAuthorName;
  int voteCount;

  Article(
      {this.authorAbstract,
      this.expertId,
      this.isCollectionArticle,
      this.readCount,
      this.headPortraitPath,
      this.articleFaq,
      this.id,
      this.isVote,
      this.releaseTime,
      this.secondAuthorName,
      this.unitName,
      this.headImg,
      this.articleContent,
      this.authorType,
      this.articleCollectionCount,
      this.articleTitle,
      this.replyCount,
      this.field,
      this.authorName,
      this.isCollectionExpert,
      this.thirdAuthorName,
      this.voteCount});

  Article.fromJson(Map<String, dynamic> json) {
    authorAbstract = json['author_abstract'];
    expertId = json['expertId'];
    isCollectionArticle = json['isCollectionArticle'];
    readCount = json['readCount'];
    headPortraitPath = json['head_portrait_path'];
    
    articleFaq = json['articleFaq'];
    id = json['id'];
    isVote = json['isVote'];
    releaseTime = json['release_time'];
    secondAuthorName = json['secondAuthorName'];
    unitName = json['unitName'];
    headImg = json['headImg'];
    articleContent = json['article_content'];
    authorType = json['authorType'];
    
    articleCollectionCount = json['articleCollectionCount'];
    articleTitle = json['article_title'];
    replyCount = json['replyCount'];
    field = json['field'];
    authorName = json['authorName'];
    isCollectionExpert = json['isCollectionExpert'];
    thirdAuthorName = json['thirdAuthorName'];
    voteCount = json['voteCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_abstract'] = this.authorAbstract;
    data['expertId'] = this.expertId;
    data['isCollectionArticle'] = this.isCollectionArticle;
    data['readCount'] = this.readCount;
    data['head_portrait_path'] = this.headPortraitPath;
    
    data['articleFaq'] = this.articleFaq;
    data['id'] = this.id;
    data['isVote'] = this.isVote;
    data['release_time'] = this.releaseTime;
    data['secondAuthorName'] = this.secondAuthorName;
    data['unitName'] = this.unitName;
    data['headImg'] = this.headImg;
    data['article_content'] = this.articleContent;
    data['authorType'] = this.authorType;
    
    data['articleCollectionCount'] = this.articleCollectionCount;
    data['article_title'] = this.articleTitle;
    data['replyCount'] = this.replyCount;
    data['field'] = this.field;
    data['authorName'] = this.authorName;
    data['isCollectionExpert'] = this.isCollectionExpert;
    data['thirdAuthorName'] = this.thirdAuthorName;
    data['voteCount'] = this.voteCount;
    return data;
  }
}