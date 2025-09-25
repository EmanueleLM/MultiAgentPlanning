(define (problem meet-john-problem-classical)
  (:domain meeting-schedule-classical)
  (:objects
    traveler john - agent
    bayview russianhill - location
  )
  (:init
    (at traveler bayview)
    (at john russianhill)
    (john_available_for_75)
    (= (total-cost) 0)
  )
  (:goal (met))
  (:metric minimize (total-cost))
)