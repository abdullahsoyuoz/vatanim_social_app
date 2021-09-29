import 'dart:math';

import 'package:faker/faker.dart';
import 'package:vatanim_app/Data/FakeModel.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';

FakeCurrentUser currentUser = FakeCurrentUser(
    0,
    'vatanım',
    'app',
    'vatanim@vatanimapp.com.tr',
    '123123',
    'Konya',
    'Köyceğiz',
    iconPathLogoVatanim);

List<FakeUser> fakeUserList = [
  FakeUser(0,Faker().person.firstName(),
    new Faker().image.image(keywords: ['Portrait'],),Random().nextBool()),
  FakeUser(1, Faker().person.firstName(),
    new Faker().image.image(keywords: ['Portrait']), Random().nextBool()),
  FakeUser(2, Faker().person.firstName(),
    new Faker().image.image(keywords: ['Portrait']), Random().nextBool()),
  FakeUser(3, Faker().person.firstName(),
    new Faker().image.image(keywords: ['Portrait']), Random().nextBool()),
  FakeUser(4, Faker().person.firstName(),
    new Faker().image.image(keywords: ['Portrait']), Random().nextBool()),
  FakeUser(5, Faker().person.firstName(),
    new Faker().image.image(keywords: ['Portrait']), Random().nextBool()),
  FakeUser(6, Faker().person.firstName(),
    new Faker().image.image(keywords: ['Portrait']), Random().nextBool()),
  FakeUser(7, Faker().person.firstName(),
    new Faker().image.image(keywords: ['Portrait']), Random().nextBool()),
  FakeUser(8, Faker().person.firstName(),
    new Faker().image.image(keywords: ['Portrait']), Random().nextBool()),
  FakeUser(9, Faker().person.firstName(),
    new Faker().image.image(keywords: ['Portrait']), Random().nextBool()),
];

List<FakePost> fakePostList = [
  FakePost(
      0,
      fakeUserList[0],
      new Faker().image.image(keywords: ['village'], width: 1080, height: 1920),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      1,
      fakeUserList[4],
      Faker().image.image(keywords: ['life'], width: 640, height: 480),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      2,
      fakeUserList[9],
      Faker().image.image(keywords: ['natural']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      3,
      fakeUserList[0],
      new Faker().image.image(keywords: ['sport'], width: 1080, height: 1920),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      4,
      fakeUserList[4],
      Faker().image.image(keywords: ['build']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      5,
      fakeUserList[9],
      Faker().image.image(keywords: ['news'], width: 1080, height: 1920),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      6,
      fakeUserList[0],
      new Faker().image.image(keywords: ['car']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      7,
      fakeUserList[4],
      Faker().image.image(keywords: ['tree']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      8,
      fakeUserList[9],
      Faker().image.image(keywords: ['comedy'], width: 1080, height: 1920),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      9,
      fakeUserList[0],
      new Faker().image.image(keywords: ['technology'], width: 1080, height: 1920),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      10,
      fakeUserList[4],
      Faker().image.image(keywords: ['space']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      11,
      fakeUserList[9],
      Faker().image.image(keywords: ['kitchen'], width: 1080, height: 1920),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      12,
      fakeUserList[0],
      new Faker().image.image(keywords: ['healty'], width: 1080, height: 1920),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      13,
      fakeUserList[4],
      Faker().image.image(keywords: ['sea']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      14,
      fakeUserList[9],
      Faker().image.image(keywords: ['country']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      15,
      fakeUserList[0],
      new Faker().image.image(keywords: ['apple']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      16,
      fakeUserList[4],
      Faker().image.image(keywords: ['turkey']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      17,
      fakeUserList[9],
      Faker().image.image(keywords: ['spain']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      18,
      fakeUserList[0],
      new Faker().image.image(keywords: ['healty']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      19,
      fakeUserList[4],
      Faker().image.image(keywords: ['sea']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      20,
      fakeUserList[9],
      Faker().image.image(keywords: ['country']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      21,
      fakeUserList[0],
      new Faker().image.image(keywords: ['apple']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      22,
      fakeUserList[4],
      Faker().image.image(keywords: ['turkey']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
  FakePost(
      23,
      fakeUserList[9],
      Faker().image.image(keywords: ['spain']),
      Faker().lorem.sentences(2).toString(),
      fakeUserList,
      Faker().lorem.sentences(5),
      DateTime.now()),
];

List<FakeStories> fakeStoriesList = [
  FakeStories(0, fakeUserList[0]),
  FakeStories(1, fakeUserList[4]),
  FakeStories(2, fakeUserList[5]),
  FakeStories(3, fakeUserList[7]),
  FakeStories(4, fakeUserList[8]),
  FakeStories(5, fakeUserList[6]),
  FakeStories(6, fakeUserList[9]),
  FakeStories(7, fakeUserList[1]),
  FakeStories(8, fakeUserList[3]),
  FakeStories(9, fakeUserList[2]),
];

List<FakeComment> fakeCommentList = [
  FakeComment(0, fakeUserList[0], Faker().lorem.sentence(), 2, 78, [
    FakeComment(0, fakeUserList[0], Faker().lorem.sentence(), 2, 38, []),
    FakeComment(1, fakeUserList[6], Faker().lorem.sentence(), 1, 45, []),
    FakeComment(2, fakeUserList[3], Faker().lorem.sentence(), 1, 75, []),
    FakeComment(3, fakeUserList[2], Faker().lorem.sentence(), 3, 13, []),
  ]),
  FakeComment(1, fakeUserList[6], Faker().lorem.sentence(), 1, 135, [
    FakeComment(0, fakeUserList[0], Faker().lorem.sentence(), 8, 13, []),
    FakeComment(1, fakeUserList[6], Faker().lorem.sentence(), 6, 78, []),
  ]),
  FakeComment(2, fakeUserList[3], Faker().lorem.sentence(), 5, 33, []),
  FakeComment(3, fakeUserList[2], Faker().lorem.sentence(), 5, 95, []),
  FakeComment(4, fakeUserList[1], Faker().lorem.sentence(), 8, 63, [
    FakeComment(0, fakeUserList[0], Faker().lorem.sentence(), 2, 78, []),
  ]),
  FakeComment(5, fakeUserList[8], Faker().lorem.sentence(), 3, 245, []),
  FakeComment(6, fakeUserList[7], Faker().lorem.sentence(), 4, 62, [
    FakeComment(0, fakeUserList[0], Faker().lorem.sentence(), 2, 7, []),
    FakeComment(1, fakeUserList[6], Faker().lorem.sentence(), 2, 8, []),
    FakeComment(2, fakeUserList[3], Faker().lorem.sentence(), 4, 12, []),
    FakeComment(3, fakeUserList[2], Faker().lorem.sentence(), 5, 22, []),
    FakeComment(4, fakeUserList[0], Faker().lorem.sentence(), 6, 21, []),
    FakeComment(5, fakeUserList[6], Faker().lorem.sentence(), 6, 15, []),
    FakeComment(6, fakeUserList[3], Faker().lorem.sentence(), 8, 14, []),
    FakeComment(7, fakeUserList[2], Faker().lorem.sentence(), 8, 9, []),
  ]),
  FakeComment(7, fakeUserList[5], Faker().lorem.sentence(), 3, 25, []),
];

List<FakeMessage> fakeMessageList = [
  FakeMessage(0, fakeUserList[0], Faker().lorem.sentence()),
  FakeMessage(1, fakeUserList[1], Faker().lorem.sentence()),
  FakeMessage(2, fakeUserList[2], Faker().lorem.sentence()),
  FakeMessage(3, fakeUserList[3], Faker().lorem.sentence()),
  FakeMessage(4, fakeUserList[4], Faker().lorem.sentence()),
  FakeMessage(5, fakeUserList[5], Faker().lorem.sentence()),
  FakeMessage(6, fakeUserList[6], Faker().lorem.sentence()),
  FakeMessage(7, fakeUserList[7], Faker().lorem.sentence()),
  FakeMessage(8, fakeUserList[8], Faker().lorem.sentence()),
  FakeMessage(9, fakeUserList[9], Faker().lorem.sentence()),
];