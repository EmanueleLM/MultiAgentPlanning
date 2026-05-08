(define (problem overcome-feast-problem)
  (:domain OvercomeFeastDomain)

  (:objects
    a b c d - object
  )

  (:init
    ;; initial cravings (from auditor initial facts)
    (craves a c)
    (craves d a)

    ;; initial global harmony (auditor provided)
    (harmony)

    ;; initial planet membership (auditor provided)
    (planet b)
    (planet c)

    ;; initial province holders (auditor provided)
    (province b)
    (province d)

    ;; No initial needs_recovery or craves_locked facts: they are created by actions.

    ;; explicit distinctness facts for all ordered distinct pairs (enforces attacker != target etc.)
    (different a b) (different a c) (different a d)
    (different b a) (different b c) (different b d)
    (different c a) (different c b) (different c d)
    (different d a) (different d b) (different d c)
  )

  ;; GOAL:
  ;; As mandated by the orchestrator/auditor: fix terminal conditions explicitly.
  ;; The goal below requires province status for 'a' and 'c' and global harmony to be true.
  ;; This is reachable from the provided initial state under the guarded (wait) transitions.
  (:goal (and
    (province a)
    (province c)
    (harmony)
  ))
)