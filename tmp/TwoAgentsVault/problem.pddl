```lisp
(define (problem coordinated-open-vault)
  (:domain multi-agent-vault-operation)

  (:objects
    big-robot - robot
    small-robot - robot
    key1 - key
    vault1 - vault
    object1 - object)

  (:init
    (vault-closed vault1)
    (vault-has-object vault1 object1)
    (has-key small-robot key1)
    ; Small robot can access the vault
    (can-access-vault small-robot vault1)
  )

  (:goal
    (object-grasped small-robot object1))
)
```