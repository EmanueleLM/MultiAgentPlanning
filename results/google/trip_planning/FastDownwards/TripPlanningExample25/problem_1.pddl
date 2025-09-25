(define (problem trip-problem)
  (:domain trip-planning)
  (:objects
    traveler flight_checker - agent
    valencia lyon split - city
  )
  (:init
    (= (time-used) 0)
    (= (dur-valencia) 5)
    (= (dur-lyon) 4)
    (= (dur-split) 7)
    (at traveler valencia)
    (at flight_checker valencia)
  )
  (:goal (and
    (visited valencia)
    (visited lyon)
    (visited split)
    (attended-show)
  ))
)