(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:init
    (at traveler nobhill)
    (at mary marinadistrict)
    (mary-available)
  )
  (:goal (met-mary))
)