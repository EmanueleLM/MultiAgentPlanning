(define (problem meet-betty-early-max)
  (:domain sf-meeting)
  (:objects
    you betty - agent
    richmond financial - location
  )

  ;; Initial numeric fluent
  (:init
    (= (total-meeting-time) 0)
    ;; No initial location facts for agents at time 0:
    ;; - "you" arrive at Richmond District at 09:00 (540 minutes) -> modeled with a timed initial literal below.
    ;; - "betty" will be at Financial District only from 17:15 (1035) to 21:45 (1305) -> modeled with timed initial literals below.
  )

  ;; Timed initial literals encode arrival and availability windows as hard temporal facts.
  (:timed-initial-literals
    ;; You arrive at Richmond District at 09:00 (540)
    (at 540 (at you richmond))

    ;; Betty is at Financial District from 17:15 (1035) ...
    (at 1035 (at betty financial))
    ;; ... until 21:45 (1305) (remove the fact at 1305)
    (at 1305 (not (at betty financial)))
  )

  ;; Hard numeric goal: meet Betty for at least 60 minutes in total.
  ;; The solver will maximize total-meeting-time (see :metric) subject to constraints,
  ;; which encodes the user's converted "preference" as a scheduling objective.
  (:goal (and (>= (total-meeting-time) 60)))

  ;; Objective: maximize total accumulated meeting time (minutes).
  ;; This encourages the planner to (a) schedule the meeting as early as feasible
  ;; and (b) use as much of the available overlap as possible.
  (:metric maximize (total-meeting-time))
)