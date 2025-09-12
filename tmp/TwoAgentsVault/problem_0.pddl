(define (problem open-vault-coordinated)
  (:domain vault-operation-coordination)
  (:objects
    big_robot small_robot - robot
    entrance vault - location
    key - key
    object - object
  )
  (:init
    (vault_closed)
    (have_key)
    (small_entrance)
    (at big_robot entrance)
    (at small_robot entrance)
    (has-key small_robot)
    (object_inside)
    (not (vault_open))
  )
  (:goal
    (grabbed-object small_robot)
  )
)