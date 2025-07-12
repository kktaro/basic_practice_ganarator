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
    extends $AsyncNotifierProvider<MetronomeViewModel, MetronomeScreenState> {
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
}

String _$metronomeViewModelHash() =>
    r'0502ef935b57deddce0684354b6f3f29f6bc044a';

abstract class _$MetronomeViewModel
    extends $AsyncNotifier<MetronomeScreenState> {
  FutureOr<MetronomeScreenState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<MetronomeScreenState>, MetronomeScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<MetronomeScreenState>,
                MetronomeScreenState
              >,
              AsyncValue<MetronomeScreenState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
