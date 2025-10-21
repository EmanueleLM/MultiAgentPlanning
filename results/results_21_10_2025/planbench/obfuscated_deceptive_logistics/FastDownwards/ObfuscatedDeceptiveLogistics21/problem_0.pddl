(define (problem link-goals)
  (:domain linking)
  (:objects
    object_5 object_7 object_11 object_12 - object
  )
  (:init
    ;; No initial 'next' facts are assumed so the planner must apply actions
    ;; to establish the required next relationships.
  )
  (:goal (and
    (next object_12 object_11)
    (next object_11 object_7)
    (next object_12 object_5)
  ))
)