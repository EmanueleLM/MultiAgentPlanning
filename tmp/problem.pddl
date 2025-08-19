(define (problem integrated_vault_problem)
  (:domain integrated_vault_domain)
  (:objects
    my_robot - agent
    vault_key - key
    the_vault - vault
    valuable_object - object
  )
  
  (:init
    (vault_closed the_vault)
    (vault_contains_object the_vault valuable_object)
    (key_fits the_vault vault_key)
    (not (has my_robot vault_key))
    (not (object_acquired valuable_object))
    (not (in_vault my_robot))
  )
  
  (:goal
    (object_acquired valuable_object)
  )
)