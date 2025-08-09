(define (problem vault-problem)
  (:domain vault-domain)
  (:objects
    agentA agentB - agent
    outside vault - location
    obj - object)
  (:init
    (at agentA outside)
    (at agentB outside)
    (has-key agentA)
    (vault-closed)
    (entrance-small)
    (object-here obj))
  (:goal
    (and
      (vault-open)
      (has agentB obj))) )