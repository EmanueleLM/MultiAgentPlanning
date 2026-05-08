(define (problem meeting_planning_example_31)
  (:domain meeting_planning)
  (:objects
    nob_hill alamo_square - location
    t0900 t0911 t0926 - timepoint
    anthony - friend
  )
  (:init
    ;; Starting state: arrive at Nob Hill at 9:00 AM
    (at nob_hill)
    (time_at t0900)

    ;; Travel constraint: Nob Hill to Alamo Square takes 11 minutes
    ;; 9:00 AM (t0900) + 11 mins = 9:11 AM (t0911)
    (travel_possible nob_hill alamo_square t0900 t0911)

    ;; Meeting constraint: Anthony at Alamo Square from 7:15 AM to 1:00 PM
    ;; 15-minute meeting requirement: 9:11 AM (t0911) + 15 mins = 9:26 AM (t0926)
    ;; 9:26 AM is before 1:00 PM, so this meeting is feasible.
    (meeting_possible anthony alamo_square t0911 t0926)
  )
  (:goal
    (and
      (met anthony)
    )
  )
)