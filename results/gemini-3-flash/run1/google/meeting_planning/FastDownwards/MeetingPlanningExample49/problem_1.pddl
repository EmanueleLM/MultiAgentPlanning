(define (problem meeting_planning_example_49)
  (:domain meeting_planning)
  (:objects
    richmond_district bayview - location
    t0900 t1415 t1500 t1730 - time
    sarah - person
  )

  (:init
    ;; Starting state
    (at_location richmond_district)
    (at_time t0900)

    ;; Temporal topology (wait steps)
    (next t0900 t1415)
    (next t1415 t1500)
    (next t1500 t1730)

    ;; Travel possibilities (Richmond to Bayview: 26 mins)
    ;; 9:00 to 14:15 is 315 mins (315 >= 26)
    (can_travel richmond_district bayview t0900 t1415)
    ;; 9:00 to 15:00 is 360 mins (360 >= 26)
    (can_travel richmond_district bayview t0900 t1500)
    ;; 9:00 to 17:30 is 510 mins (510 >= 26)
    (can_travel richmond_district bayview t0900 t1730)
    ;; 14:15 to 15:00 is 45 mins (45 >= 26)
    (can_travel richmond_district bayview t1415 t1500)
    ;; 14:15 to 17:30 is 195 mins (195 >= 26)
    (can_travel richmond_district bayview t1415 t1730)
    ;; 15:00 to 17:30 is 150 mins (150 >= 26)
    (can_travel richmond_district bayview t1500 t1730)

    ;; Travel possibilities (Bayview to Richmond: 25 mins)
    (can_travel bayview richmond_district t1415 t1500)
    (can_travel bayview richmond_district t1415 t1730)
    (can_travel bayview richmond_district t1500 t1730)

    ;; Meeting possibilities for Sarah at Bayview (Window: 14:15 to 17:30, Min duration: 45)
    ;; 14:15 to 15:00 is exactly 45 mins
    (can_meet sarah bayview t1415 t1500)
    ;; 15:00 to 17:30 is 150 mins
    (can_meet sarah bayview t1500 t1730)
    ;; 14:15 to 17:30 is 195 mins
    (can_meet sarah bayview t1415 t1730)
  )

  (:goal
    (and
      (met sarah)
    )
  )
)