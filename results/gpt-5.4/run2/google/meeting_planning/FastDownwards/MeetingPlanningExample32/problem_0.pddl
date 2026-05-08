(define (problem meet_jeffrey_specific_instance)
  (:domain meet_jeffrey_san_francisco)

  (:objects
    the_castro golden_gate_park - place
    t_0900 t_0911 t_1056 - time
    jeffrey - friend
  )

  (:init
    (at the_castro)
    (current_time t_0900)

    (travel_link the_castro golden_gate_park t_0900 t_0911)

    (meeting_slot jeffrey golden_gate_park t_0911 t_1056)
  )

  (:goal
    (and
      (met jeffrey)
      (at golden_gate_park)
      (current_time t_1056)
    )
  )
)