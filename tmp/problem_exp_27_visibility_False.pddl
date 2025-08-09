(define (problem vault_problem)
  (:domain vault_domain)
  (:objects
    robot-a robot-b  - robot
    key-1          - key
    vault-1        - vault
    treasure       - item
    vault-entrance - location
  )
  (:init
    (big robot-a)
    (small robot-b)
    (robot-at robot-a vault-entrance)
    (robot-at robot-b vault-entrance)
    (has-key robot-a key-1)
    (key-at key-1 vault-entrance)
    (vault-closed vault-1)
    (object-inside treasure vault-1)
  )
  (:goal
    (and
      (vault-open vault-1)
      (has-item robot-b treasure)
    ))
)