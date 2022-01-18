import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/service/main_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gunggeumhany/presentation/home/home_appbar_widget.dart';
import 'package:flutter_gunggeumhany/service/bestseller_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Consumer<MainState>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: homeAppbarWidget(context: context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.width * 0.6,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    ...provider.bestsellerList.map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: darkThemeNavyCardColor),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: size.width * 0.3,
                                  height: size.width * 0.4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                        imageUrl: e.thumbnail,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                              child: CircularProgressIndicator(
                                                color: appMainColor,
                                              ),
                                            )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    context
                        .read<BestsellerState>()
                        .aladinBestsellerToFirestoreLogic();
                  },
                  child: Text('bestseller get')),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        );
      },
    );
  }
}
