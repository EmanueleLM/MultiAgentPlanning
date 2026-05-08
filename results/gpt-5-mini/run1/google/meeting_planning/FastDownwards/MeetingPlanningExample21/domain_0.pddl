(define (domain meetup-schedule)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent friend location time)

  ;; function to allow metric optimization via (increase ...)
  (:functions (total-cost))

  (:predicates
    ;; agent is at location at a specific timepoint
    (at ?a - agent ?loc - location ?t - time)

    ;; static allowed transitions derived in the problem file:
    ;; can-travel-mh ?t1 ?t2  means travel Mission->Haight may start at ?t1 and finish at ?t2 (travel time 12)
    (can-travel-mh ?t1 - time ?t2 - time)
    ;; can-travel-hm ?t1 ?t2  means travel Haight->Mission may start at ?t1 and finish at ?t2 (travel time 11)
    (can-travel-hm ?t1 - time ?t2 - time)

    ;; can-meet-sam ?t1 ?t2: meeting with Sam may start at ?t1 and finish at ?t2 (within Sam's availability window)
    (can-meet-sam ?t1 - time ?t2 - time)
    ;; can-meet-marg ?t1 ?t2: meeting with Margaret may start at ?t1 and finish at ?t2 (>=30 min, within Margaret's window)
    (can-meet-marg ?t1 - time ?t2 - time)

    ;; whether a friend has been met already (ensures no double-meet)
    (met ?f - friend)

    ;; goal marker: finished the schedule (must be achieved exactly once)
    (finished)
  )

  ;; Travel Mission->Haight (exact travel time enforced by can-travel-mh static predicate)
  (:action travel-mission-to-haight
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a mission ?t1)
      (can-travel-mh ?t1 ?t2)
    )
    :effect (and
      (not (at ?a mission ?t1))
      (at ?a haight ?t2)
    )
  )

  ;; Travel Haight->Mission (exact travel time enforced by can-travel-hm)
  (:action travel-haight-to-mission
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a haight ?t1)
      (can-travel-hm ?t1 ?t2)
    )
    :effect (and
      (not (at ?a haight ?t1))
      (at ?a mission ?t2)
    )
  )

  ;; Meet Sam at Mission. Sam's only hard constraint: availability window 09:00–10:00.
  ;; No minimum meeting length is imposed beyond requiring start < end and can-meet-sam predicate.
  ;; This action sets met sam and advances the agent's time from t1 to t2.
  ;; It also decreases total-cost by 1 so the planner prefers meeting Sam (to maximize number met).
  (:action meet-sam
    :parameters (?a - agent ?s - friend ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a mission ?t1)
      (can-meet-sam ?t1 ?t2)
      (not (met ?s))
    )
    :effect (and
      (not (at ?a mission ?t1))
      (at ?a mission ?t2)
      (met ?s)
      (increase (total-cost) -1)
    )
  )

  ;; Meet Margaret at Haight. Enforces minimum meeting duration (static can-meet-marg ensures >=30 min)
  (:action meet-margaret
    :parameters (?a - agent ?m - friend ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a haight ?t1)
      (can-meet-marg ?t1 ?t2)
      (not (met ?m))
    )
    :effect (and
      (not (at ?a haight ?t1))
      (at ?a haight ?t2)
      (met ?m)
      (increase (total-cost) -1)
    )
  )

  ;; Finish action: can be executed at any allowed 'finishable' timepoint (static predicate in problem).
  ;; The plan must reach finished (goal). This action does not change total-cost.
  (:action finish-day
    :parameters (?a - agent ?loc - location ?t - time)
    :precondition (and
      (at ?a ?loc ?t)
    )
    :effect (and
      (finished)
    )
  )
)