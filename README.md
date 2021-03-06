# Famedly Matrix SDK

Matrix SDK for the famedly talk app written in dart.

## Native libraries

For E2EE, libolm must be provided (see https://pub.dev/packages/olm#using-dart-olm).
Additionally, OpenSSL (libcrypto) must be provided on native platforms for E2EE.

## API

The API is documented here: [famedly.gitlab.io/famedlysdk/](https://famedly.gitlab.io/famedlysdk/)

## How to use this

1. Import the sdk

```yaml
  famedlysdk:
    git:
      url: https://gitlab.com/famedly/famedlysdk.git
```

```dart
import 'package:flutter/material.dart';
import 'package:famedlysdk/famedlysdk.dart';
```

2. Create a new client:

```dart
Client client = Client("HappyChat");
```

Take a look here for an example store:
[https://gitlab.com/ChristianPauly/fluffychat-flutter/snippets](https://gitlab.com/ChristianPauly/fluffychat-flutter/snippets)

3. Connect to a Matrix Homeserver and listen to the streams:

```dart
client.onLoginStateChanged.stream.listen((bool loginState){ 
  print("LoginState: ${loginState.toString()}");
});

client.onEvent.stream.listen((EventUpdate eventUpdate){ 
  print("New event update!");
});

client.onRoomUpdate.stream.listen((RoomUpdate eventUpdate){ 
  print("New room update!");
});

try {
  await client.checkHomeserver("https://yourhomeserver.abc");
  await client.login("username", "password");
}
catch(e) {
  print('No luck...');
}
```

4. Send a message to a Room:

```dart
await client.getRoomById('your_room_id').sendTextEvent('Hello world');
```
