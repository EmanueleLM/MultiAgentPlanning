(define (domain integrated_vault_domain)
  (:predicates
    (vault-closed)
    (vault-open)
    (key-available)
    (object-inside-vault)
    (object-retrieved)
    (entrance-small)
    (robot-big)
    (small-robot-at-vault)
    (key-at-vault)
    (vault-requires-key)
    (has-key)
    (object-grabbed)
  )

  (:action take-key
    :precondition (and (small-robot-at-vault) (key-at-vault) (vault-requires-key))
    :effect (and (has-key) (not (key-at-vault)))
  )

  (:action use-key-to-open-vault
    :precondition (and (has-key) (vault-closed) (vault-requires-key))
    :effect (and (vault-open) (not (vault-closed)))
  )

  (:action grab-object
    :precondition (and (vault-open) (small-robot-at-vault) (object-inside-vault))
    :effect (and (object-retrieved) (not (object-inside-vault)) (object-grabbed))
  )
)