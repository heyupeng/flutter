import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
 * Widget build(BuildContext context) {
 *   return MaterialApp(
 *     home: const MyHomePage(title: 'Home'),
 *     navigatorObservers: [NavRouteServer.server(context)],
 *   );  
 */

// ignore: camel_case_types
class CTM_MaterialPageRoute<T> extends MaterialPageRoute<T> {
  CTM_MaterialPageRoute({required super.builder, super.settings});
  bool disableSwipePop = false;
  @override
  
  bool get hasScopedWillPopCallback {
    return disableSwipePop || super.hasScopedWillPopCallback;
  }
  
  static void disablePopGesture(Route? route, bool disable) {
    if (route is CTM_MaterialPageRoute) {
      route.disableSwipePop = disable;
    }
  }
}

class CTM_CupertinoPageRoute<T> extends CupertinoPageRoute<T> {
  CTM_CupertinoPageRoute({required super.builder, super.settings});
  bool disableSwipePop = false;
  @override
  
  bool get hasScopedWillPopCallback {
    
    return disableSwipePop || super.hasScopedWillPopCallback;
  }
  
  static void disablePopGesture(Route? route, bool disable) {
    if (route is CTM_CupertinoPageRoute) {;
      route.disableSwipePop = disable;
    }
  }
}

class NavRouteServer extends NavigatorObserver {
  static NavRouteServer shared = NavRouteServer();

  static NavRouteServer server(BuildContext context) {
    var route = ModalRoute.of(context);
    final NavRouteServer s = NavRouteServer();
    s._parentRoute = route;
    return s;
  }

  final List<Route> _routes = [];
  
  /* parent route */
  Route? _parentRoute;
  Route? get parentRoute => _parentRoute;

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    log('did pop from ${route.settings.name} to ${previousRoute?.settings.name}');
    _routes.removeLast();
    if (previousRoute != null && previousRoute.isFirst) {
      CTM_MaterialPageRoute.disablePopGesture(parentRoute, false);
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    var navigator = route.navigator;
    if (navigator != null) {
      // log('${navigator.widget} ${navigator.context.widget.key}');  
    }
    
    // log('${previousRoute?.runtimeType} is ${previousRoute?.isFirst == true ? '': 'not '}First.');
    // log('${route.runtimeType} is ${route.isFirst == true ? '': 'not '}First.');
    log('did push form ${previousRoute?.settings.name} to ${route.settings.name}');

    _routes.add(route);
    
    if (previousRoute != null && previousRoute.isFirst) {
      CTM_MaterialPageRoute.disablePopGesture(parentRoute, true);      
    }
  }

  /// The [Navigator] removed `route`.
  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    log('did remove ${route.settings.name} from ${previousRoute?.settings.name}');
  }
  
  /// The [Navigator] replaced `oldRoute` with `newRoute`.
  @override
  void didReplace({ Route<dynamic>? newRoute, Route<dynamic>? oldRoute }) { 
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    log('did replace ${newRoute?.settings.name} from ${oldRoute?.settings.name}');
  }

  /// The [Navigator]'s routes are being moved by a user gesture.
  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    log('did start UserGesture ${route.settings.name} from ${previousRoute?.settings.name}');
   }

  /// User gesture is no longer controlling the [Navigator].
  ///
  /// Paired with an earlier call to [didStartUserGesture].
  @override
  void didStopUserGesture() {
    log('did stop UserGesture.');
   }
}
