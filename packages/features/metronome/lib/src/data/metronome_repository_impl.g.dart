// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metronome_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MetronomeRepository)
const metronomeRepositoryProvider = MetronomeRepositoryProvider._();

final class MetronomeRepositoryProvider
    extends $NotifierProvider<MetronomeRepository, IMetronomeRepository> {
  const MetronomeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'metronomeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$metronomeRepositoryHash();

  @$internal
  @override
  MetronomeRepository create() => MetronomeRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IMetronomeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IMetronomeRepository>(value),
    );
  }
}

String _$metronomeRepositoryHash() =>
    r'675ba4625302b45208fbf066c5ed2e7c45534bb3';

abstract class _$MetronomeRepository extends $Notifier<IMetronomeRepository> {
  IMetronomeRepository build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<IMetronomeRepository, IMetronomeRepository>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<IMetronomeRepository, IMetronomeRepository>,
              IMetronomeRepository,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
