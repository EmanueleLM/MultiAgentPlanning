(define (problem meeting-problem)
  (:domain meeting-domain)

  (:objects
    traveler betty - agent
    pacific fishermans - location
  )

  (:init
    (is-traveler traveler)
    (is-betty betty)
    (at traveler pacific)
    (at betty fishermans)
    (= (time) 540)         ; traveler arrives at Pacific Heights at 09:00 = 540
    (= (total-travel) 0)
  )

  (:goal (met-minimum))

  (:metric minimize (total-travel))
)