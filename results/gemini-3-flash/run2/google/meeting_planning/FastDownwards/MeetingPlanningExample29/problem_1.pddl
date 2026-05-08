(define (problem meet_nancy_sf)
  (:domain meeting_planning)
  (:objects
    sunset_district haight_ashbury - location
    t0 t1 t2_pre t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 - time
    count_0 count_1 count_2 count_3 count_4 count_5 - count
  )
  (:init
    (at sunset_district)
    (current_time t0)
    (meeting_progress count_0)

    (can_move sunset_district haight_ashbury)
    (can_move haight_ashbury sunset_district)

    (next t0 t1)
    (is_15_minutes t0 t1)

    (next t1 t2_pre)

    (next t2_pre t2)
    (is_15_minutes t2_pre t2)

    (next t2 t3)
    (is_15_minutes t2 t3)
    (nancy_during haight_ashbury t2 t3)

    (next t3 t4)
    (is_15_minutes t3 t4)
    (nancy_during haight_ashbury t3 t4)

    (next t4 t5)
    (is_15_minutes t4 t5)
    (nancy_during haight_ashbury t4 t5)

    (next t5 t6)
    (is_15_minutes t5 t6)
    (nancy_during haight_ashbury t5 t6)

    (next t6 t7)
    (is_15_minutes t6 t7)
    (nancy_during haight_ashbury t6 t7)

    (next t7 t8)
    (is_15_minutes t7 t8)
    (nancy_during haight_ashbury t7 t8)

    (next t8 t9)
    (is_15_minutes t8 t9)
    (nancy_during haight_ashbury t8 t9)

    (next t9 t10)
    (is_15_minutes t9 t10)
    (nancy_during haight_ashbury t9 t10)

    (next t10 t11)
    (is_15_minutes t10 t11)
    (nancy_during haight_ashbury t10 t11)

    (next_count count_0 count_1)
    (next_count count_1 count_2)
    (next_count count_2 count_3)
    (next_count count_3 count_4)
    (next_count count_4 count_5)
  )
  (:goal
    (meeting_progress count_5)
  )
)