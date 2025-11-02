(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    traveler sarah - agent
    Richmond Presidio - location
  )

  (:init
    (= (total-meetings) 0)
    ; Traveler arrives at Richmond District at 09:00 -> 540 minutes
    (at 540 (at traveler Richmond))
    ; Sarah will be at Presidio from 13:15 (795) to 15:15 (915)
    (at 795 (at sarah Presidio))
    (at 795 (available-sarah))
    (at 915 (not (available-sarah)))
    (at 915 (not (at sarah Presidio)))
  )

  (:goal (and))
  (:metric maximize (total-meetings))
)