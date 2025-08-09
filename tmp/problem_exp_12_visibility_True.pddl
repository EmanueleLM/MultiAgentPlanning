(define (problem vault-problem)
  (:domain vault-domain)
  (:objects
    agentA agentB - agent
    vault1 - vault
    key1 - key
    obj1 - object)
  (:init
    (closed vault1)
    (has-key agentA key1)
    (can-enter agentB vault1)
    (object-in obj1 vault1))
  (:goal
    (and
      (opened vault1)
      (has-object agentB obj1)))