import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:greenglide/constants/apikeys.dart';

// Create an instance of ClientOptions with Ably key
final clientOptions = ably.ClientOptions(key: APIKeys.ablyKey);

// Use ClientOptions to create Realtime or REST instance
ably.Realtime realtime = ably.Realtime(options: clientOptions);
ably.Rest rest = ably.Rest(options: clientOptions);