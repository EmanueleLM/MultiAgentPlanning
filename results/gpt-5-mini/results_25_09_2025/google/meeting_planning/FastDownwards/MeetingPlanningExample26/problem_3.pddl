(define (problem combined-meeting)
  (:domain meeting-domain)
  (:objects
    traveler sarah - agent
    richmond presidio - location
  )
  (:init
    (at traveler richmond)
    (= (time) 540)
    ; Sarah will be at Presidio from 13:15 (795) to 15:15 (915)
    (at 795 (at sarah presidio))
    (at 915 (not (at sarah presidio)))
  )
  (:goal (met))
)