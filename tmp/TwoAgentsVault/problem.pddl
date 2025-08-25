(define (problem integrated_vault_problem)
  (:domain integrated-vault-domain)
  (:objects 
     agent1 agent2 - agent
     location vault - location
  )
  
  (:init 
    (robot_at agent2 location)  ;; Initial position of agent2
    (vault_closed)
    (object_inside_vault)
    (vault_has_small_entrance)
    (robot_is_big)
  )

  (:goal 
    (and 
      (object_retrieved)
      (object_grabbed agent2)
    )
  )
)