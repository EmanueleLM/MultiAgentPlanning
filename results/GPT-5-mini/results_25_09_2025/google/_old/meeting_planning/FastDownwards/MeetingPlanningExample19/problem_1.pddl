(define (problem combined-meet-john-classical)
  (:domain combined-meet-scheduling-classical)
  (:objects
    visitor john - person
    golden-gate-park pacific-heights - location
    s0 s1 s2 s3 - timepoint
  )

  (:init
    ;; Both start at Golden Gate Park at symbolic start time s0 (corresponds to 540 minutes)
    (at visitor golden-gate-park)
    (at john golden-gate-park)
    (curtime s0)

    ;; Precomputed allowed meeting start times for John based on his availability window (1185-1285).
    ;; We allow symbolic start times s1=1185, s2=1200, s3=1240 (all <=1240 so a 45-min meeting fits).
    (person-available-start john s1)
    (person-available-start john s2)
    (person-available-start john s3)
  )

  (:goal (and
    (met visitor john)
    (available-for-meeting)
  ))

  (:metric minimize (total-cost))
)