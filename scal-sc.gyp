{
  'includes': [
    'common-sc.gypi',
  ],
  'targets': [
    {
      'target_name': 'libscal',
      'type': 'static_library',
      'sources': [
        'src/util/atomic_value128.h',
        'src/util/atomic_value64_base.h',
        'src/util/atomic_value64_no_offset.h',
        'src/util/atomic_value64_offset.h',
        'src/util/atomic_value.h',
        'src/util/atomic_value_new.h',
        'src/util/allocation.h',
        'src/util/allocation.cc',
        'src/util/barrier.h',
        'src/util/bitmap.h',
        'src/util/malloc-compat.h',
        'src/util/operation_logger.h',
        'src/util/platform.h',
        'src/util/random.h',
        'src/util/random.cc',
        'src/util/threadlocals.h',
        'src/util/threadlocals.cc',
        'src/util/time.h',
        'src/util/workloads.h',
        'src/util/workloads.cc',
      ],
    },
    {
      'target_name': 'prodcon-base',
      'type': 'static_library',
      'libraries': [ '<@(default_libraries)' ],
      'sources': [
        'src/benchmark/common.h',
        'src/benchmark/common.cc',
        'src/util/allocation.h',
        'src/util/allocation.cc',
        'src/util/threadlocals.h',
        'src/util/threadlocals.cc',
        'src/util/workloads.h',
        'src/util/workloads.cc',
        'src/benchmark/prodcon/prodcon.cc',
      ],
    },
    {
      'target_name': 'prodcon-ms',
      'type': 'executable',
      'libraries': [ '<@(default_libraries)' ],
      'dependencies': [
        'libscal',
        'prodcon-base',
        'glue-sc.gypi:ms',
      ],
    },
    {
      'target_name': 'prodcon-ll-dds-ms',
      'type': 'executable',
      'libraries': [ '<@(default_libraries)' ],
      'dependencies': [
        'libscal',
        'prodcon-base',
        'glue-sc.gypi:ll-dds-ms',
      ],
    },
    {
      'target_name': 'prodcon-sc-disconn-ms',
      'type': 'executable',
      'libraries': [ '<@(default_libraries)' ],
      'dependencies': [
        'libscal',
	'prodcon-base',
        'glue-sc.gypi:sc-disconn-ms',
      ],
    }
  ]
}
