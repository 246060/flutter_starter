# flutter_starter

flutter quick starter for new project

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Before Start 
run command on project root path
```shell
flutter pub run build_runner [build|watch] --delete-conflicting-outputs
```
#### [Built-in Commands](https://pub.dev/packages/build_runner)
The build_runner package exposes a binary by the same name, which can be invoked 
using dart run build_runner <command>.

The available commands are build, watch, serve, and test.

- build: Runs a single build and exits.
- watch: Runs a persistent build server that watches the files system for edits and does rebuilds as necessary.
- serve: Same as watch, but runs a development server as well.
By default this serves the web and test directories, on port 8080 and 8081 respectively. See below for how to configure this.
test: Runs a single build, creates a merged output directory, and then runs dart run test --precompiled <merged-output-dir>. See below for instructions on passing custom args to the test command.




## 변경
- dio log interceptor
  - 기본 print 인데 app에서 사용하는 logger를 넘겨주면 로그가 보기 어렵게 나온다. 
  그래서 성능 및 보기 쉽게 나오게 커스텀 함.


## Tip

1. [JSON to Dart](https://javiercbk.github.io/json_to_dart/)
2. [Lint](https://dart-lang.github.io/linter/lints/index.html)
   1. Other known linters use:
      1. [Core](https://pub.dev/packages/lints)
      2. [Recommended](https://pub.dev/packages/lints)
      3. [Flutter Lints](https://pub.dev/packages/flutter_lints)
      4. [Pedantic](https://pub.dev/packages/pedantic)
      5. [Effective Dart](https://pub.dev/packages/effective_dart)
      6. [Flutter repo](https://github.com/flutter/flutter/blob/master/analysis_options.yaml)
      7. [Lint](https://pub.dev/packages/lint)
      8. [VG Analysis](https://pub.dev/packages/very_good_analysis)
      9. [RydMike](https://gist.github.com/rydmike/fdb53ddd933c37d20e6f3188a936cd4c)
