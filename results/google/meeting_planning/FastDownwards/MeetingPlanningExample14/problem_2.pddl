(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    traveler mary - agent
    nobhill marinadistrict - location
  )
  (:init
    (at traveler nobhill)
    (at mary marinadistrict)
    (mary-available)
  )
  (:goal (met-mary))
)