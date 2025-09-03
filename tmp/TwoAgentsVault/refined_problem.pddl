(define (problem integrated-fetch-object)
  (:domain integrated-vault-task)

  (:objects 
    key_holder small_robot - robot
    vault1 - vault
    object1 - object
  )

  (:init 
    (robot_at key_holder vault1)
    (robot_at small_robot vault1)
    (vault_closed vault1)
    (object_inside vault1)
    (robot_can_enter small_robot vault1)
    (has_key key_holder)
  )

  (:goal 
    (and 
      (object_grabbed object1)
      (object_retrieved)
    )
  )
)