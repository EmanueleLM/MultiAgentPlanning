(define (problem vault-multiagent-problem)
  (:domain vault-multiagent-domain)
  (:objects
    bigRobot   - agent
    smallRobot - agent
    vault      - vault
    key        - key
    item       - object
    outside    - location)
  (:init
    (big      bigRobot)
    (small    smallRobot)
    (at       bigRobot   vault)
    (at       smallRobot outside)
    (closed   vault)
    (entrance-small vault)
    (has-key  bigRobot key)
    (atobj    item vault)
    (not (has-obj bigRobot item))
    (not (has-obj smallRobot item)))
  (:goal (and
           (open vault)
           (has-obj smallRobot item))))