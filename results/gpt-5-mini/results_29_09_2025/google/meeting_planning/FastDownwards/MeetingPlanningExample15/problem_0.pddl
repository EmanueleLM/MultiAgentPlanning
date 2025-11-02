(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    traveler john - agent
    rh ggp - location
  )
  (:init
    ;; Traveler starts at Russian Hill at plan time 0 (09:00)
    (at traveler rh)
    ;; John is NOT at GGP initially (until timed literal turns it on at 240)
    ;; meeting-time starts at 0
    (= (meeting-time) 0)
    ;; Timed initial literals below encode John's presence window (times in minutes since 09:00).
    ;; At t=240 (13:00): John becomes present at Golden Gate Park.
    ;; At t=555 (18:15): John is no longer present at Golden Gate Park.
  )
  ;; Timed initial literals (PDDL2.2 style)
  (:timed-initial-literals
    (at 240 (at john ggp))
    (at 555 (not (at john ggp)))
  )

  (:goal (met traveler john))

  ;; Objective: maximize total minutes spent meeting (meeting-time).
  (:metric maximize (meeting-time))
)