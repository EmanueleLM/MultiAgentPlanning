(define (problem meeting_planning_example_45_problem)
  (:domain meeting_planning_example_45)
  (:objects
    north_beach alamo_square - location
    t0900 t0916 t1930 t1945 - timepoint
  )
  (:init
    ;; Starting state: at North Beach at 9:00 AM
    (at north_beach)
    (current_time t0900)

    ;; Travel connectivity: North Beach to Alamo Square takes 16 minutes.
    ;; Arrive at Alamo Square at 9:16 AM.
    (can_travel north_beach alamo_square t0900 t0916)

    ;; Waiting: The traveler can wait at Alamo Square from 9:16 AM until Emily arrives at 7:30 PM (19:30).
    (next t0916 t1930)

    ;; Emily's Schedule: Emily is at Alamo Square from 7:30 PM to 9:00 PM.
    ;; The required meeting duration is 15 minutes.
    ;; A meeting can occur starting at 7:30 PM (t1930) and ending at 7:45 PM (t1945).
    (meeting_at alamo_square t1930 t1945)
  )
  (:goal
    (met_emily)
  )
)