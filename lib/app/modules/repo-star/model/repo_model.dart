import 'package:hive/hive.dart';

part 'repo_model.g.dart';

@HiveType(typeId: 1)
class RepoModel {
  RepoModel({
    int? totalCount,
    bool? incompleteResults,
    List<Items>? items,
  }) {
    _totalCount = totalCount;
    _incompleteResults = incompleteResults;
    _items = items;
  }

  RepoModel.fromJson(dynamic json) {
    _totalCount = json['total_count'];
    _incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }

  @HiveField(0)
  int? _totalCount;
  @HiveField(1)
  bool? _incompleteResults;
  @HiveField(2)
  List<Items>? _items;

  int? get totalCount => _totalCount;

  bool? get incompleteResults => _incompleteResults;

  List<Items>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_count'] = _totalCount;
    map['incomplete_results'] = _incompleteResults;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

@HiveType(typeId: 2)
class Items {
  Items({
    int? id,
    String? nodeId,
    String? name,
    String? fullName,
    bool? private,
    Owner? owner,
    String? htmlUrl,
    String? description,
    bool? fork,
    String? url,
    String? forksUrl,
    String? keysUrl,
    String? collaboratorsUrl,
    String? teamsUrl,
    String? hooksUrl,
    String? issueEventsUrl,
    String? eventsUrl,
    String? assigneesUrl,
    String? branchesUrl,
    String? tagsUrl,
    String? blobsUrl,
    String? gitTagsUrl,
    String? gitRefsUrl,
    String? treesUrl,
    String? statusesUrl,
    String? languagesUrl,
    String? stargazersUrl,
    String? contributorsUrl,
    String? subscribersUrl,
    String? subscriptionUrl,
    String? commitsUrl,
    String? gitCommitsUrl,
    String? commentsUrl,
    String? issueCommentUrl,
    String? contentsUrl,
    String? compareUrl,
    String? mergesUrl,
    String? archiveUrl,
    String? downloadsUrl,
    String? issuesUrl,
    String? pullsUrl,
    String? milestonesUrl,
    String? notificationsUrl,
    String? labelsUrl,
    String? releasesUrl,
    String? deploymentsUrl,
    String? createdAt,
    String? updatedAt,
    String? pushedAt,
    String? gitUrl,
    String? sshUrl,
    String? cloneUrl,
    String? svnUrl,
    String? homepage,
    int? size,
    int? stargazersCount,
    int? watchersCount,
    String? language,
    bool? hasIssues,
    bool? hasProjects,
    bool? hasDownloads,
    bool? hasWiki,
    bool? hasPages,
    bool? hasDiscussions,
    int? forksCount,
    dynamic mirrorUrl,
    bool? archived,
    bool? disabled,
    int? openIssuesCount,
    License? license,
    bool? allowForking,
    bool? isTemplate,
    bool? webCommitSignoffRequired,
    List<String>? topics,
    String? visibility,
    int? forks,
    int? openIssues,
    int? watchers,
    String? defaultBranch,
    double? score,
  }) {
    _id = id;
    _nodeId = nodeId;
    _name = name;
    _fullName = fullName;
    _private = private;
    _owner = owner;
    _htmlUrl = htmlUrl;
    _description = description;
    _fork = fork;
    _url = url;
    _forksUrl = forksUrl;
    _keysUrl = keysUrl;
    _collaboratorsUrl = collaboratorsUrl;
    _teamsUrl = teamsUrl;
    _hooksUrl = hooksUrl;
    _issueEventsUrl = issueEventsUrl;
    _eventsUrl = eventsUrl;
    _assigneesUrl = assigneesUrl;
    _branchesUrl = branchesUrl;
    _tagsUrl = tagsUrl;
    _blobsUrl = blobsUrl;
    _gitTagsUrl = gitTagsUrl;
    _gitRefsUrl = gitRefsUrl;
    _treesUrl = treesUrl;
    _statusesUrl = statusesUrl;
    _languagesUrl = languagesUrl;
    _stargazersUrl = stargazersUrl;
    _contributorsUrl = contributorsUrl;
    _subscribersUrl = subscribersUrl;
    _subscriptionUrl = subscriptionUrl;
    _commitsUrl = commitsUrl;
    _gitCommitsUrl = gitCommitsUrl;
    _commentsUrl = commentsUrl;
    _issueCommentUrl = issueCommentUrl;
    _contentsUrl = contentsUrl;
    _compareUrl = compareUrl;
    _mergesUrl = mergesUrl;
    _archiveUrl = archiveUrl;
    _downloadsUrl = downloadsUrl;
    _issuesUrl = issuesUrl;
    _pullsUrl = pullsUrl;
    _milestonesUrl = milestonesUrl;
    _notificationsUrl = notificationsUrl;
    _labelsUrl = labelsUrl;
    _releasesUrl = releasesUrl;
    _deploymentsUrl = deploymentsUrl;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _pushedAt = pushedAt;
    _gitUrl = gitUrl;
    _sshUrl = sshUrl;
    _cloneUrl = cloneUrl;
    _svnUrl = svnUrl;
    _homepage = homepage;
    _size = size;
    _stargazersCount = stargazersCount;
    _watchersCount = watchersCount;
    _language = language;
    _hasIssues = hasIssues;
    _hasProjects = hasProjects;
    _hasDownloads = hasDownloads;
    _hasWiki = hasWiki;
    _hasPages = hasPages;
    _hasDiscussions = hasDiscussions;
    _forksCount = forksCount;
    _mirrorUrl = mirrorUrl;
    _archived = archived;
    _disabled = disabled;
    _openIssuesCount = openIssuesCount;
    _license = license;
    _allowForking = allowForking;
    _isTemplate = isTemplate;
    _webCommitSignoffRequired = webCommitSignoffRequired;
    _topics = topics;
    _visibility = visibility;
    _forks = forks;
    _openIssues = openIssues;
    _watchers = watchers;
    _defaultBranch = defaultBranch;
    _score = score;
  }

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _nodeId = json['node_id'];
    _name = json['name'];
    _fullName = json['full_name'];
    _private = json['private'];
    _owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    _htmlUrl = json['html_url'];
    _description = json['description'];
    _fork = json['fork'];
    _url = json['url'];
    _forksUrl = json['forks_url'];
    _keysUrl = json['keys_url'];
    _collaboratorsUrl = json['collaborators_url'];
    _teamsUrl = json['teams_url'];
    _hooksUrl = json['hooks_url'];
    _issueEventsUrl = json['issue_events_url'];
    _eventsUrl = json['events_url'];
    _assigneesUrl = json['assignees_url'];
    _branchesUrl = json['branches_url'];
    _tagsUrl = json['tags_url'];
    _blobsUrl = json['blobs_url'];
    _gitTagsUrl = json['git_tags_url'];
    _gitRefsUrl = json['git_refs_url'];
    _treesUrl = json['trees_url'];
    _statusesUrl = json['statuses_url'];
    _languagesUrl = json['languages_url'];
    _stargazersUrl = json['stargazers_url'];
    _contributorsUrl = json['contributors_url'];
    _subscribersUrl = json['subscribers_url'];
    _subscriptionUrl = json['subscription_url'];
    _commitsUrl = json['commits_url'];
    _gitCommitsUrl = json['git_commits_url'];
    _commentsUrl = json['comments_url'];
    _issueCommentUrl = json['issue_comment_url'];
    _contentsUrl = json['contents_url'];
    _compareUrl = json['compare_url'];
    _mergesUrl = json['merges_url'];
    _archiveUrl = json['archive_url'];
    _downloadsUrl = json['downloads_url'];
    _issuesUrl = json['issues_url'];
    _pullsUrl = json['pulls_url'];
    _milestonesUrl = json['milestones_url'];
    _notificationsUrl = json['notifications_url'];
    _labelsUrl = json['labels_url'];
    _releasesUrl = json['releases_url'];
    _deploymentsUrl = json['deployments_url'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _pushedAt = json['pushed_at'];
    _gitUrl = json['git_url'];
    _sshUrl = json['ssh_url'];
    _cloneUrl = json['clone_url'];
    _svnUrl = json['svn_url'];
    _homepage = json['homepage'];
    _size = json['size'];
    _stargazersCount = json['stargazers_count'];
    _watchersCount = json['watchers_count'];
    _language = json['language'];
    _hasIssues = json['has_issues'];
    _hasProjects = json['has_projects'];
    _hasDownloads = json['has_downloads'];
    _hasWiki = json['has_wiki'];
    _hasPages = json['has_pages'];
    _hasDiscussions = json['has_discussions'];
    _forksCount = json['forks_count'];
    _mirrorUrl = json['mirror_url'];
    _archived = json['archived'];
    _disabled = json['disabled'];
    _openIssuesCount = json['open_issues_count'];
    _license =
        json['license'] != null ? License.fromJson(json['license']) : null;
    _allowForking = json['allow_forking'];
    _isTemplate = json['is_template'];
    _webCommitSignoffRequired = json['web_commit_signoff_required'];
    _topics = json['topics'] != null ? json['topics'].cast<String>() : [];
    _visibility = json['visibility'];
    _forks = json['forks'];
    _openIssues = json['open_issues'];
    _watchers = json['watchers'];
    _defaultBranch = json['default_branch'];
    _score = json['score'];
  }

  @HiveField(0)
  int? _id;
  @HiveField(1)
  String? _nodeId;
  @HiveField(2)
  String? _name;
  @HiveField(3)
  String? _fullName;
  @HiveField(4)
  bool? _private;
  @HiveField(5)
  Owner? _owner;
  @HiveField(6)
  String? _htmlUrl;
  @HiveField(7)
  String? _description;
  @HiveField(8)
  bool? _fork;
  @HiveField(9)
  String? _url;
  @HiveField(10)
  String? _forksUrl;
  @HiveField(11)
  String? _keysUrl;
  @HiveField(12)
  String? _collaboratorsUrl;
  @HiveField(13)
  String? _teamsUrl;
  @HiveField(14)
  String? _hooksUrl;
  @HiveField(15)
  String? _issueEventsUrl;
  @HiveField(16)
  String? _eventsUrl;
  @HiveField(17)
  String? _assigneesUrl;
  @HiveField(18)
  String? _branchesUrl;
  @HiveField(19)
  String? _tagsUrl;
  @HiveField(20)
  String? _blobsUrl;
  @HiveField(21)
  String? _gitTagsUrl;
  @HiveField(22)
  String? _gitRefsUrl;
  @HiveField(23)
  String? _treesUrl;
  @HiveField(24)
  String? _statusesUrl;
  @HiveField(25)
  String? _languagesUrl;
  @HiveField(26)
  String? _stargazersUrl;
  @HiveField(27)
  String? _contributorsUrl;
  @HiveField(28)
  String? _subscribersUrl;
  @HiveField(29)
  String? _subscriptionUrl;
  @HiveField(30)
  String? _commitsUrl;
  @HiveField(31)
  String? _gitCommitsUrl;
  @HiveField(32)
  String? _commentsUrl;
  @HiveField(33)
  String? _issueCommentUrl;
  @HiveField(34)
  String? _contentsUrl;
  @HiveField(35)
  String? _compareUrl;
  @HiveField(36)
  String? _mergesUrl;
  @HiveField(37)
  String? _archiveUrl;
  @HiveField(38)
  String? _downloadsUrl;
  @HiveField(39)
  String? _issuesUrl;
  @HiveField(40)
  String? _pullsUrl;
  @HiveField(41)
  String? _milestonesUrl;
  @HiveField(42)
  String? _notificationsUrl;
  @HiveField(43)
  String? _labelsUrl;
  @HiveField(44)
  String? _releasesUrl;
  @HiveField(45)
  String? _deploymentsUrl;
  @HiveField(46)
  String? _createdAt;
  @HiveField(47)
  String? _updatedAt;
  @HiveField(48)
  String? _pushedAt;
  @HiveField(79)
  String? _gitUrl;
  @HiveField(49)
  String? _sshUrl;
  @HiveField(50)
  String? _cloneUrl;
  @HiveField(51)
  String? _svnUrl;
  @HiveField(52)
  String? _homepage;
  @HiveField(53)
  int? _size;
  @HiveField(54)
  int? _stargazersCount;
  @HiveField(55)
  int? _watchersCount;
  @HiveField(56)
  String? _language;
  @HiveField(57)
  bool? _hasIssues;
  @HiveField(58)
  bool? _hasProjects;
  @HiveField(59)
  bool? _hasDownloads;
  @HiveField(60)
  bool? _hasWiki;
  @HiveField(61)
  bool? _hasPages;
  @HiveField(62)
  bool? _hasDiscussions;
  @HiveField(63)
  int? _forksCount;
  @HiveField(64)
  dynamic _mirrorUrl;
  @HiveField(65)
  bool? _archived;
  @HiveField(66)
  bool? _disabled;
  @HiveField(67)
  int? _openIssuesCount;
  @HiveField(68)
  License? _license;
  @HiveField(69)
  bool? _allowForking;
  @HiveField(70)
  bool? _isTemplate;
  @HiveField(71)
  bool? _webCommitSignoffRequired;
  @HiveField(72)
  List<String>? _topics;
  @HiveField(73)
  String? _visibility;
  @HiveField(74)
  int? _forks;
  @HiveField(75)
  int? _openIssues;
  @HiveField(76)
  int? _watchers;
  @HiveField(77)
  String? _defaultBranch;
  @HiveField(78)
  double? _score;

  int? get id => _id;

  String? get nodeId => _nodeId;

  String? get name => _name;

  String? get fullName => _fullName;

  bool? get private => _private;

  Owner? get owner => _owner;

  String? get htmlUrl => _htmlUrl;

  String? get description => _description;

  bool? get fork => _fork;

  String? get url => _url;

  String? get forksUrl => _forksUrl;

  String? get keysUrl => _keysUrl;

  String? get collaboratorsUrl => _collaboratorsUrl;

  String? get teamsUrl => _teamsUrl;

  String? get hooksUrl => _hooksUrl;

  String? get issueEventsUrl => _issueEventsUrl;

  String? get eventsUrl => _eventsUrl;

  String? get assigneesUrl => _assigneesUrl;

  String? get branchesUrl => _branchesUrl;

  String? get tagsUrl => _tagsUrl;

  String? get blobsUrl => _blobsUrl;

  String? get gitTagsUrl => _gitTagsUrl;

  String? get gitRefsUrl => _gitRefsUrl;

  String? get treesUrl => _treesUrl;

  String? get statusesUrl => _statusesUrl;

  String? get languagesUrl => _languagesUrl;

  String? get stargazersUrl => _stargazersUrl;

  String? get contributorsUrl => _contributorsUrl;

  String? get subscribersUrl => _subscribersUrl;

  String? get subscriptionUrl => _subscriptionUrl;

  String? get commitsUrl => _commitsUrl;

  String? get gitCommitsUrl => _gitCommitsUrl;

  String? get commentsUrl => _commentsUrl;

  String? get issueCommentUrl => _issueCommentUrl;

  String? get contentsUrl => _contentsUrl;

  String? get compareUrl => _compareUrl;

  String? get mergesUrl => _mergesUrl;

  String? get archiveUrl => _archiveUrl;

  String? get downloadsUrl => _downloadsUrl;

  String? get issuesUrl => _issuesUrl;

  String? get pullsUrl => _pullsUrl;

  String? get milestonesUrl => _milestonesUrl;

  String? get notificationsUrl => _notificationsUrl;

  String? get labelsUrl => _labelsUrl;

  String? get releasesUrl => _releasesUrl;

  String? get deploymentsUrl => _deploymentsUrl;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get pushedAt => _pushedAt;

  String? get gitUrl => _gitUrl;

  String? get sshUrl => _sshUrl;

  String? get cloneUrl => _cloneUrl;

  String? get svnUrl => _svnUrl;

  String? get homepage => _homepage;

  int? get size => _size;

  int? get stargazersCount => _stargazersCount;

  int? get watchersCount => _watchersCount;

  String? get language => _language;

  bool? get hasIssues => _hasIssues;

  bool? get hasProjects => _hasProjects;

  bool? get hasDownloads => _hasDownloads;

  bool? get hasWiki => _hasWiki;

  bool? get hasPages => _hasPages;

  bool? get hasDiscussions => _hasDiscussions;

  int? get forksCount => _forksCount;

  dynamic get mirrorUrl => _mirrorUrl;

  bool? get archived => _archived;

  bool? get disabled => _disabled;

  int? get openIssuesCount => _openIssuesCount;

  License? get license => _license;

  bool? get allowForking => _allowForking;

  bool? get isTemplate => _isTemplate;

  bool? get webCommitSignoffRequired => _webCommitSignoffRequired;

  List<String>? get topics => _topics;

  String? get visibility => _visibility;

  int? get forks => _forks;

  int? get openIssues => _openIssues;

  int? get watchers => _watchers;

  String? get defaultBranch => _defaultBranch;

  double? get score => _score;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['node_id'] = _nodeId;
    map['name'] = _name;
    map['full_name'] = _fullName;
    map['private'] = _private;
    if (_owner != null) {
      map['owner'] = _owner?.toJson();
    }
    map['html_url'] = _htmlUrl;
    map['description'] = _description;
    map['fork'] = _fork;
    map['url'] = _url;
    map['forks_url'] = _forksUrl;
    map['keys_url'] = _keysUrl;
    map['collaborators_url'] = _collaboratorsUrl;
    map['teams_url'] = _teamsUrl;
    map['hooks_url'] = _hooksUrl;
    map['issue_events_url'] = _issueEventsUrl;
    map['events_url'] = _eventsUrl;
    map['assignees_url'] = _assigneesUrl;
    map['branches_url'] = _branchesUrl;
    map['tags_url'] = _tagsUrl;
    map['blobs_url'] = _blobsUrl;
    map['git_tags_url'] = _gitTagsUrl;
    map['git_refs_url'] = _gitRefsUrl;
    map['trees_url'] = _treesUrl;
    map['statuses_url'] = _statusesUrl;
    map['languages_url'] = _languagesUrl;
    map['stargazers_url'] = _stargazersUrl;
    map['contributors_url'] = _contributorsUrl;
    map['subscribers_url'] = _subscribersUrl;
    map['subscription_url'] = _subscriptionUrl;
    map['commits_url'] = _commitsUrl;
    map['git_commits_url'] = _gitCommitsUrl;
    map['comments_url'] = _commentsUrl;
    map['issue_comment_url'] = _issueCommentUrl;
    map['contents_url'] = _contentsUrl;
    map['compare_url'] = _compareUrl;
    map['merges_url'] = _mergesUrl;
    map['archive_url'] = _archiveUrl;
    map['downloads_url'] = _downloadsUrl;
    map['issues_url'] = _issuesUrl;
    map['pulls_url'] = _pullsUrl;
    map['milestones_url'] = _milestonesUrl;
    map['notifications_url'] = _notificationsUrl;
    map['labels_url'] = _labelsUrl;
    map['releases_url'] = _releasesUrl;
    map['deployments_url'] = _deploymentsUrl;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['pushed_at'] = _pushedAt;
    map['git_url'] = _gitUrl;
    map['ssh_url'] = _sshUrl;
    map['clone_url'] = _cloneUrl;
    map['svn_url'] = _svnUrl;
    map['homepage'] = _homepage;
    map['size'] = _size;
    map['stargazers_count'] = _stargazersCount;
    map['watchers_count'] = _watchersCount;
    map['language'] = _language;
    map['has_issues'] = _hasIssues;
    map['has_projects'] = _hasProjects;
    map['has_downloads'] = _hasDownloads;
    map['has_wiki'] = _hasWiki;
    map['has_pages'] = _hasPages;
    map['has_discussions'] = _hasDiscussions;
    map['forks_count'] = _forksCount;
    map['mirror_url'] = _mirrorUrl;
    map['archived'] = _archived;
    map['disabled'] = _disabled;
    map['open_issues_count'] = _openIssuesCount;
    if (_license != null) {
      map['license'] = _license?.toJson();
    }
    map['allow_forking'] = _allowForking;
    map['is_template'] = _isTemplate;
    map['web_commit_signoff_required'] = _webCommitSignoffRequired;
    map['topics'] = _topics;
    map['visibility'] = _visibility;
    map['forks'] = _forks;
    map['open_issues'] = _openIssues;
    map['watchers'] = _watchers;
    map['default_branch'] = _defaultBranch;
    map['score'] = _score;
    return map;
  }
}

@HiveType(typeId: 3)
class License {
  License({
    String? key,
    String? name,
    String? spdxId,
    String? url,
    String? nodeId,
  }) {
    _key = key;
    _name = name;
    _spdxId = spdxId;
    _url = url;
    _nodeId = nodeId;
  }

  License.fromJson(dynamic json) {
    _key = json['key'];
    _name = json['name'];
    _spdxId = json['spdx_id'];
    _url = json['url'];
    _nodeId = json['node_id'];
  }

  @HiveField(0)
  String? _key;
  @HiveField(1)
  String? _name;
  @HiveField(2)
  String? _spdxId;
  @HiveField(3)
  String? _url;
  @HiveField(4)
  String? _nodeId;

  String? get key => _key;

  String? get name => _name;

  String? get spdxId => _spdxId;

  String? get url => _url;

  String? get nodeId => _nodeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = _key;
    map['name'] = _name;
    map['spdx_id'] = _spdxId;
    map['url'] = _url;
    map['node_id'] = _nodeId;
    return map;
  }
}

@HiveType(typeId: 4)
class Owner {
  Owner({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    bool? siteAdmin,
  }) {
    _login = login;
    _id = id;
    _nodeId = nodeId;
    _avatarUrl = avatarUrl;
    _gravatarId = gravatarId;
    _url = url;
    _htmlUrl = htmlUrl;
    _followersUrl = followersUrl;
    _followingUrl = followingUrl;
    _gistsUrl = gistsUrl;
    _starredUrl = starredUrl;
    _subscriptionsUrl = subscriptionsUrl;
    _organizationsUrl = organizationsUrl;
    _reposUrl = reposUrl;
    _eventsUrl = eventsUrl;
    _receivedEventsUrl = receivedEventsUrl;
    _type = type;
    _siteAdmin = siteAdmin;
  }

  Owner.fromJson(dynamic json) {
    _login = json['login'];
    _id = json['id'];
    _nodeId = json['node_id'];
    _avatarUrl = json['avatar_url'];
    _gravatarId = json['gravatar_id'];
    _url = json['url'];
    _htmlUrl = json['html_url'];
    _followersUrl = json['followers_url'];
    _followingUrl = json['following_url'];
    _gistsUrl = json['gists_url'];
    _starredUrl = json['starred_url'];
    _subscriptionsUrl = json['subscriptions_url'];
    _organizationsUrl = json['organizations_url'];
    _reposUrl = json['repos_url'];
    _eventsUrl = json['events_url'];
    _receivedEventsUrl = json['received_events_url'];
    _type = json['type'];
    _siteAdmin = json['site_admin'];
  }

  @HiveField(0)
  String? _login;
  @HiveField(1)
  int? _id;
  @HiveField(2)
  String? _nodeId;
  @HiveField(3)
  String? _avatarUrl;
  @HiveField(4)
  String? _gravatarId;
  @HiveField(5)
  String? _url;
  @HiveField(6)
  String? _htmlUrl;
  @HiveField(7)
  String? _followersUrl;
  @HiveField(8)
  String? _followingUrl;
  @HiveField(9)
  String? _gistsUrl;
  @HiveField(10)
  String? _starredUrl;
  @HiveField(11)
  String? _subscriptionsUrl;
  @HiveField(12)
  String? _organizationsUrl;
  @HiveField(13)
  String? _reposUrl;
  @HiveField(14)
  String? _eventsUrl;
  @HiveField(15)
  String? _receivedEventsUrl;
  @HiveField(16)
  String? _type;
  @HiveField(17)
  bool? _siteAdmin;

  String? get login => _login;

  int? get id => _id;

  String? get nodeId => _nodeId;

  String? get avatarUrl => _avatarUrl;

  String? get gravatarId => _gravatarId;

  String? get url => _url;

  String? get htmlUrl => _htmlUrl;

  String? get followersUrl => _followersUrl;

  String? get followingUrl => _followingUrl;

  String? get gistsUrl => _gistsUrl;

  String? get starredUrl => _starredUrl;

  String? get subscriptionsUrl => _subscriptionsUrl;

  String? get organizationsUrl => _organizationsUrl;

  String? get reposUrl => _reposUrl;

  String? get eventsUrl => _eventsUrl;

  String? get receivedEventsUrl => _receivedEventsUrl;

  String? get type => _type;

  bool? get siteAdmin => _siteAdmin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    map['id'] = _id;
    map['node_id'] = _nodeId;
    map['avatar_url'] = _avatarUrl;
    map['gravatar_id'] = _gravatarId;
    map['url'] = _url;
    map['html_url'] = _htmlUrl;
    map['followers_url'] = _followersUrl;
    map['following_url'] = _followingUrl;
    map['gists_url'] = _gistsUrl;
    map['starred_url'] = _starredUrl;
    map['subscriptions_url'] = _subscriptionsUrl;
    map['organizations_url'] = _organizationsUrl;
    map['repos_url'] = _reposUrl;
    map['events_url'] = _eventsUrl;
    map['received_events_url'] = _receivedEventsUrl;
    map['type'] = _type;
    map['site_admin'] = _siteAdmin;
    return map;
  }
}
