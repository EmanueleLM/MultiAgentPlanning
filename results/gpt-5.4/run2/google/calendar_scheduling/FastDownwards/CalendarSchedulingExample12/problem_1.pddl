(define (problem schedule_meeting_monday_instance)
  (:domain schedule_meeting_monday)

  (:objects
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30
    t_17_00 - timepoint

    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 - start_time
  )

  (:init
    (next_time t_09_00 t_09_30)
    (next_time t_09_30 t_10_00)
    (next_time t_10_00 t_10_30)
    (next_time t_10_30 t_11_00)
    (next_time t_11_00 t_11_30)
    (next_time t_11_30 t_12_00)
    (next_time t_12_00 t_12_30)
    (next_time t_12_30 t_13_00)
    (next_time t_13_00 t_13_30)
    (next_time t_13_30 t_14_00)
    (next_time t_14_00 t_14_30)
    (next_time t_14_30 t_15_00)
    (next_time t_15_00 t_15_30)
    (next_time t_15_30 t_16_00)
    (next_time t_16_00 t_16_30)
    (next_time t_16_30 t_17_00)

    (start_first s_09_00 t_09_00)
    (start_second s_09_00 t_09_30)

    (start_first s_09_30 t_09_30)
    (start_second s_09_30 t_10_00)

    (start_first s_10_00 t_10_00)
    (start_second s_10_00 t_10_30)

    (start_first s_10_30 t_10_30)
    (start_second s_10_30 t_11_00)

    (start_first s_11_00 t_11_00)
    (start_second s_11_00 t_11_30)

    (start_first s_11_30 t_11_30)
    (start_second s_11_30 t_12_00)

    (start_first s_12_00 t_12_00)
    (start_second s_12_00 t_12_30)

    (start_first s_12_30 t_12_30)
    (start_second s_12_30 t_13_00)

    (start_first s_13_00 t_13_00)
    (start_second s_13_00 t_13_30)

    (start_first s_13_30 t_13_30)
    (start_second s_13_30 t_14_00)

    (start_first s_14_00 t_14_00)
    (start_second s_14_00 t_14_30)

    (start_first s_14_30 t_14_30)
    (start_second s_14_30 t_15_00)

    (start_first s_15_00 t_15_00)
    (start_second s_15_00 t_15_30)

    (start_first s_15_30 t_15_30)
    (start_second s_15_30 t_16_00)

    (start_first s_16_00 t_16_00)
    (start_second s_16_00 t_16_30)

    (busy debra t_09_30 t_10_00)
    (busy debra t_11_00 t_11_30)
    (busy debra t_12_00 t_12_30)
    (busy debra t_12_30 t_13_00)
    (busy debra t_14_00 t_14_30)
    (busy debra t_16_00 t_16_30)

    (busy kevin t_09_00 t_09_30)
    (busy kevin t_09_30 t_10_00)
    (busy kevin t_10_00 t_10_30)
    (busy kevin t_10_30 t_11_00)
    (busy kevin t_11_00 t_11_30)
    (busy kevin t_11_30 t_12_00)
    (busy kevin t_14_00 t_14_30)
    (busy kevin t_14_30 t_15_00)
    (busy kevin t_15_00 t_15_30)
    (busy kevin t_15_30 t_16_00)
    (busy kevin t_16_00 t_16_30)
    (busy kevin t_16_30 t_17_00)
  )

  (:goal
    (and
      (meeting_scheduled)
      (scheduled s_13_00)
    )
  )
)