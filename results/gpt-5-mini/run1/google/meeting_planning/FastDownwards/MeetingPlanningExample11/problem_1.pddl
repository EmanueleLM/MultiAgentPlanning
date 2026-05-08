(define (problem meeting_planning_example11-problem)
  (:domain meeting_planning_example11)

  (:objects
    nobhill sunset - location
    ;; symbolically represent the critical timepoints used in the plan:
    ;; t0900  = 09:00 (start at Nob Hill)
    ;; t1335  = 13:35 (departure time chosen so that travel 25min -> arrival 14:00)
    ;; t1400  = 14:00 (Carol begins availability; meeting may start here)
    ;; t1515  = 15:15 (14:00 + 75min meeting end)
    ;; t2030  = 20:30 (Carol's end of availability, kept as reference)
    t0900 t1335 t1400 t1515 t2030 - timepoint
  )

  (:init
    ;; Traveler initial location at start time 09:00.
    (at nobhill t0900)

    ;; We also assert traveler is at Nob Hill at the chosen departure time
    ;; to make the concrete travel operator applicable.
    (at nobhill t1335)

    ;; Carol's availability window (symbolic): she is present at 14:00 and at 15:15.
    ;; These two timepoints bracket the required continuous meeting interval (14:00-15:15).
    (carol_present t1400)
    (carol_present t1515)
    (carol_present t2030)
  )

  ;; Hard goal: ensure the traveler meets Carol for the required continuous window.
  (:goal (met_carol))
)