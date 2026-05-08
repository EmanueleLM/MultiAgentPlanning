(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  ;; Objects: three things named a, b, c and two agents
  (:objects
    a b c - thing
    attacker1 feaster1 - agent
  )

  ;; Public initial state: agents have their roles; no cravings exist initially
  (:init
    (role-attacker attacker1)
    (role-feaster feaster1)
  )

  ;; Goal: object a craves object b AND object c craves object a
  (:goal
    (and
      (craves a b)
      (craves c a)
    )
  )
)