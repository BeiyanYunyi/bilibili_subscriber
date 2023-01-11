import 'dart:convert';

class Vlist {
	int? comment;
	int? typeid;
	int? play;
	String? pic;
	String? subtitle;
	String? description;
	String? copyright;
	String? title;
	int? review;
	String? author;
	int? mid;
	int? created;
	String? length;
	int? videoReview;
	int? aid;
	String? bvid;
	bool? hideClick;
	int? isPay;
	int? isUnionVideo;
	int? isSteinsGate;
	int? isLivePlayback;
	dynamic meta;
	int? isAvoided;
	int? attribute;

	Vlist({
		this.comment, 
		this.typeid, 
		this.play, 
		this.pic, 
		this.subtitle, 
		this.description, 
		this.copyright, 
		this.title, 
		this.review, 
		this.author, 
		this.mid, 
		this.created, 
		this.length, 
		this.videoReview, 
		this.aid, 
		this.bvid, 
		this.hideClick, 
		this.isPay, 
		this.isUnionVideo, 
		this.isSteinsGate, 
		this.isLivePlayback, 
		this.meta, 
		this.isAvoided, 
		this.attribute, 
	});

	@override
	String toString() {
		return 'Vlist(comment: $comment, typeid: $typeid, play: $play, pic: $pic, subtitle: $subtitle, description: $description, copyright: $copyright, title: $title, review: $review, author: $author, mid: $mid, created: $created, length: $length, videoReview: $videoReview, aid: $aid, bvid: $bvid, hideClick: $hideClick, isPay: $isPay, isUnionVideo: $isUnionVideo, isSteinsGate: $isSteinsGate, isLivePlayback: $isLivePlayback, meta: $meta, isAvoided: $isAvoided, attribute: $attribute)';
	}

	factory Vlist.fromMap(Map<String, dynamic> data) => Vlist(
				comment: data['comment'] as int?,
				typeid: data['typeid'] as int?,
				play: data['play'] as int?,
				pic: data['pic'] as String?,
				subtitle: data['subtitle'] as String?,
				description: data['description'] as String?,
				copyright: data['copyright'] as String?,
				title: data['title'] as String?,
				review: data['review'] as int?,
				author: data['author'] as String?,
				mid: data['mid'] as int?,
				created: data['created'] as int?,
				length: data['length'] as String?,
				videoReview: data['video_review'] as int?,
				aid: data['aid'] as int?,
				bvid: data['bvid'] as String?,
				hideClick: data['hide_click'] as bool?,
				isPay: data['is_pay'] as int?,
				isUnionVideo: data['is_union_video'] as int?,
				isSteinsGate: data['is_steins_gate'] as int?,
				isLivePlayback: data['is_live_playback'] as int?,
				meta: data['meta'] as dynamic,
				isAvoided: data['is_avoided'] as int?,
				attribute: data['attribute'] as int?,
			);

	Map<String, dynamic> toMap() => {
				'comment': comment,
				'typeid': typeid,
				'play': play,
				'pic': pic,
				'subtitle': subtitle,
				'description': description,
				'copyright': copyright,
				'title': title,
				'review': review,
				'author': author,
				'mid': mid,
				'created': created,
				'length': length,
				'video_review': videoReview,
				'aid': aid,
				'bvid': bvid,
				'hide_click': hideClick,
				'is_pay': isPay,
				'is_union_video': isUnionVideo,
				'is_steins_gate': isSteinsGate,
				'is_live_playback': isLivePlayback,
				'meta': meta,
				'is_avoided': isAvoided,
				'attribute': attribute,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Vlist].
	factory Vlist.fromJson(String data) {
		return Vlist.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Vlist] to a JSON string.
	String toJson() => json.encode(toMap());
}
