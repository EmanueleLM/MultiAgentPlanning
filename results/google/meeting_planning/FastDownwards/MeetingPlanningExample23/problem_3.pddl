(define (problem meet-john-problem-classical)
  (:domain meeting-schedule-classical)
  (:objects
    traveler john - agent
    Bayview RussianHill - location
  )
  (:init
    (at traveler Bayview)
    (at john RussianHill)
    (travel-time-Bayview-RussianHill-23)
    (travel-time-RussianHill-Bayview-23)
    (meeting-length-75)
    (john-window-length-210)
    (john_available_for_75)
  )
  (:goal (met))
  (:metric minimize (total-cost))
)