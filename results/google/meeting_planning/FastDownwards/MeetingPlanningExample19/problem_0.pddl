(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    traveler john - agent
    ggp ph - place
  )
  (:init
    (at traveler ggp)        ; traveler starts at Golden Gate Park
    (at john ph)             ; John is at Pacific Heights
    (= (time) 540)           ; start time 09:00 AM -> 9*60 = 540 minutes
  )
  (:goal (meeting-done))
)