(define (problem vault-problem)
  (:domain vault-domain)
  (:objects
    robot-a robot-b - robot
    vault - vault
    key1 - key
    obj1 - thing
  )
  (:init
    (closed vault)
    (entrance-small vault)
    (requires-key vault key1)
    (has-key robot-a key1)
    (small robot-b)
    (at obj1 vault)
  )
  (:goal (and
           (open vault)
           (gripped robot-b obj1)))
)