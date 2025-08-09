(define (problem vault-orchestrated-problem)
  (:domain vault-orchestrated-domain)
  (:objects
    robotA robotB - robot
    vault - door
    artifact - object
  )
  (:init
    (big robotA)
    (small robotB)
    (robot_at robotA vault)
    (robot_at robotB vault)
    (closed vault)
    (entrance_small vault)
    (has-key robotA)
    (object_at artifact vault)
  )
  (:goal
    (and
      (open vault)
      (object_in_hand robotB artifact)
    )
  )
)