(define (problem meeting_planning_example11-problem)
  (:domain meeting_planning_example11)

  (:objects
    nobhill sunset_district - location
    t0900 t1335 t1400 t1515 t2030 - timepoint
  )

  (:init
    ;; Traveler arrives at Nob Hill at 09:00.
    (at nobhill t0900)

    ;; Waiting option to advance from arrival to the planned travel departure at 13:35.
    (wait_leg nobhill t0900 t1335)

    ;; Travel times (discrete legs). Nob Hill -> Sunset District takes 25 minutes: modeled as 13:35 -> 14:00.
    (travel_leg nobhill sunset_district t1335 t1400)

    ;; Carol's publicly stated presence. She is at Sunset District from 14:00 to 20:30.
    ;; Provide endpoints used by meeting windows; additional intermediate timepoints can be added if needed.
    (carol_present t1400)
    (carol_present t1515)
    (carol_present t2030)

    ;; Explicit meeting window encoding a single continuous 75-minute slot:
    ;; 14:00 (t1400) -> 15:15 (t1515) is 75 minutes and lies within Carol's availability.
    (meet_window sunset_district t1400 t1515)
  )

  ;; Hard requirement: meet Carol for at least the specified continuous 75-minute window.
  (:goal (met_carol))
)