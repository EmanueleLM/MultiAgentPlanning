(define (problem vault-problem)
  (:domain vault-domain)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Objects
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:objects
    agent-a agent-b       - agent
    vault                - location
    outside              - location
    obj1                 - object
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Initial state
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:init
    ; Vault status
    (closed vault)

    ; Key possession
    (has-key agent-a)

    ; Size of the agents
    (big agent-a)
    (small agent-b)

    ; Positions
    (at agent-a outside)
    (at agent-b outside)

    ; The object we want is inside the vault
    (in obj1 vault)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Goal
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:goal (and
           (open vault)          ; vault must be open
           (has-object agent-b)  ; agent B has fetched it
         ))
)