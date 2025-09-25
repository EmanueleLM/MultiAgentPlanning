(define (problem combined-meeting)
  (:domain meeting-domain)
  (:objects
    traveler sarah - agent
    richmond presidio - location
  )
  (:init
    (at traveler richmond)
    (at sarah presidio)
    (sarah-available presidio)
  )
  (:goal (met))
)