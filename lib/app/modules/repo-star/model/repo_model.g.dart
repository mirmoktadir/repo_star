// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoModelAdapter extends TypeAdapter<RepoModel> {
  @override
  final int typeId = 1;

  @override
  RepoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepoModel()
      .._totalCount = fields[0] as int?
      .._incompleteResults = fields[1] as bool?
      .._items = (fields[2] as List?)?.cast<Items>();
  }

  @override
  void write(BinaryWriter writer, RepoModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._totalCount)
      ..writeByte(1)
      ..write(obj._incompleteResults)
      ..writeByte(2)
      ..write(obj._items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemsAdapter extends TypeAdapter<Items> {
  @override
  final int typeId = 2;

  @override
  Items read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Items()
      .._id = fields[0] as int?
      .._nodeId = fields[1] as String?
      .._name = fields[2] as String?
      .._fullName = fields[3] as String?
      .._private = fields[4] as bool?
      .._owner = fields[5] as Owner?
      .._htmlUrl = fields[6] as String?
      .._description = fields[7] as String?
      .._fork = fields[8] as bool?
      .._url = fields[9] as String?
      .._forksUrl = fields[10] as String?
      .._keysUrl = fields[11] as String?
      .._collaboratorsUrl = fields[12] as String?
      .._teamsUrl = fields[13] as String?
      .._hooksUrl = fields[14] as String?
      .._issueEventsUrl = fields[15] as String?
      .._eventsUrl = fields[16] as String?
      .._assigneesUrl = fields[17] as String?
      .._branchesUrl = fields[18] as String?
      .._tagsUrl = fields[19] as String?
      .._blobsUrl = fields[20] as String?
      .._gitTagsUrl = fields[21] as String?
      .._gitRefsUrl = fields[22] as String?
      .._treesUrl = fields[23] as String?
      .._statusesUrl = fields[24] as String?
      .._languagesUrl = fields[25] as String?
      .._stargazersUrl = fields[26] as String?
      .._contributorsUrl = fields[27] as String?
      .._subscribersUrl = fields[28] as String?
      .._subscriptionUrl = fields[29] as String?
      .._commitsUrl = fields[30] as String?
      .._gitCommitsUrl = fields[31] as String?
      .._commentsUrl = fields[32] as String?
      .._issueCommentUrl = fields[33] as String?
      .._contentsUrl = fields[34] as String?
      .._compareUrl = fields[35] as String?
      .._mergesUrl = fields[36] as String?
      .._archiveUrl = fields[37] as String?
      .._downloadsUrl = fields[38] as String?
      .._issuesUrl = fields[39] as String?
      .._pullsUrl = fields[40] as String?
      .._milestonesUrl = fields[41] as String?
      .._notificationsUrl = fields[42] as String?
      .._labelsUrl = fields[43] as String?
      .._releasesUrl = fields[44] as String?
      .._deploymentsUrl = fields[45] as String?
      .._createdAt = fields[46] as String?
      .._updatedAt = fields[47] as String?
      .._pushedAt = fields[48] as String?
      .._gitUrl = fields[79] as String?
      .._sshUrl = fields[49] as String?
      .._cloneUrl = fields[50] as String?
      .._svnUrl = fields[51] as String?
      .._homepage = fields[52] as String?
      .._size = fields[53] as int?
      .._stargazersCount = fields[54] as int?
      .._watchersCount = fields[55] as int?
      .._language = fields[56] as String?
      .._hasIssues = fields[57] as bool?
      .._hasProjects = fields[58] as bool?
      .._hasDownloads = fields[59] as bool?
      .._hasWiki = fields[60] as bool?
      .._hasPages = fields[61] as bool?
      .._hasDiscussions = fields[62] as bool?
      .._forksCount = fields[63] as int?
      .._mirrorUrl = fields[64] as dynamic
      .._archived = fields[65] as bool?
      .._disabled = fields[66] as bool?
      .._openIssuesCount = fields[67] as int?
      .._license = fields[68] as License?
      .._allowForking = fields[69] as bool?
      .._isTemplate = fields[70] as bool?
      .._webCommitSignoffRequired = fields[71] as bool?
      .._topics = (fields[72] as List?)?.cast<String>()
      .._visibility = fields[73] as String?
      .._forks = fields[74] as int?
      .._openIssues = fields[75] as int?
      .._watchers = fields[76] as int?
      .._defaultBranch = fields[77] as String?
      .._score = fields[78] as double?;
  }

  @override
  void write(BinaryWriter writer, Items obj) {
    writer
      ..writeByte(80)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._nodeId)
      ..writeByte(2)
      ..write(obj._name)
      ..writeByte(3)
      ..write(obj._fullName)
      ..writeByte(4)
      ..write(obj._private)
      ..writeByte(5)
      ..write(obj._owner)
      ..writeByte(6)
      ..write(obj._htmlUrl)
      ..writeByte(7)
      ..write(obj._description)
      ..writeByte(8)
      ..write(obj._fork)
      ..writeByte(9)
      ..write(obj._url)
      ..writeByte(10)
      ..write(obj._forksUrl)
      ..writeByte(11)
      ..write(obj._keysUrl)
      ..writeByte(12)
      ..write(obj._collaboratorsUrl)
      ..writeByte(13)
      ..write(obj._teamsUrl)
      ..writeByte(14)
      ..write(obj._hooksUrl)
      ..writeByte(15)
      ..write(obj._issueEventsUrl)
      ..writeByte(16)
      ..write(obj._eventsUrl)
      ..writeByte(17)
      ..write(obj._assigneesUrl)
      ..writeByte(18)
      ..write(obj._branchesUrl)
      ..writeByte(19)
      ..write(obj._tagsUrl)
      ..writeByte(20)
      ..write(obj._blobsUrl)
      ..writeByte(21)
      ..write(obj._gitTagsUrl)
      ..writeByte(22)
      ..write(obj._gitRefsUrl)
      ..writeByte(23)
      ..write(obj._treesUrl)
      ..writeByte(24)
      ..write(obj._statusesUrl)
      ..writeByte(25)
      ..write(obj._languagesUrl)
      ..writeByte(26)
      ..write(obj._stargazersUrl)
      ..writeByte(27)
      ..write(obj._contributorsUrl)
      ..writeByte(28)
      ..write(obj._subscribersUrl)
      ..writeByte(29)
      ..write(obj._subscriptionUrl)
      ..writeByte(30)
      ..write(obj._commitsUrl)
      ..writeByte(31)
      ..write(obj._gitCommitsUrl)
      ..writeByte(32)
      ..write(obj._commentsUrl)
      ..writeByte(33)
      ..write(obj._issueCommentUrl)
      ..writeByte(34)
      ..write(obj._contentsUrl)
      ..writeByte(35)
      ..write(obj._compareUrl)
      ..writeByte(36)
      ..write(obj._mergesUrl)
      ..writeByte(37)
      ..write(obj._archiveUrl)
      ..writeByte(38)
      ..write(obj._downloadsUrl)
      ..writeByte(39)
      ..write(obj._issuesUrl)
      ..writeByte(40)
      ..write(obj._pullsUrl)
      ..writeByte(41)
      ..write(obj._milestonesUrl)
      ..writeByte(42)
      ..write(obj._notificationsUrl)
      ..writeByte(43)
      ..write(obj._labelsUrl)
      ..writeByte(44)
      ..write(obj._releasesUrl)
      ..writeByte(45)
      ..write(obj._deploymentsUrl)
      ..writeByte(46)
      ..write(obj._createdAt)
      ..writeByte(47)
      ..write(obj._updatedAt)
      ..writeByte(48)
      ..write(obj._pushedAt)
      ..writeByte(79)
      ..write(obj._gitUrl)
      ..writeByte(49)
      ..write(obj._sshUrl)
      ..writeByte(50)
      ..write(obj._cloneUrl)
      ..writeByte(51)
      ..write(obj._svnUrl)
      ..writeByte(52)
      ..write(obj._homepage)
      ..writeByte(53)
      ..write(obj._size)
      ..writeByte(54)
      ..write(obj._stargazersCount)
      ..writeByte(55)
      ..write(obj._watchersCount)
      ..writeByte(56)
      ..write(obj._language)
      ..writeByte(57)
      ..write(obj._hasIssues)
      ..writeByte(58)
      ..write(obj._hasProjects)
      ..writeByte(59)
      ..write(obj._hasDownloads)
      ..writeByte(60)
      ..write(obj._hasWiki)
      ..writeByte(61)
      ..write(obj._hasPages)
      ..writeByte(62)
      ..write(obj._hasDiscussions)
      ..writeByte(63)
      ..write(obj._forksCount)
      ..writeByte(64)
      ..write(obj._mirrorUrl)
      ..writeByte(65)
      ..write(obj._archived)
      ..writeByte(66)
      ..write(obj._disabled)
      ..writeByte(67)
      ..write(obj._openIssuesCount)
      ..writeByte(68)
      ..write(obj._license)
      ..writeByte(69)
      ..write(obj._allowForking)
      ..writeByte(70)
      ..write(obj._isTemplate)
      ..writeByte(71)
      ..write(obj._webCommitSignoffRequired)
      ..writeByte(72)
      ..write(obj._topics)
      ..writeByte(73)
      ..write(obj._visibility)
      ..writeByte(74)
      ..write(obj._forks)
      ..writeByte(75)
      ..write(obj._openIssues)
      ..writeByte(76)
      ..write(obj._watchers)
      ..writeByte(77)
      ..write(obj._defaultBranch)
      ..writeByte(78)
      ..write(obj._score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LicenseAdapter extends TypeAdapter<License> {
  @override
  final int typeId = 3;

  @override
  License read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return License()
      .._key = fields[0] as String?
      .._name = fields[1] as String?
      .._spdxId = fields[2] as String?
      .._url = fields[3] as String?
      .._nodeId = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, License obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj._key)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj._spdxId)
      ..writeByte(3)
      ..write(obj._url)
      ..writeByte(4)
      ..write(obj._nodeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LicenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OwnerAdapter extends TypeAdapter<Owner> {
  @override
  final int typeId = 4;

  @override
  Owner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Owner()
      .._login = fields[0] as String?
      .._id = fields[1] as int?
      .._nodeId = fields[2] as String?
      .._avatarUrl = fields[3] as String?
      .._gravatarId = fields[4] as String?
      .._url = fields[5] as String?
      .._htmlUrl = fields[6] as String?
      .._followersUrl = fields[7] as String?
      .._followingUrl = fields[8] as String?
      .._gistsUrl = fields[9] as String?
      .._starredUrl = fields[10] as String?
      .._subscriptionsUrl = fields[11] as String?
      .._organizationsUrl = fields[12] as String?
      .._reposUrl = fields[13] as String?
      .._eventsUrl = fields[14] as String?
      .._receivedEventsUrl = fields[15] as String?
      .._type = fields[16] as String?
      .._siteAdmin = fields[17] as bool?;
  }

  @override
  void write(BinaryWriter writer, Owner obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj._login)
      ..writeByte(1)
      ..write(obj._id)
      ..writeByte(2)
      ..write(obj._nodeId)
      ..writeByte(3)
      ..write(obj._avatarUrl)
      ..writeByte(4)
      ..write(obj._gravatarId)
      ..writeByte(5)
      ..write(obj._url)
      ..writeByte(6)
      ..write(obj._htmlUrl)
      ..writeByte(7)
      ..write(obj._followersUrl)
      ..writeByte(8)
      ..write(obj._followingUrl)
      ..writeByte(9)
      ..write(obj._gistsUrl)
      ..writeByte(10)
      ..write(obj._starredUrl)
      ..writeByte(11)
      ..write(obj._subscriptionsUrl)
      ..writeByte(12)
      ..write(obj._organizationsUrl)
      ..writeByte(13)
      ..write(obj._reposUrl)
      ..writeByte(14)
      ..write(obj._eventsUrl)
      ..writeByte(15)
      ..write(obj._receivedEventsUrl)
      ..writeByte(16)
      ..write(obj._type)
      ..writeByte(17)
      ..write(obj._siteAdmin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
