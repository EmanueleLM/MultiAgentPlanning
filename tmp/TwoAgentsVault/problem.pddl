(define (problem integrated-fetch-object)
  (:domain integrated-vault-task)

  (:objects 
    small_robot - robot
    tool1 - tool
    key1 - key
    vault1 - vault
    object1 - object
  )

  (:init 
    (robot_at small_robot vault1)
    (vault_closed vault1)
    (object_inside vault1)
    (has-small-robot)
    (small_robot_available)
  )

  (:goal 
    (and 
      (object_grabbed object1)
      (object_retrieved)
    )
  )
)