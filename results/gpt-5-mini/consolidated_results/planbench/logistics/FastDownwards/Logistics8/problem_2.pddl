(define (problem objects-manipulation-problem)
  (:domain objects-manipulation)
  (:objects
    object_2 object_4 object_5 object_7 object_8 object_9 object_10 - object
    step_0 step_1 step_2 step_3 - time
  )

  (:init
    ; minimal time progression to execute three actions sequentially
    (time-now step_0)
    (succ step_0 step_1)
    (succ step_1 step_2)
    (succ step_2 step_3)

    ; only the facts required to support the provided plan and goals
    (hand object_9)
    (sneeze object_4)
    (texture object_7)
    (texture object_8)

    (next object_4 object_8)   ; needed by clip and wretched (pre for wretched)
    (next object_9 object_8)   ; needed by clip
    (next object_10 object_5)  ; goal-preserving fact

    (collect object_7 object_2)  ; required by wretched
    (collect object_8 object_2)  ; required by wretched
    (stupendous object_2)        ; required by wretched
  )

  (:goal (and
    (next object_10 object_5)
    (next object_9 object_7)
  ))
)