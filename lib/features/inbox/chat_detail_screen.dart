import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onScroll() {
    print("${_scrollController.offset}");
  }

  void _onEdit() {
    print("${_textEditingController.selection}");
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _textEditingController.addListener(_onEdit);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: Sizes.size8,
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: Sizes.size24,
                  foregroundImage: NetworkImage(
                    "https://item.kakaocdn.net/do/00bef4bad789c2c98ccd9229d074b9384022de826f725e10df604bf1b9725cfd",
                  ),
                  child: Text("니꼬"),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: Sizes.size18,
                    height: Sizes.size18,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(Sizes.size14),
                      border: Border.all(
                        color: Colors.white,
                        width: Sizes.size3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            title: Text("니꼬", style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text("Active now"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.flag,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
                Gaps.h32,
                FaIcon(
                  FontAwesomeIcons.ellipsis,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size14,
                ),
                itemBuilder: (context, index) {
                  final isMine = index % 2 == 0;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment:
                        isMine
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(Sizes.size14),
                        decoration: BoxDecoration(
                          color:
                              isMine
                                  ? Colors.blue
                                  : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Sizes.size20),
                            topRight: Radius.circular(Sizes.size20),
                            bottomLeft: Radius.circular(
                              isMine ? Sizes.size20 : Sizes.size5,
                            ),
                            bottomRight: Radius.circular(
                              !isMine ? Sizes.size20 : Sizes.size5,
                            ),
                          ),
                        ),
                        child: Text(
                          "This is a message!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Gaps.v10,
                itemCount: 12,
              ),
            ),
            BottomAppBar(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.size10,
                horizontal: Sizes.size14,
              ),
              color: Colors.grey.shade100,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      autocorrect: false,
                      textInputAction: TextInputAction.newline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "Send a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.size18),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: Sizes.size12,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: Sizes.size40,
                        height: Sizes.size40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(Sizes.size96),
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.solidPaperPlane,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
