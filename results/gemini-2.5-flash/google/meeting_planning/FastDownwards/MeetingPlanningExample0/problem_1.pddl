(define (problem meeting-planning-0)
  (:domain meeting-planning)
  (:objects
    traveler - agent
    stephanie - agent
    marina mission - location
  )
  (:init
    (= (total-cost) 0)
    (at traveler marina)
    (is-traveler traveler)
    (is-stephanie stephanie)

    ; Stephanie is available at Mission District from 10:30 AM (90 minutes after start) to 1:30 PM (270 minutes after start).
    (at 90 (stephanie-available mission))
    (at 270 (not (stephanie-available mission)))
  )
  (:goal
    (and
      (meeting-occurred traveler stephanie)
    )
  )
  (:metric minimize (total-cost))
)