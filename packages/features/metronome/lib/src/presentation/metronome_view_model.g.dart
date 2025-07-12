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
    extends $NotifierProvider<MetronomeViewModel, MetronomeScreenState> {
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
  Override overrideWithValue(MetronomeScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MetronomeScreenState>(value),
    );
  }
}

String _$metronomeViewModelHash() =>
    r'f8b4877cb86fc3a93f4e2f33cef91e3b058e8fc4';

abstract class _$MetronomeViewModel extends $Notifier<MetronomeScreenState> {
  MetronomeScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MetronomeScreenState, MetronomeScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MetronomeScreenState, MetronomeScreenState>,
              MetronomeScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
