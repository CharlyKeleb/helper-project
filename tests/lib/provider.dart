import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tests/network.dart';

var jokeProvider =
    FutureProvider.family((ref, String type) => NetworkRequest.getJoke(type));
