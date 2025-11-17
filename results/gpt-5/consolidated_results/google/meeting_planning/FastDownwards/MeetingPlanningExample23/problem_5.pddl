(define (problem meetingplanningexample23-problem-strips)
  (:domain meetingplanningexample23-strips)
  (:objects
    bayview - location
    john - person
  )
  (:init
    (at bayview)
    (known-location bayview)
    (known-location russian_hill)
    (before-john-start)
    (need-5)
    (= (total-cost) 0)
  )
  (:goal (and
    (met-john)
  ))
  (:metric minimize (total-cost))
)