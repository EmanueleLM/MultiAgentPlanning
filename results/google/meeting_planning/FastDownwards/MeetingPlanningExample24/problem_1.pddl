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

    (travel-slot t0 t17)
    (travel-slot t103 t120)

    (meet-slot t120 t150)

    (available-slot t120 t150)

    (= (total-cost) 0)
  )

  (:goal (met-you-matthew))

  (:metric minimize (total-cost))
)