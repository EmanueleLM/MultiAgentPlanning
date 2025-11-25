(define (problem stack-problem)
  (:domain multiagent-stack)
  (:objects
    b1 b2 b3 - block
  )
  (:init
    ;; Initial block configuration (publicly specified initial state)
    (ontable b1)
    (on b2 b1)
    (ontable b3)

    ;; Clearness derived from above
    (clear b2)
    (clear b3)
    ;; b1 is not clear because b2 is on b1 (no predicate added for not-clear; absence of (clear b1) implies not clear)

    ;; Hands free initially for both agents (resource constraints)
    (handfree a1)
    (handfree a2)

    ;; No agent is holding any block initially (absence of holding predicates)
  )

  (:goal (and
    ;; Mandated terminal conditions (publicly specified goal)
    (on b3 b2)
    (on b2 b1)
  ))
)