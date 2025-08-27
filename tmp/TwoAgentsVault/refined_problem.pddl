(define (problem coordinated-open-vault)
  (:domain multi-agent-vault-operation)

  (:objects
    key-holder - robot
    small-robot - robot
    key1 - key
    vault1 - vault
    object1 - object)

  (:init
    (vault-closed vault1)
    (vault-has-object vault1 object1)
    (has-key key-holder key1)
    (can-access-vault small-robot vault1)
    (can-access-vault key-holder vault1))

  (:goal
    (object-grasped small-robot object1)))