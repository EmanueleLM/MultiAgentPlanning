(define (problem combined-meet-john-classical)
  (:domain combined-meet-scheduling-classical)
  (:objects
    visitor john - person
    golden-gate-park pacific-heights - location
    s0 s1 s2 s3 - timepoint
  )

  (:init
    (at visitor golden-gate-park)
    (at john golden-gate-park)
    (curtime s0)
    (person-available-start john s1)
    (person-available-start john s2)
    (person-available-start john s3)
  )

  (:goal (and
    (met visitor john)
    (available-for-meeting)
  ))
)