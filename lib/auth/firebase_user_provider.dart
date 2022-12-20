import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DigitalFactoryFirebaseUser {
  DigitalFactoryFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

DigitalFactoryFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DigitalFactoryFirebaseUser> digitalFactoryFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<DigitalFactoryFirebaseUser>(
      (user) {
        currentUser = DigitalFactoryFirebaseUser(user);
        return currentUser!;
      },
    );
