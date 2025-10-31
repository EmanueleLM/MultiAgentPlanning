(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    traveler barbara - agent
    bayview ggp - location
  )
  (:init
    ; time origin: 08:00 == t=0
    (= (clock) 0)

    ; initial locations / availability
    (at traveler bayview)             ; traveler starts at Bayview
    (at barbara ggp)                  ; Barbara is at Golden Gate Park and available from t=0..210
    ; Note: Barbara's availability window is enforced by the meeting precondition requiring finish <= 210
    ; Traveler arrives at Bayview at 09:00 -> t = 60; enforced in travel action precondition
  )
  (:goal (met))

  ; minimize the clock to get the earliest finishing meeting (schedules earlier meeting time)
  (:metric minimize (clock))
)