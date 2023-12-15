import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:gap/gap.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:zayat/models/all_post.dart';
import 'package:zayat/screens/channel_detail.dart';
import 'package:zayat/screens/post_detail.dart';
import 'package:zayat/services/channel_api_service.dart';
import 'package:zayat/utils/utils.dart';
import 'package:zayat/widgets/video_thumbnail.dart';

class PostWidget extends StatefulWidget {
  final Posts posts;
  const PostWidget({super.key, required this.posts});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final ChannelApiService _channelApiService = ChannelApiService(Dio());
  bool isLike = false;
  bool isUnlike = false;
  late int likeCount = widget.posts.likeCount ?? 0;
  late int unlikeCount = widget.posts.unlikeCount ?? 0;
  late int viewCount = widget.posts.viewCount ?? 0;

  InterstitialAd? _interstitialAd;
  bool isAdLoaded = false;

  // final adUnitId = 'ca-app-pub-5539869030968077/5199450234 ';
  final adUnitId = 'ca-app-pub-3940256099942544/1033173712';

  void loadAd() {
    InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            _interstitialAd = ad;
            isAdLoaded = true;
          },
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _channelApiService.viewPost(widget.posts.postId!);
        if (isAdLoaded) {
          _interstitialAd?.show();
        }
        Navigator.of(context)
            .pushNamed(PostDetail.route, arguments: widget.posts);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  ChannelDetail.route,
                  arguments: {
                    'channelId': widget.posts.chanelId,
                    'channelName': widget.posts.channelName,
                  },
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: NetworkImage(
                          widget.posts.channelProfilePicture ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              title: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  ChannelDetail.route,
                  arguments: {
                    'channelId': widget.posts.chanelId,
                    'channelName': widget.posts.channelName,
                  },
                ),
                child: Text(
                  widget.posts.channelName ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(setDifferentTime(widget.posts.createDate!)
                  // DateFormat('dd MMM yyyy').format(
                  //   DateTime.parse(widget.posts.createDate!),
                  // ),
                  ),
            ),
            ExpandableText(
              widget.posts.postText ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
              linkTextStyle: const TextStyle(
                color: Colors.blue,
              ),
              trim: 2,
            ),
            const Gap(8),
            // VideoPlayerScreen(
            //   videoUrl: widget.posts.mediaLocation?.first ?? '',
            // ),
            VideoThumbnail(videoUrl: widget.posts.mediaLocation?.first ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (!isLike) {
                            likeCount++;
                            _channelApiService.likePost(widget.posts.postId!);
                          } else {
                            likeCount--;
                            _channelApiService
                                .cancelLikePost(widget.posts.postId!);
                          }
                          isLike = !isLike;
                          if (isUnlike) {
                            isUnlike = false;
                            unlikeCount--;
                            _channelApiService
                                .cancelUnlikePost(widget.posts.postId!);
                          }
                        });
                      },
                      icon: Icon(
                        Icons.thumb_up,
                        color: isLike ? Colors.blue : Colors.grey,
                      ),
                    ),
                    Text('$likeCount'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (!isUnlike) {
                            unlikeCount++;
                            _channelApiService.unlikePost(widget.posts.postId!);
                          } else {
                            unlikeCount--;
                            _channelApiService
                                .cancelUnlikePost(widget.posts.postId!);
                          }
                          isUnlike = !isUnlike;
                          if (isLike) {
                            isLike = false;
                            likeCount--;
                            _channelApiService
                                .cancelLikePost(widget.posts.postId!);
                          }
                        });
                      },
                      icon: Icon(
                        Icons.thumb_down,
                        color: isUnlike ? Colors.blue : Colors.grey,
                      ),
                    ),
                    Text('$unlikeCount'),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                    Text('$viewCount'),
                  ],
                ),
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}

        // {
        //     "postId": 59,
        //     "postText": "နေရာ အနှံ့ စက်သုံးဆီ ဝယ်ယူမှု အခက်အခဲနဲ့ ရင်ဆိုင်နေရ - BBC NEWS မြန်မာ",
        //     "mediaLocation": [
        //         "https://natbounappspaces.blr1.cdn.digitaloceanspaces.com/နေရာ အနှံ့ စက်သုံးဆီ ဝယ်ယူမှု အခက်အခဲနဲ့ ရင်ဆိုင်နေရ - BBC NEWS မြန်မာ.mp4368477321"
        //     ],
        //     "createDate": "2023-10-07T13:24:42.000+00:00",
        //     "channelName": "BBC News",
        //     "chanelId": 5,
        //     "channelProfilePicture": "https://natbounappspaces.blr1.cdn.digitaloceanspaces.com/bbc new profile pic.jpg546591408",
        //     "likeCount": 0,
        //     "unlikeCount": 0,
        //     "viewCount": 0
        // }