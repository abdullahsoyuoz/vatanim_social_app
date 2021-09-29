class FakeUser {
  int id;
  String name;
  String profilePhotoUrl;
  bool isOnline;
  FakeUser(this.id, this.name, this.profilePhotoUrl, this.isOnline);
}

class FakeCurrentUser {
  int id;
  String name;
  String surname;
  String email;
  String password;
  String city;
  String county;
  String profilePhotoUrl;
  FakeCurrentUser(this.id, this.name, this.surname, this.email, this.password,
      this.city, this.county, this.profilePhotoUrl);
}

class FakePost {
  int id;
  FakeUser user;
  String imageUrl;
  String description;
  List<FakeUser> likedUserList;
  List<String> comments;
  DateTime postTime;
  FakePost(this.id, this.user, this.imageUrl, this.description,
      this.likedUserList, this.comments, this.postTime);
}

class FakeStories {
  int id;
  FakeUser user;
  FakeStories(this.id, this.user);
}

class FakeComment {
  int id;
  FakeUser user;
  String message;
  int timeInterval;
  int likeCount;
  List<FakeComment> subComments;
  FakeComment(this.id, this.user, this.message, this.timeInterval,
      this.likeCount, this.subComments);
}

class FakeMessage {
  int id;
  FakeUser user;
  String message;
  FakeMessage(this.id, this.user, this.message);
}
