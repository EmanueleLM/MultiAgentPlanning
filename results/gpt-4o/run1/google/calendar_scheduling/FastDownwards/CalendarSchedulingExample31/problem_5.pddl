(define (problem schedule_meeting_problem)
  (:domain meeting_planning)
  (:objects
    richard martha kimberly - participant
    t9_0_9_30 t9_30_10 t10_0_10_30 t10_30_11 t11_0_11_30 t11_30_12 
    t12_0_12_30 t12_30_13 t13_0_13_30 t13_30_14 t14_0_14_30 t14_30_15 
    t15_0_15_30 t15_30_16 - time_slot
  )
  (:init
    (busy richard t13_30_14)
    (busy richard t15_0_15_30)
    (busy martha t9_0_9_30)
    (busy martha t13_0_13_30)
    (busy kimberly t9_0_9_30)
    (busy kimberly t9_30_10)
    (busy kimberly t10_0_10_30)
    (busy kimberly t10_30_11)
    (busy kimberly t11_0_11_30)
    (busy kimberly t11_30_12)
    (busy kimberly t12_0_12_30)
    (busy kimberly t12_30_13)
    (busy kimberly t14_0_14_30)
    (busy kimberly t14_30_15)
    (busy kimberly t15_0_15_30)
    (busy kimberly t15_30_16)
    (preferred_after_14 martha)
    (after_or_equal_14 t14_0_14_30)
    (after_or_equal_14 t14_30_15)
    (after_or_equal_14 t15_0_15_30)
    (after_or_equal_14 t15_30_16)
  )
  (:goal
    (exists (?t - time_slot) (scheduled ?t))
  )
)