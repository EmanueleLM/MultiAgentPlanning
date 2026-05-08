(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    attacker - agent
    feaster - agent
    a b c - obj
  )

  (:init
    ; objects are available to be operated on
    (available a)
    (available b)
    (available c)

    ; by default, each object can establish one craving (enforces single active craving per object)
    (free-craver a)
    (free-craver b)
    (free-craver c)

    ; agent identity facts (restrict which actions each agent may perform)
    (attacker-agent attacker)
    (feaster-agent feaster)

    ; no initial cravings or causal facts (public initial state)
  )

  (:goal (and
    (craves a b)
    (craves c a)
  ))
)