(define (problem meeting_planning_example_29)
  (:domain meeting_planning)
  (:objects
    sunset_district haight_ashbury - location
    t0900 t0915 t1915 t1930 t1945 t2000 t2015 t2030 t2045 t2100 t2115 t2130 t2145 - time
    c0 c1 c2 c3 c4 c5 - count
  )

  (:init
    (at_location sunset_district)
    (current_time t0900)
    (meeting_progress_nancy c0)

    (can_travel sunset_district haight_ashbury)
    (can_travel haight_ashbury sunset_district)

    ;; Temporal adjacency
    (next_time t0900 t0915)
    (next_time t0915 t1915)
    (next_time t1915 t1930)
    (next_time t1930 t1945)
    (next_time t1945 t2000)
    (next_time t2000 t2015)
    (next_time t2015 t2030)
    (next_time t2030 t2045)
    (next_time t2045 t2100)
    (next_time t2100 t2115)
    (next_time t2115 t2130)
    (next_time t2130 t2145)

    ;; 15-minute intervals for travel and meeting
    (dist_15 t0900 t0915)
    (dist_15 t1915 t1930)
    (dist_15 t1930 t1945)
    (dist_15 t1945 t2000)
    (dist_15 t2000 t2015)
    (dist_15 t2015 t2030)
    (dist_15 t2030 t2045)
    (dist_15 t2045 t2100)
    (dist_15 t2100 t2115)
    (dist_15 t2115 t2130)
    (dist_15 t2130 t2145)

    ;; Nancy availability: 7:30 PM (19:30) to 9:45 PM (21:45)
    ;; Represents 9 intervals of 15 minutes = 135 minutes total
    (nancy_presence t1930)
    (nancy_presence t1945)
    (nancy_presence t2000)
    (nancy_presence t2015)
    (nancy_presence t2030)
    (nancy_presence t2045)
    (nancy_presence t2100)
    (nancy_presence t2115)
    (nancy_presence t2130)

    ;; Meeting progress steps (15 mins each)
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
  )

  (:goal
    (meeting_progress_nancy c5)
  )
)