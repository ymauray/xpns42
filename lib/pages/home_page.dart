import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return [
            CupertinoSliverNavigationBar(
              backgroundColor: CupertinoColors.white,
              largeTitle: Text(context.t('Books')),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text(context.t('Edit')),
                onPressed: () {},
              ),
            ),
          ];
        }),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Material(
                child: Container(
                  color: const Color(0xFFf9f9f9),
                  child: ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('Book ${index + 1}'),
                      subtitle: const Text('Subtitle'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        debugPrint("Hello, $index");
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 50.0,
                    ),
                    Text(
                      "Hello, world!",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    CupertinoButton(
                      minSize: 50,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.add,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
