```pddl
(define (problem vault-collect-problem)
  (:domain vault-collect)

  (:objects
    bigrobot - robot
    smallrobot - robot
    vault1 - vault
    key1 - key
    object1 - object
  )

  (:init
    (big bigrobot)
    (small smallrobot)
    (vault-closed vault1)
    (has-key bigrobot key1)
    (object-inside-vault object1 vault1)
  )

  (:goal (and
            (vault-open vault1)
            (has-object smallrobot object1))
  )
)
```