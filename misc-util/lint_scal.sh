#!/bin/bash

./tools/cpplint.py --filter=-build/header_guard,-build/include \
  src/datastructures/balancer_1random.h \
  src/datastructures/balancer_local_linearizability.h \
  src/datastructures/distributed_queue.h \
  src/datastructures/flatcombining_queue.h \
  src/datastructures/ms_queue.h \
  src/datastructures/kstack.h \
  src/datastructures/random_dequeue_queue.h \
  src/datastructures/treiber_stack.h \
  src/datastructures/unboundedsize_kfifo.h \
  src/benchmark/std_glue/glue_dq_1random_ms.cc \
  src/benchmark/std_glue/glue_fc_queue.cc \
  src/benchmark/std_glue/glue_ll_dq_ms.cc \
  src/benchmark/std_glue/glue_ll_dq_treiber.cc \
  src/benchmark/std_glue/glue_ms_queue.cc \
  src/benchmark/std_glue/glue_treiber_stack.cc \
  src/benchmark/std_glue/glue_rd_queue.cc \
  src/util/atomic_value_new.h \
  src/util/allocation.cc \
  src/util/allocation.h \
  src/util/lock.h \
  src/util/random.cc \
  src/util/random.h

exit $?
