(define (problem meeting_planning_example_17)
  (:domain meeting_planning)
  (:objects
    alamo_square sunset_district - location
    t0900 t0916 t1314 t1330 t1345 t1402 t1430 t1447 - time
    matthew - person
  )
  (:init
    ;; Starting state: Arrive at Alamo Square at 9:00 AM
    (at alamo_square)
    (current_time t0900)

    ;; Temporal adjacency sequence
    (next t0900 t0916)
    (next t0916 t1314)
    (next t1314 t1330)
    (next t1330 t1345)
    (next t1345 t1402)
    (next t1402 t1430)
    (next t1430 t1447)

    ;; Travel connectivity and durations
    ;; Alamo Square to Sunset District: 16 mins
    (can_travel alamo_square sunset_district t0900 t0916)
    (can_travel alamo_square sunset_district t1314 t1330)

    ;; Sunset District to Alamo Square: 17 mins
    (can_travel sunset_district alamo_square t1345 t1402)
    (can_travel sunset_district alamo_square t1430 t1447)

    ;; Matthew presence and meeting feasibility
    ;; Matthew is at Sunset District from 1:30 PM (13:30) to 2:30 PM (14:30).
    ;; Meeting duration must be at least 15 minutes.
    (can_meet matthew sunset_district t1330 t1345)
    (can_meet matthew sunset_district t1345 t1430)
    (can_meet matthew sunset_district t1330 t1430)
  )
  (:goal (met matthew))
)