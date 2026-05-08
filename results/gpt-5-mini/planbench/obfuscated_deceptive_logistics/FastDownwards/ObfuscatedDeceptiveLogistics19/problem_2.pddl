(define (problem link-problem)
  (:domain link-domain)
  (:objects
    object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 object_11 - thing
  )

  (:init
    (no-succ object_1) (no-pred object_1)
    (no-succ object_2) (no-pred object_2)
    (no-succ object_3) (no-pred object_3)
    (no-succ object_4) (no-pred object_4)
    (no-succ object_5) (no-pred object_5)
    (no-succ object_6) (no-pred object_6)
    (no-succ object_7) (no-pred object_7)
    (no-succ object_8) (no-pred object_8)
    (no-succ object_9) (no-pred object_9)
    (no-succ object_10) (no-pred object_10)
    (no-succ object_11) (no-pred object_11)

    (available agenta)
    (available agentb)
  )

  (:goal (and
    (next object_11 object_9)
  ))
)