(define (problem vault-integrated-prob)
  (:domain vault-integrated)
  (:objects
    agentA agentB - agent
    vault1 - vault
    key1 - key
    obj1 - thing
  )
  (:init
    (closed vault1)
    (small agentB)
    (has agentA key1)
    (in obj1 vault1)
  )
  (:goal
    (and
      (open vault1)
      (has agentB obj1)
    )
  )
)