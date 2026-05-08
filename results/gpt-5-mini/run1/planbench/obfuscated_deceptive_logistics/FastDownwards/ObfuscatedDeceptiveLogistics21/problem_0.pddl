(define (problem sequence-problem)
  (:domain object-sequencing)

  (:objects
    object_1 object_2 object_3 object_4 object_5 object_6
    object_7 object_8 object_9 object_10 object_11 object_12 - item
  )

  (:init
    ; Intentionally empty: no next links; no has-successor / has-predecessor facts.
  )

  ; Goal: enforce the mandated terminal conditions exactly.
  (:goal (and
           (next object_11 object_7)
           (next object_12 object_5)
         ))
)