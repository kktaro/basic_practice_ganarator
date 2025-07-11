// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metronome_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// メトロノームのViewModel
@ProviderFor(MetronomeViewModel)
const metronomeViewModelProvider = MetronomeViewModelProvider._();

/// メトロノームのViewModel
final class MetronomeViewModelProvider
    extends $NotifierProvider<MetronomeViewModel, MetronomeState> {
  /// メトロノームのViewModel
  const MetronomeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'metronomeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$metronomeViewModelHash();

  @$internal
  @override
  MetronomeViewModel create() => MetronomeViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MetronomeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MetronomeState>(value),
    );
  }
}

String _$metronomeViewModelHash() =>
    r'c9eb5030ef235f8448164657e596276da0cecf78';

abstract class _$MetronomeViewModel extends $Notifier<MetronomeState> {
  MetronomeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MetronomeState, MetronomeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MetronomeState, MetronomeState>,
              MetronomeState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
