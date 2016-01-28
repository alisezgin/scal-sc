{
  'includes': [
    'common-sc.gypi',
  ],
  'targets': [
    {
      'target_name': 'ms',
      'type': 'static_library',
      'sources': [
        'src/benchmark/std_glue/glue_ms_queue.cc'
      ],
    },
    {
      'target_name': 'll-dds-ms',
      'type': 'static_library',
      'defines': [ 'GET_TRY_LOCAL_FIRST' ],
      'sources': [
        'src/benchmark/std_glue/glue_ll_dds_ms.cc'
      ],
    },
    {
      'target_name': 'sc-disconn-ms',
      'type': 'static_library',
      'defines': [ 'GET_TRY_LOCAL_FIRST' ],
      'sources': [
        'src/benchmark/std_glue/glue_sc_disconn_ms.cc'
      ],
    }
  ]
}
