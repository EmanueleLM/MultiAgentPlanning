(define (problem schedule_meeting_for_monday)
  (:domain meeting_scheduling)

  (:objects
    andrew grace samuel - participant
    t1_0900 t2_0930 t3_1000 t4_1030 t5_1100
    t6_1130 t7_1200 t8_1230 t9_1300 t10_1330
    t11_1400 t12_1430 t13_1500 t14_1530 t15_1600
    t16_1630 - time_slot
  )

  (:init
    (available andrew t1_0900) (available andrew t2_0930)
    (available andrew t3_1000) (available andrew t4_1030)
    (available andrew t5_1100) (available andrew t6_1130)
    (available andrew t7_1200) (available andrew t8_1230)
    (available andrew t9_1300) (available andrew t10_1330)
    (available andrew t11_1400) (available andrew t12_1430)
    (available andrew t13_1500) (available andrew t14_1530)
    (available andrew t15_1600) (available andrew t16_1630)

    (available grace t1_0900) (available grace t2_0930)
    (available grace t3_1000) (available grace t4_1030)
    (available grace t5_1100) (available grace t6_1130)
    (available grace t7_1200) (available grace t8_1230)
    (available grace t9_1300) (available grace t10_1330)
    (available grace t11_1400) (available grace t12_1430)
    (available grace t13_1500) (available grace t14_1530)
    (available grace t15_1600) (available grace t16_1630)

    (available samuel t3_1000) (available samuel t4_1030)
    (available samuel t5_1100) (available samuel t8_1230)
    (available samuel t9_1300) (available samuel t12_1430)

    (meeting_can_start_at t1_0900)
    (meeting_can_start_at t2_0930)
    (meeting_can_start_at t5_1100)
    (meeting_can_start_at t8_1230)
    (meeting_can_start_at t9_1300)
    (meeting_can_start_at t12_1430)

    (adjacent_time_slots t1_0900 t2_0930)
    (adjacent_time_slots t2_0930 t3_1000)
    (adjacent_time_slots t3_1000 t4_1030)
    (adjacent_time_slots t4_1030 t5_1100)
    (adjacent_time_slots t5_1100 t6_1130)
    (adjacent_time_slots t6_1130 t7_1200)
    (adjacent_time_slots t7_1200 t8_1230)
    (adjacent_time_slots t8_1230 t9_1300)
    (adjacent_time_slots t9_1300 t10_1330)
    (adjacent_time_slots t10_1330 t11_1400)
    (adjacent_time_slots t11_1400 t12_1430)
    (adjacent_time_slots t12_1430 t13_1500)
    (adjacent_time_slots t13_1500 t14_1530)
    (adjacent_time_slots t14_1530 t15_1600)
    (adjacent_time_slots t15_1600 t16_1630)
  )

  (:goal
    (exists (?t1 - time_slot ?t2 - time_slot)
      (and
        (scheduled andrew ?t1)
        (scheduled andrew ?t2)
        (scheduled grace ?t1)
        (scheduled grace ?t2)
        (scheduled samuel ?t1)
        (scheduled samuel ?t2)
        (adjacent_time_slots ?t1 ?t2)
      )
    )
  )
)