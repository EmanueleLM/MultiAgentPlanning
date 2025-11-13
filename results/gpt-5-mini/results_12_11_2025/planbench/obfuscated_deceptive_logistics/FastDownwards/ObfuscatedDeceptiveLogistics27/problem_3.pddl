(define (problem obfuscated-deceptive-logistics27-problem)
  (:domain obfuscated-deceptive-logistics27)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
    ;; discrete ordered stages sufficient to represent ordered progression of the candidate plan.
    step_0 step_1 step_2 step_3 step_4 step_5 step_6 step_7 step_8 step_9 step_10 step_11 step_12 step_13 step_14 step_15 step_16 step_17 step_18 step_19 step_20 step_21 step_22 step_23 step_24 - stage
  )

  (:init
    ;; static object properties
    (cats object_0)
    (cats object_1)

    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    (hand object_12)
    (hand object_13)
    (hand object_14)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_9)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_10)
    (texture object_11)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; initial dynamic next relations (anchored in initial configuration)
    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_11)
    (next object_13 object_8)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)

    ;; stage graph (static)
    (succ step_0 step_1)
    (succ step_1 step_2)
    (succ step_2 step_3)
    (succ step_3 step_4)
    (succ step_4 step_5)
    (succ step_5 step_6)
    (succ step_6 step_7)
    (succ step_7 step_8)
    (succ step_8 step_9)
    (succ step_9 step_10)
    (succ step_10 step_11)
    (succ step_11 step_12)
    (succ step_12 step_13)
    (succ step_13 step_14)
    (succ step_14 step_15)
    (succ step_15 step_16)
    (succ step_16 step_17)
    (succ step_17 step_18)
    (succ step_18 step_19)
    (succ step_19 step_20)
    (succ step_20 step_21)
    (succ step_21 step_22)
    (succ step_22 step_23)
    (succ step_23 step_24)

    ;; starting stage indicator (there is exactly one at-stage fact initially)
    (at-stage step_0)
  )

  ;; Goal: require the specified next relations and that we've advanced to final stage.
  (:goal (and
    (next object_12 object_6)
    (next object_13 object_10)
    (next object_14 object_11)
    (at-stage step_24)
  ))

  ;;; Assumptions (minimal, explicit):
  ;;; - Stage progression is enforced by the single fluent (at-stage ?s). Every action requires (at-stage ?s) and (succ ?s ?s2) and advances to ?s2. This prevents revisiting earlier stages.
  ;;; - Static properties (hand, cats, sneeze, texture, spring, stupendous, collect) do not change.
  ;;; - Dynamic relations that can change are (vase ?h ?a) and (next ?a ?b).
)