(define (problem meet-matthew-scheduling)
  (:domain multi-agent-meetings)

  (:objects
    you matthew - agent
    nobhill presidio - location
    t0 t17 t103 t120 t150 t375 - timepoint
  )

  (:init
    (at you nobhill)
    (at matthew presidio)
    (now t0)

    (travel_slot t0 t17)
    (travel_slot t103 t120)

    (meet_slot t120 t150)

    (available_slot t120 t150)
  )

  (:goal (met_you_matthew))
)