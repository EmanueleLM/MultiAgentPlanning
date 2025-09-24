(define (problem combined-meet-john-classical)
  (:domain combined-meet-scheduling-classical)
  (:objects
    visitor john - person
    golden-gate-park pacific-heights - location
    s0 s1 s2 s3 - timepoint
  )

  (:init
    (at visitor golden-gate-park)
    (at john pacific-heights)
    (curtime s0)
    (person-available-start john s1)
    (person-available-start john s2)
    (person-available-start john s3)
    (time-successor s0 s1)
    (time-successor s1 s2)
    (time-successor s2 s3)
    (time-order s0 s1)
    (time-order s0 s2)
    (time-order s0 s3)
    (time-order s1 s2)
    (time-order s1 s3)
    (time-order s2 s3)
    (meeting-not-started visitor john)
  )

  (:goal (and
    (met visitor john)
    (meeting-completed visitor john)
  ))

  (:metric minimize (total-cost))
)