import 'package:arknight_wiki/provider/banner_provider.dart';
import 'package:arknight_wiki/provider/bottom_nav_provider.dart';
import 'package:arknight_wiki/provider/enemy_banner_provider.dart';
import 'package:arknight_wiki/provider/event_preview_provider.dart';
import 'package:arknight_wiki/provider/operator_class_banner_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavChange =
    ChangeNotifierProvider<BottomNavProvider>((ref) => BottomNavProvider());

final bannerProvider =
    ChangeNotifierProvider<BannerProvider>((ref) => BannerProvider());

final gachaBannerProvider =
    ChangeNotifierProvider<BannerProvider>((ref) => BannerProvider());

final operatorClassBannerRiverpod =
    ChangeNotifierProvider<OperatorClassBannerProvider>(
        (ref) => OperatorClassBannerProvider(posisition: 0));

final popularOperatorRiverpod = ChangeNotifierProvider((ref) {
  final indexChoose = ref
      .watch(operatorClassBannerRiverpod.select((value) => value.posisition));
  return OperatorClassBannerProvider(posisition: indexChoose);
});

final enemyBannerRiverpod =
    ChangeNotifierProvider<EnemyBannerProvider>((ref) => EnemyBannerProvider());

final previeEventBannerRiverpod =
    ChangeNotifierProvider((ref) => EventPreviewProvider());
