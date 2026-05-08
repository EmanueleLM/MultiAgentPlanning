(define (problem obfuscated-deceptive-logistics-17-prob)
  (:domain obfuscated-deceptive-logistics-17)
  (:objects
    object_0 object_1 - cat
    object_2 object_3 - stupendous
    object_4 object_5 - sneeze
    object_6 object_8 - spring
    object_7 object_9 - texture
    object_10 object_11 object_12 object_13 - hand
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 - stage
  )
  (:init
    ;; categorical facts
    (cats_dummy) ;; placeholder-free domain; no predicate named 'cats' used in domain actions, so omitted.
    ;; collect relations (texture -> stupendous)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; next relations (object -> texture)
    (next object_0 object_8)
    (next object_1 object_8)
    (next object_10 object_7)
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_9)
    (next object_4 object_7)
    (next object_5 object_9)

    ;; vase relations: none in initial state according to the public initial facts

    ;; sneeze, spring, stupendous, texture types are represented by object typing in (:objects)
    ;; but to retain clarity we do not add type-as-predicate atoms; types are enforced by object declarations.

    ;; Stage ordering: contiguous progression enforced by current_stage and succ chain
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)
    (succ stage_6 stage_7)
    (succ stage_7 stage_8)
    (succ stage_8 stage_9)
    (succ stage_9 stage_10)
    (succ stage_10 stage_11)
    (succ stage_11 stage_12)

    (current_stage stage_0)
  )
  (:goal (and
    (next object_10 object_6)
    (next object_11 object_8)
    (next object_12 object_7)
    (next object_13 object_9)
  ))
)