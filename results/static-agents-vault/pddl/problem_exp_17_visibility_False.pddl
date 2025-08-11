(define (problem vault-cooperation-prb)
  (:domain vault-cooperation)

  (:objects
    agentA agentB  - agent
    key      - object
    obj      - object
    outside vault - location
  )

  (:init
    (at agentA outside)
    (at agentB outside)
    (agent-large agentA)
    (agent-small agentB)
    (has-key agentA)
    (vault-closed)
    (object-at obj vault)
  )

  (:goal (and
           (vault-open)
           (object-grabbed obj)
         ))
)