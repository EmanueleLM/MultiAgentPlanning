(define (problem day-schedule-merged)
  (:domain combined-visit-meeting-domain)
  (:objects haight sunset - loc
            you jessica - person)

  ; Initial state
  (:init
     (= (clock) 0)                         ; 9:00 AM
     (at-location haight)                   ; you start at Haight-Ashbury
     (at jessica haight)                    ; Jessica starts at Haight (per agent 2's init)
  )

  ; Goal: have met (the meeting completed)
  (:goal (met))
)