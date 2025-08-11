(define (problem vault-orchestrated-problem)
  (:domain vault-orchestrated)

  (:objects
    bigRobot   - robot
    smallRobot - robot

    vault1     - vault

    object1    - object

    outside    - loc
    entrance   - loc
    inside     - loc
  )

  (:init
    (closed vault1)
    (has-key bigRobot vault1)

    (at bigRobot outside)
    (at smallRobot outside)

    (robot-small smallRobot)
    (robot-big   bigRobot)

    (entrance-small)

    (connected outside entrance)
    (connected entrance inside)

    (at-obj object1 inside)
  )

  (:goal
    (and
      (opened vault1)
      (has smallRobot object1)))
)