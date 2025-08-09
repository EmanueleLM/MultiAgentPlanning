(define (problem vault-cooperation-pb)
  (:domain vault-cooperation)

  (:objects
    bigRobotA - robot
    smallRobotB - robot
    vault1 - vault
    key1 - key
    object1 - item
  )

  (:init
    (big bigRobotA)
    (small smallRobotB)
    (closed vault1)
    (entrance_small vault1)
    (has bigRobotA key1)
    (in_item object1 vault1)
    (fit smallRobotB vault1)
  )

  (:goal
    (and
      (open vault1)
      (has smallRobotB object1)
    )
  )
)