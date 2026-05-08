(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b c d - item
  )

  (:init
    ;; availability: the objects that can be craved must exist and be available.
    (available b)
    (available c)

    ;; Authorization: encode which agent is permitted/responsible for which crave pair.
    ;; These encode the agents' responsibilities (keeps actions generic in the domain).
    (allowed-agent1 a b)
    (allowed-agent2 d c)

    ;; Auditor expects the pair (a craves b) and (d craves c) as a joint confirmation pair.
    (auditor-pairs a b d c)

    ;; No craves exist initially: absence is represented by not including any (craves ...) facts.
    ;; No audited flag initially.
  )

  (:goal (and
    (craves a b)
    (craves d c)
  ))
)