(define (problem cooperative-vault-problem)
  (:domain cooperative-vault-domain)

  (:objects
    robot1 - robot
    robot2 - robot
    key1 - key
    vault1 - vault
    object1 - object
  )

  (:init
    ;; Initial conditions for Agent 1
    (vault-closed vault1)
    (has-key robot1 key1)
    ;(grabbed-object vault1 object1) ;; This predicate should not be used as the object is initially inside the vault
    (is-big robot1)
    ;(is-small vault1) ;; The is-small predicate should not apply to vaults, setting it here doesn't align with listed predicates

    ;; Initial conditions for Agent 2
    (object-inside vault1 object1)
    (is-small robot2)
    (not (vault-open))
    (not (object-grabbed))
  )

  (:goal
    (and
      (object-grabbed)
      (holding robot2 object1)
    )
  )
)