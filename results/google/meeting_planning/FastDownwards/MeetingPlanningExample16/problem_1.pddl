(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    Chinatown Russian_Hill - location
    ronald - person
  )
  (:init
    (= (met-count) 0)
    (at-traveler Chinatown)
    (at 375 (available-ronald))
    (at 750 (not (available-ronald)))
  )
  (:goal (and (met ronald)))
  (:metric maximize (met-count))
)