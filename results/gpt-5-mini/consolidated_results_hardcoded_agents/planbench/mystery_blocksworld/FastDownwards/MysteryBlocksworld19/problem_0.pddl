(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    a b c d - entity
  )

  ;; Initial facts (mapped exactly from provided environment facts)
  (:init
    ;; initial craves relations
    (craves a c)
    (craves d a)

    ;; initial global harmony
    (harmony)

    ;; initial planets
    (at-planet b)
    (at-planet c)

    ;; initial provinces
    (has-province b)
    (has-province d)

    ;; explicit distinctness facts to enforce object != other constraints without using :equality
    ;; All ordered pairs of distinct entities are listed so actions may require (distinct ?x ?y).
    (distinct a b) (distinct a c) (distinct a d)
    (distinct b a) (distinct b c) (distinct b d)
    (distinct c a) (distinct c b) (distinct c d)
    (distinct d a) (distinct d b) (distinct d c)
  )

  ;; Goal:
  ;; The auditor and orchestrator target the craves relations forming the intended cycle.
  ;; Require these craves facts to hold simultaneously in the final state.
  (:goal (and
            (craves a c)
            (craves b d)
            (craves d a)
          )
  )
)