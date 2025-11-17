(define (problem make-next-object_8-object_6)
  (:domain orchestrator-next-link)

  (:objects
    object_1 object_6 object_7 object_8 - obj
  )

  (:init
    ;; Only the facts required to support the provided plan and reach the goal
    (cats object_1)
    (spring object_6)
    (spring object_7)
    (hand object_8)
    (texture object_6)
    (texture object_7)
    (next object_1 object_6)   ; needed by first memory action
    (next object_8 object_7)   ; needed by sip action
  )

  (:goal (next object_8 object_6))
)