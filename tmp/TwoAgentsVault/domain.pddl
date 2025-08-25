(define (domain integrated-vault-domain)
  (:requirements :strips :typing)
  (:types 
    agent location
  )

  (:predicates 
    (vault_closed)
    (vault_opened)
    (object_inside_vault)
    (object_retrieved)
    (vault_has_small_entrance)
    (robot_is_big)
    (have_key ?a - agent)
    (robot_at ?a - agent ?l - location)
    (object_grabbed ?a - agent)
  )
  
  ;; Agent1's Actions
  (:action agent1_open_vault
    :parameters (?a - agent)
    :precondition (and (vault_closed) (have_key ?a) (vault_has_small_entrance))
    :effect (and (vault_opened) (not (vault_closed)))
  )

  (:action agent1_retrieve_object_with_tool
    :parameters (?a - agent)
    :precondition (and (vault_opened) (object_inside_vault) (vault_has_small_entrance) (robot_is_big))
    :effect (and (object_retrieved) (not (object_inside_vault)))
  )
  
  ;; Agent2's Actions
  (:action agent2_find_key
    :parameters (?a - agent)
    :precondition (robot_at ?a location)
    :effect (have_key ?a)
  )

  (:action agent2_open_vault
    :parameters (?a - agent)
    :precondition (and (vault_closed) (have_key ?a))
    :effect (and (not (vault_closed)) (vault_opened))
  )

  (:action agent2_grab_object
    :parameters (?a - agent)
    :precondition (and (vault_opened) (robot_at ?a vault))
    :effect (object_grabbed ?a)
  )
)