(define (problem sequence-problem)
  (:domain sequence-domain)
  (:objects
    object_5 object_6 object_8 object_9 object_10 object_11 object_12 - obj
  )

  (:init
    ;; No adjacency relations hold initially. (All next facts are absent.)
    ;; The planner may use the establish-next action to create exactly the required adjacencies.
  )

  (:goal
    (and
      (next object_10 object_8)
      (next object_11 object_6)
      (next object_12 object_8)
      (next object_9 object_5)
    )
  )
)