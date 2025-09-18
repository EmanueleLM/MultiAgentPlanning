(define (problem integrated-meet-barbara-problem)
  (:domain integrated-meeting-domain)

  (:objects
    barbara - person
    north-beach alamo-square - location
    ;; single instances of visitor and planner are implicit via predicates (no agent objects required)
  )

  (:init
    ;; Both the visitor and the planner/agent start at North Beach at arrival time 9:00 (540)
    (at-visitor north-beach)
    (at-agent north-beach)

    ;; Barbara is initially at Alamo Square
    (at-person barbara alamo-square)

    ;; Current time is 9:00 AM
    (= (time) 540)
  )

  ;; Goal: have met Barbara (for at least 90 minutes)
  (:goal (met barbara))
)