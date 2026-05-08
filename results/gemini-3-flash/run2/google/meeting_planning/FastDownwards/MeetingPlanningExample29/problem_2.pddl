(define (problem meet_nancy_sf)
  (:domain meeting_planning)
  (:objects
    sunset_district haight_ashbury - location
    t_0900 t_0915 t_1915 t_1930 t_1945 t_2000 t_2015 t_2030 t_2045 t_2100 t_2115 t_2130 t_2145 - time
    count_0 count_1 count_2 count_3 count_4 count_5 - count
  )
  (:init
    (at sunset_district)
    (current_time t_0900)
    (meeting_count count_0)
    (connected sunset_district haight_ashbury)
    (connected haight_ashbury sunset_district)

    ;; Define 15-minute intervals for movement and meeting
    (next_time t_0900 t_0915)
    (is_15_mins t_0900 t_0915)

    ;; Idle gap until Nancy's arrival window
    (next_time t_0915 t_1915)

    ;; Incremental steps for the evening window
    (next_time t_1915 t_1930)
    (is_15_mins t_1915 t_1930)

    (next_time t_1930 t_1945)
    (is_15_mins t_1930 t_1945)
    (nancy_at haight_ashbury t_1930 t_1945)

    (next_time t_1945 t_2000)
    (is_15_mins t_1945 t_2000)
    (nancy_at haight_ashbury t_1945 t_2000)

    (next_time t_2000 t_2015)
    (is_15_mins t_2000 t_2015)
    (nancy_at haight_ashbury t_2000 t_2015)

    (next_time t_2015 t_2030)
    (is_15_mins t_2015 t_2030)
    (nancy_at haight_ashbury t_2015 t_2030)

    (next_time t_2030 t_2045)
    (is_15_mins t_2030 t_2045)
    (nancy_at haight_ashbury t_2030 t_2045)

    (next_time t_2045 t_2100)
    (is_15_mins t_2045 t_2100)
    (nancy_at haight_ashbury t_2045 t_2100)

    (next_time t_2100 t_2115)
    (is_15_mins t_2100 t_2115)
    (nancy_at haight_ashbury t_2100 t_2115)

    (next_time t_2115 t_2130)
    (is_15_mins t_2115 t_2130)
    (nancy_at haight_ashbury t_2115 t_2130)

    (next_time t_2130 t_2145)
    (is_15_mins t_2130 t_2145)
    (nancy_at haight_ashbury t_2130 t_2145)

    ;; Meeting counts for 75 minutes total (5 * 15m)
    (next_count count_0 count_1)
    (next_count count_1 count_2)
    (next_count count_2 count_3)
    (next_count count_3 count_4)
    (next_count count_4 count_5)
  )
  (:goal (meeting_count count_5))
)