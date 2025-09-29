(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    traveler john - agent
    ggp ph - place
  )
  (:init
    (at traveler ggp)
    (at john ph)
    (= (current-time) 540)
  )
  (:goal (met-john))
)