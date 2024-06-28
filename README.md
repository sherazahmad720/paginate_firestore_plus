# Pagination in Firestore

This package is an updated version of the original [paginate_firestore](https://pub.dev/packages/paginate_firestore). The original package, developed by [Venkatesh Prasad](https://github.com/vedartm), is no longer being actively maintained. 

We have taken the initiative to update and enhance this package to ensure its continued functionality and compatibility with the latest versions of Firestore and its dependencies.


[![pub package](https://img.shields.io/badge/pub-v1.0.0+1-blue)](https://pub.dev/packages/paginate_firestore_plus)
[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

<p align="center">
  <img src="https://raw.githubusercontent.com/excogitatr/paginate_firestore/master/assets/screen.gif" height="500px">
</p>

## Setup

Use the same setup used for `cloud_firestore_plus` package (or follow [this](https://pub.dev/packages/cloud_firestor_pluse#setup)).

## Usage

In your pubspec.yaml

```yaml
dependencies:
  paginate_firestore_plus: # latest version
```

Import it

```dart
import 'package:paginate_firestore/paginate_firestore_plus.dart';
```

Implement it

```dart
      PaginateFirestore(
        //item builder type is compulsory.
        itemBuilder: (context, documentSnapshots, index) {
          final data = documentSnapshots[index].data() as Map?;
          return ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: data == null ? Text('Error in data') : Text(data['name']),
            subtitle: Text(documentSnapshots[index].id),
          );
        },
        // orderBy is compulsory to enable pagination
        query: FirebaseFirestore.instance.collection('users').orderBy('name'),
        //Change types accordingly
        itemBuilderType: PaginateBuilderType.listView,
        // to fetch real-time data
        isLive: true,
      ),
```

To use with listeners:

```dart
      PaginateRefreshedChangeListener refreshChangeListener = PaginateRefreshedChangeListener();

      RefreshIndicator(
        child: PaginateFirestore(
          itemBuilder: (context, documentSnapshots, index) => ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text(documentSnapshots[index].data()['name']),
            subtitle: Text(documentSnapshots[index].id),
          ),
          // orderBy is compulsary to enable pagination
          query: Firestore.instance.collection('users').orderBy('name'),
          listeners: [
            refreshChangeListener,
          ],
        ),
        onRefresh: () async {
          refreshChangeListener.refreshed = true;
        },
      )
```

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/excogitatr/paginate_firestore_plus/issues).
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/excogitatr/paginate_firestore_plus/pulls).

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Credits

All credit for the initial development of this package goes to [Venkatesh Prasad](https://github.com/vedartm) and all other contributors. Without their hard work and dedication, this updated version would not have been possible. We are deeply grateful for their contributions and hope to honor their efforts with this updated release.


