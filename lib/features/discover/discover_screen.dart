import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

final tabs = ["Top", "Users", "Videos", "Sounds", "LIVE", "Shopping", "Brands"];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEditingController = TextEditingController();
  late final TabController _tabController;

  bool _isWriting = false;

  void _onSearchChanged(String value) {
    print(value);
  }

  void _onSearchSubmitted(String value) {
    print(value);
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _clearWriting() {
    _textEditingController.clear();
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) _stopWriting();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: tabs.length,
      child: GestureDetector(
        onTap: _stopWriting,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 1,
            title: Container(
              constraints: BoxConstraints(maxWidth: Breakpoints.sm),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onTap: _onStartWriting,
                      onSubmitted: _onSearchSubmitted,
                      autocorrect: false,
                      textInputAction: TextInputAction.search,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.size12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: Sizes.size12,
                        ),
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              color:
                                  isDarkMode(context)
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ],
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_isWriting)
                              GestureDetector(
                                onTap: _clearWriting,
                                child: FaIcon(
                                  FontAwesomeIcons.deleteLeft,
                                  color:
                                      isDarkMode(context)
                                          ? Colors.white
                                          : Colors.grey.shade600,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  FaIcon(FontAwesomeIcons.sliders),
                ],
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              splashFactory: NoSplash.splashFactory,
              padding: EdgeInsets.symmetric(horizontal: Sizes.size16),
              isScrollable: true,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              tabs: [for (var tab in tabs) Tab(text: tab)],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                padding: EdgeInsets.all(Sizes.size6),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size12,
                  childAspectRatio: 9 / 20,
                ),
                itemBuilder:
                    (context, index) => LayoutBuilder(
                      builder:
                          (context, constraints) => Column(
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size4,
                                  ),
                                ),
                                child: AspectRatio(
                                  aspectRatio: 9 / 16,
                                  child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder:
                                        "assets/images/placeholder.jpg",
                                    image:
                                        "https://pbs.twimg.com/media/GI8tHk-bsAAXvTK?format=jpg&name=large",
                                  ),
                                ),
                              ),
                              Gaps.v10,
                              Text(
                                "This is a very long caption for my tiktok that im upload jus now currently.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: Sizes.size16 + Sizes.size2,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                ),
                              ),
                              Gaps.v8,
                              if (constraints.maxWidth < 200 ||
                                  constraints.maxWidth > 250)
                                DefaultTextStyle(
                                  style: TextStyle(
                                    color:
                                        isDarkMode(context)
                                            ? Colors.grey.shade300
                                            : Colors.grey.shade600,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundImage: NetworkImage(
                                          "https://tamagotchi-official.com/tamagotchi/jp/character/2023/06/03/7bDlVADQACLZJXuR/%E3%81%BF%E3%81%BF%E3%81%A3%E3%81%A1_%E6%9B%B8%E3%81%8D%E5%87%BA%E3%81%97%E6%AD%A3%E6%96%B9%E5%BD%A2.png",
                                        ),
                                      ),
                                      Gaps.h4,
                                      Expanded(
                                        child: Text(
                                          "My avatar is going to be very long",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Gaps.h4,
                                      FaIcon(
                                        FontAwesomeIcons.heart,
                                        size: Sizes.size16,
                                        color: Colors.grey.shade600,
                                      ),
                                      Gaps.h2,
                                      Text("2.5M"),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                    ),
              ),
              for (var tab in tabs.skip(1))
                Center(child: Text(tab, style: TextStyle(fontSize: 28))),
            ],
          ),
        ),
      ),
    );
  }
}
