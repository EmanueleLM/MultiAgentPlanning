(define (problem meet-john-numeric-problem)
  (:domain bayview-scheduling-numeric)
  (:objects
    visitor john - person
    bayview russianhill - location
  )

  (:init
    (at visitor bayview)
    (at john russianhill)
    (route bayview russianhill)
    (route russianhill bayview)
    (is-visitor visitor)
    (is-john john)
    (= (current-time) 0)
    (= (meetings) 0)
    (= (total-travel) 0)
  )

  (:goal (and
    (>= (meetings) 1)
    (met-john)
  ))

  (:metric maximize (meetings))
)