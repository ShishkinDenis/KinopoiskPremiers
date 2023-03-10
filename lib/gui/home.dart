import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/navigation/app_router.gr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _favouritesBadgeAmount = 0;
  late bool _showFavouritesBadge;

  @override
  Widget build(BuildContext context) {
    _showFavouritesBadge = _favouritesBadgeAmount > 0;
    return AutoTabsScaffold(
      routes: [
        FilmsRouter(month: Month.january, onChangeFavouritesAmount: _changefavouritesBadgeAmount),
        const FavouritesRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.movie),
              label: AppLocalizations.of(context)?.films,
            ),
            BottomNavigationBarItem(
              icon: badges.Badge(
                position: badges.BadgePosition.topEnd(),
                showBadge: _showFavouritesBadge,
                badgeStyle: const badges.BadgeStyle(
                  padding: EdgeInsets.all(6),
                ),
                badgeContent: Text(
                  _favouritesBadgeAmount.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: const Icon(Icons.favorite),
              ),
              label: AppLocalizations.of(context)?.favourites,
            ),
          ],
        );
      },
    );
  }

  void _changefavouritesBadgeAmount(int favouritesBadgeAmount) {
    setState(() {
      _favouritesBadgeAmount++;
    });
  }
}
