//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Providers
import '../providers/memes_provider.dart';

//Widgets
import '../widgets/text_bold.dart';
import '../widgets/text_normal.dart';

//Models
import '../models/meme.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, required this.yourName}) : super(key: key);
  final String yourName;
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late double widgetDevice = MediaQuery.of(context).size.width;
  late double heightDevice = MediaQuery.of(context).size.height;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Provider.of<MemesProvider>(context, listen: false).getHTTPData();
    reload();
  }

  reload() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        Provider.of<MemesProvider>(context, listen: false).getHTTPData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Screen 2"),
        ),
        actions: const [
          SizedBox(width: 50),
        ],
      ),
      body: buildBody(),
      floatingActionButton: buildFloatingButton(),
    );
  }

  buildFloatingButton() {
    return FloatingActionButton(
      backgroundColor: Colors.grey.shade300,
      child: const Icon(
        Icons.keyboard_arrow_up_sharp,
        color: Colors.black,
        size: 50,
      ),
      onPressed: () {
        _scrollController.animateTo(_scrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn);
      },
    );
  }

  buildListView(List<Meme> memes) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: memes.length,
      itemBuilder: (context, index) {
        return buildItem(memes, index);
      },
    );
  }

  buildItem(List<Meme> memes, int inx) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 12,
      ),
      child: Container(
        width: widgetDevice,
        color: Colors.grey.shade300,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(memes[inx].url),
            ),
            SizedBox(
              width: widgetDevice * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBold(text: memes[inx].name),
                  const SizedBox(
                    height: 5,
                  ),
                  TextNormal(
                      text: "${memes[inx].width} x ${memes[inx].height}"),
                  SizedBox(
                    width: widgetDevice,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(memes[inx].id),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildBody() {
    return Consumer<MemesProvider>(
      builder: (context, value, child) => SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
              width: widgetDevice,
            ),
            TextBold(text: "Welcome: ${widget.yourName}"),
            const SizedBox(height: 15),
            value.loading
                ? const CircularProgressIndicator(
                    color: Colors.blue,
                  )
                : SizedBox(
                    width: widgetDevice,
                    height: heightDevice * 0.82,
                    child: buildListView(value.memes),
                  ),
          ],
        ),
      ),
    );
  }
}
