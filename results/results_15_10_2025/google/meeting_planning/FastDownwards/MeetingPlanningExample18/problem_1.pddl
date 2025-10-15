(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    marina richmond - location
  )
  (:init
    (at marina)
    (= (time) 0)
    (= (met-count) 0)
  )
  (:goal (and))
  (:metric maximize (met-count))
)