(define (problem mission_problem)
  (:domain mission_domain)

  (:objects
    p1 - player
    a1 - analyst
    start lab site - loc
    sample1 sample2 - item
    zone1 zone2 - zone
  )

  (:init
    ;; agent locations
    (at_player p1 start)
    (at_analyst a1 lab)

    ;; items initially located
    (item_at sample1 start)
    (item_at sample2 lab)

    ;; mapping locations to zones
    (in_zone start zone1)
    (in_zone lab zone1)
    (in_zone site zone2)

    ;; preference treated as hard constraint: zone2 is restricted and cannot be entered
    (zone_restricted zone2)
  )

  ;; Goals: both samples must be approved; sample1 must be placed at lab (player must deliver it there and analyst approve both)
  (:goal (and
    (item_at sample1 lab)
    (approved sample1)
    (approved sample2)
  ))
)