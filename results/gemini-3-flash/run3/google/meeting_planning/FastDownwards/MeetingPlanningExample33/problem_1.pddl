(define (problem meeting_planning_example_33)
  (:domain meeting_planning)
  
  (:objects
    sunset_district union_square - location
    t0900 t0930 t1230 t1245 - time
    sarah - person
  )

  (:init
    ;; Starting conditions
    (at sunset_district)
    (current_time t0900)

    ;; Travel time from Sunset District to Union Square is 30 minutes
    (can_travel sunset_district union_square t0900 t0930)

    ;; Waiting from arrival (09:30 AM) until Sarah arrives (12:30 PM)
    (can_wait t0930 t1230)

    ;; Sarah's availability at Union Square starts at 12:30 PM
    ;; Meeting Sarah for the required 15 minutes (12:30 PM to 12:45 PM)
    (can_meet sarah union_square t1230 t1245)
  )

  (:goal
    (met sarah)
  )
)