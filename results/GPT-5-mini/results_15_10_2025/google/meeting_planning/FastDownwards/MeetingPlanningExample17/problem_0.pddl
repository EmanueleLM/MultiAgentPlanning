(define (problem meet-matthew-day)
  (:domain multi-agent-scheduling)

  (:objects
    traveler - agent
    matthew - person
    alamo sunset - location
  )

  ;; Assumptions (stated explicitly as comments per instructions):
  ;; - Time units are minutes measured from midnight. 09:00 = 540, 13:30 = 810, 14:30 = 870.
  ;; - Only the public inputs are modeled as persons/friends. No other friends are invented.
  ;; - Meeting action is modeled at the minimal required duration (15 minutes). This is a modeling
  ;;   choice made to encode the "minimum 15 minutes" hard constraint concretely.
  ;; - The traveler has no location facts before 09:00; the traveler appears at Alamo Square exactly
  ;;   at 09:00 (timed initial literal). This prevents any travel before arrival.
  ;; - Matthew's presence and availability are exactly the provided window 13:30-14:30 and are
  ;;   encoded with timed initial literals. No other availability is assumed.
  ;; - Preferences such as "earliest feasible meeting" are encoded by the planner seeking the earliest
  ;;   schedule that satisfies constraints; the domain gives the planner the necessary temporal constraints.

  (:init
    ;; numeric fluent initialization
    (= (met-count) 0)

    ;; Timed initial literals: traveler arrives at Alamo at 09:00 (540)
    ;; This means the predicate (at-agent traveler alamo) becomes true at t=540.
    (at 540 (at-agent traveler alamo))

    ;; Matthew will be at Sunset District and available from 13:30 (810) to 14:30 (870).
    ;; We add the positive literals at the start of the window and remove them at the end.
    (at 810 (at-person matthew sunset))
    (at 810 (available matthew))
    (at 870 (not (available matthew)))
    (at 870 (not (at-person matthew sunset)))
  )

  ;; Required meeting: ensure Matthew is met (hard constraint).
  ;; Additionally we add an objective to maximize met-count (the planner will try to increase
  ;; met-count; given only Matthew is modeled, this is equivalent to meeting this required meeting).
  (:goal (and
           (met matthew)
         )
  )

  ;; Objective: maximize number of friends met. (met-count increased by meeting actions)
  (:metric maximize (met-count))
)