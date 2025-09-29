(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    traveler mary - agent
    nobhill marinadistrict - location
  )
  (:init
    (at traveler nobhill)
    (at mary marinadistrict)
    (= (time) 540)
    (= (num-meetings) 0)
  )
  (:goal (and (>= (num-meetings) 0)))
  (:metric maximize (num-meetings))
)