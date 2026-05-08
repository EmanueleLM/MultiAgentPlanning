(define (problem meeting_planning_example_31_prob)
  (:domain meeting_planning_example_31)
  (:objects
    nob_hill alamo_square - location
    t0900 t0911 t0926 - time
    anthony - person
  )

  (:init
    ;; Current state at arrival
    (at_location nob_hill)
    (at_time t0900)

    ;; Travel structure
    ;; Nob Hill to Alamo Square (11 minutes): 09:00 -> 09:11
    (travel_possible nob_hill alamo_square t0900 t0911)

    ;; Meeting structure
    ;; Anthony is at Alamo Square from 7:15 AM to 1:00 PM.
    ;; A meeting starting at 9:11 AM for 15 minutes ends at 9:26 AM.
    ;; Both 9:11 and 9:26 are within Anthony's 7:15-13:00 window.
    (meeting_possible anthony alamo_square t0911 t0926)
  )

  (:goal
    (and
      (met anthony)
    )
  )
)