(define (problem san_francisco_day_meeting_john_instance)
  (:domain san_francisco_day_meeting_john)

  (:objects
    russian_hill golden_gate_park - location
    t_0900 t_0920 t_0940 t_1000 t_1020 t_1040 t_1100 t_1120 t_1140 t_1200 t_1220 t_1240 t_1241 t_1300 - time
  )

  (:init
    (at russian_hill)
    (current_time t_0900)

    (person_at john golden_gate_park)

    (progress_0 john)

    (wait_edge t_0900 t_0920)
    (wait_edge t_0920 t_0940)
    (wait_edge t_0940 t_1000)
    (wait_edge t_1000 t_1020)
    (wait_edge t_1020 t_1040)
    (wait_edge t_1040 t_1100)
    (wait_edge t_1100 t_1120)
    (wait_edge t_1120 t_1140)
    (wait_edge t_1140 t_1200)
    (wait_edge t_1200 t_1220)
    (wait_edge t_1220 t_1240)
    (wait_edge t_1240 t_1300)
    (wait_edge t_1241 t_1300)

    (travel_edge russian_hill golden_gate_park t_1220 t_1241)

    (available_start john t_1300)
  )

  (:goal
    (and
      (met_minimum john)
    )
  )
)