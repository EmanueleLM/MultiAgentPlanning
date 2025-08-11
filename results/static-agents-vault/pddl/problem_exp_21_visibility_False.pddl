(define (problem vault-robots-problem)
  (:domain vault-robots)

  (:objects
    robot-A robot-B - robot
    vault-1 - vault
    key-1 - key
  )

  (:init
    (big robot-A)
    (small robot-B)
    (closed vault-1)
    (have-key robot-A key-1)
    (adjacent robot-A vault-1)
    (adjacent robot-B vault-1)
    (cannot-grab robot-A)
  )

  (:goal (and
           (open vault-1)
           (has-object robot-B)))
)