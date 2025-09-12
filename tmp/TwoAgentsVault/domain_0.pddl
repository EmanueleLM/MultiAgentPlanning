(define (domain vault-operation-coordination)
  (:requirements :strips :typing)
  (:types robot location object key)

  (:predicates
    (vault_closed)
    (vault_open)
    (have_key)
    (object_grabbed)
    (key_inserted)
    (small_entrance)
    (at ?r - robot ?l - location)
    (has-key ?r - robot)
    (object_inside)
    (grabbed-object ?r - robot)
  )

  ; Actions for big robot
  (:action insert_key
    :parameters (?r - robot)
    :precondition (and (vault_closed) (have_key) (small_entrance) (at ?r entrance))
    :effect (and (key_inserted) (not (vault_closed)))
  )

  (:action open_vault
    :precondition (and (key_inserted) (not (vault_closed)))
    :effect (vault_open)
  )

  ; Actions for small robot
  (:action move-to-vault
    :parameters (?r - robot)
    :precondition (at ?r entrance)
    :effect (at ?r vault)
  )

  (:action use-key
    :parameters (?r - robot)
    :precondition (and (at ?r vault) (has-key ?r) (not (vault_open)))
    :effect (vault_open)
  )

  (:action grab-object
    :parameters (?r - robot)
    :precondition (and (at ?r vault) (vault_open) (object_inside))
    :effect (grabbed-object ?r)
  )
)