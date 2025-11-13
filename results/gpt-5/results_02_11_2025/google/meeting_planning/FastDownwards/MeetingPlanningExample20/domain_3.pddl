(define (domain meeting_planner_sf)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (having_met_joseph)
  )
  (:functions (total-cost))
  (:action choose_schedule_s1
    :parameters (?t - agent ?l - location)
    :precondition (and
      (at ?t ?l)
      (not (having_met_joseph))
    )
    :effect (and
      (having_met_joseph)
      (increase (total-cost) 925)
    )
  )
  (:action choose_schedule_s2
    :parameters (?t - agent ?l - location)
    :precondition (and
      (at ?t ?l)
      (not (having_met_joseph))
    )
    :effect (and
      (having_met_joseph)
      (increase (total-cost) 850)
    )
  )
  (:action choose_schedule_s3
    :parameters (?t - agent ?l - location)
    :precondition (and
      (at ?t ?l)
      (not (having_met_joseph))
    )
    :effect (and
      (having_met_joseph)
      (increase (total-cost) 775)
    )
  )
)