import 'package:flutter/cupertino.dart';
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
              largeTitle: Text(context.t('Books')),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text(context.t('Edit')),
                onPressed: () {},
              ),
            ),
          ];
        }),
        body: Container(
          color: const Color(0xFFf9f9f9),
          child: Center(
            child: Text(context.t('Hello World')),
          ),
        ),
      ),
    );
    // return CupertinoPageScaffold(
    //   child: NestedScrollView(
    //     headerSliverBuilder: ((context, innerBoxIsScrolled) {
    //       return [
    //         CupertinoSliverNavigationBar(
    //           largeTitle: Text(context.t('Books')),
    //           trailing: TextButton(
    //             child: Text(context.t('Edit')),
    //             onPressed: () {},
    //           ),
    //         ),
    //       ];
    //     }),
    //     body: Center(
    //       child: Text(context.t('Hello World')),
    //     ),
    //   ),
    // );
  }
}
