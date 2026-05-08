(define (problem link-objects-goal)
  (:domain linking-with-provenance)
  (:objects
    object_11 object_7 object_12 object_5 - obj
  )

  (:init
    ; Explicit distinctness facts (no self-links allowed). For 4 objects, enumerate all ordered distinct pairs.
    (distinct object_11 object_7)
    (distinct object_11 object_12)
    (distinct object_11 object_5)

    (distinct object_7 object_11)
    (distinct object_7 object_12)
    (distinct object_7 object_5)

    (distinct object_12 object_11)
    (distinct object_12 object_7)
    (distinct object_12 object_5)

    (distinct object_5 object_11)
    (distinct object_5 object_7)
    (distinct object_5 object_12)

    ; No (next ...) facts are true initially; they will be established by agent actions.
  )

  (:goal (and
           (next object_11 object_7)
           (next object_12 object_5)
         ))
)