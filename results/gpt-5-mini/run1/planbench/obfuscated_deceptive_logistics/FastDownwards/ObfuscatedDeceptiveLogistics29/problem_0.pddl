(define (problem orchestrated_problem)
  (:domain orchestrated_domain)

  (:objects
    object_6 object_7 object_10 object_11 object_12 object_13 object_14 - item
  )

  (:init
    ; No 'next' links exist initially. Bookkeeping flags absent to allow construction by actions.
  )

  (:goal (and
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_10)
    (next object_14 object_7)
  ))
)