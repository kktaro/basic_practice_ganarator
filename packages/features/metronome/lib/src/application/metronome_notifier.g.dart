// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metronome_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MetronomeNotifier)
const metronomeProvider = MetronomeNotifierProvider._();

final class MetronomeNotifierProvider
    extends $AsyncNotifierProvider<MetronomeNotifier, MetronomeState> {
  const MetronomeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'metronomeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$metronomeNotifierHash();

  @$internal
  @override
  MetronomeNotifier create() => MetronomeNotifier();
}

String _$metronomeNotifierHash() => r'd5612c0dac91af84f6d66c7f7b3679723476b149';

abstract class _$MetronomeNotifier extends $AsyncNotifier<MetronomeState> {
  FutureOr<MetronomeState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<MetronomeState>, MetronomeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MetronomeState>, MetronomeState>,
              AsyncValue<MetronomeState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
