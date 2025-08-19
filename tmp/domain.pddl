(define (domain integrated_vault_domain)
  (:requirements :strips :typing)

  (:types 
    agent key vault object
  )
  
  (:predicates 
    (has ?agent - agent ?key - key)
    (key_fits ?vault - vault ?key - key)
    (vault_closed ?vault - vault)
    (vault_opened ?vault - vault)
    (vault_contains_object ?vault - vault ?object - object)
    (object_acquired ?object - object)
    (in_vault ?agent - agent)
  )
  
  (:action acquire_key
    :parameters (?agent - agent ?key - key)
    :precondition (not (has ?agent ?key))
    :effect (has ?agent ?key)
  )

  (:action open_vault
    :parameters (?agent - agent ?vault - vault ?key - key)
    :precondition (and (vault_closed ?vault) (has ?agent ?key) (key_fits ?vault ?key))
    :effect (and (not (vault_closed ?vault)) (vault_opened ?vault))
  )

  (:action enter_vault
    :parameters (?agent - agent ?vault - vault)
    :precondition (vault_opened ?vault)
    :effect (in_vault ?agent)
  )

  (:action acquire_object
    :parameters (?agent - agent ?vault - vault ?object - object)
    :precondition (and (vault_opened ?vault) (vault_contains_object ?vault ?object) (in_vault ?agent))
    :effect (object_acquired ?object)
  )
)