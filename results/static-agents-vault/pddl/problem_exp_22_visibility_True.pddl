(define (problem vault-problem)
  (:domain vault-domain)
  (:objects
    agentA agentB            - agent
    vault-obj                - object
    outside vault            - location
  )
  (:init
    (at agentA outside)
    (at agentB outside)
    (has-key agentA)
    (not (has-key agentB))
    (not (vault-open))
    (not (has-object agentB))
  )
  (:goal (and
           (vault-open)
           (has-object agentB)) )
)