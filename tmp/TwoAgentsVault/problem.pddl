(define (problem collaborative_vault_problem)
  (:domain collaborative_vault_domain)
  (:objects
    large_robot - robot
    small_robot - robot
    the_vault - vault
    the_key - key
    the_object - object
  )
  (:init
    (vault_closed the_vault)
    (vault_requires_key the_vault the_key)
    (key_in_hand large_robot the_key)
    (object_in_vault the_vault the_object)
    (robot_large large_robot)
    (robot_small small_robot)
    (vault_small_entrance the_vault)
    (robot_at_vault large_robot the_vault)
    (key_in_reach)
    (not (at_vault small_robot))
    (not (has_key small_robot))
  )
  (:goal
    (and
      (vault_open the_vault)
      (object_in_hand large_robot the_object))
  )
)