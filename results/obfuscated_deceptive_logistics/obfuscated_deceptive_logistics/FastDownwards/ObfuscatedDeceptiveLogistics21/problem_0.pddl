(define (problem make_next_relations)
  (:domain multi_next)
  (:objects
    object_5 object_7 object_11 object_12 - object
  )

  ;; No initial "next" relations are assumed (only publicly shared facts are included).
  (:init
    ;; (no next facts)
  )

  ;; Goals: attempt to establish the three requested next relations.
  (:goal (and
    (next object_12 object_11)
    (next object_11 object_7)
    (next object_12 object_5)
  ))
)