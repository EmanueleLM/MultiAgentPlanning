(define (problem sf-meet-problem-classical)
  (:domain sf-meet-classical)

  (:objects
    traveler andrew - agent
    presidio unionsquare - location
    time540 time562 time675 time780 time930 time1035 - timepoint
  )

  (:init
    (at traveler presidio)
    (at andrew unionsquare)
    (time-at time540)
  )

  (:goal (and
    (met-andrew)
  ))
)