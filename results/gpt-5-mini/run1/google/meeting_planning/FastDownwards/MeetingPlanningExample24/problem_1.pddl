(define (problem meet-matthew-final)
  (:domain meet-matthew-scheduling)

  (:objects
    you matthew - person
    nobhill presidio - location
    t0 t103 t120 t135 t150 t153 t163 t168 t180 t240 t258 t283 t300 t315 t328 t333 t345 t375 t393 - timepoint
  )

  (:init
    (at you nobhill t0)
    (matt_available t120 t150)
    (matt_available t180 t240)
    (matt_available t345 t375)
    (matt_available t120 t375)
    (= (total-cost) 0)
  )

  (:goal (and
    (met_matt)
    (plan-chosen)
  ))

  (:metric minimize (total-cost))
)