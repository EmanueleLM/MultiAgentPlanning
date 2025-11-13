(define (domain meeting_planner_sf)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (having_met_joseph)
    (start ?l - location)
    (feasible-s1)
    (feasible-s2)
    (feasible-s3)
  )
  (:functions (total-cost))

  (:action choose_schedule_s1
    :parameters (?t - agent ?s - location)
    :precondition (and
      (at ?t ?s)
      (start ?s)
      (feasible-s1)
      (not (having_met_joseph))
    )
    :effect (and
      (having_met_joseph)
      (increase (total-cost) 925)
    )
  )

  (:action choose_schedule_s2
    :parameters (?t - agent ?s - location)
    :precondition (and
      (at ?t ?s)
      (start ?s)
      (feasible-s2)
      (not (having_met_joseph))
    )
    :effect (and
      (having_met_joseph)
      (increase (total-cost) 850)
    )
  )

  (:action choose_schedule_s3
    :parameters (?t - agent ?s - location)
    :precondition (and
      (at ?t ?s)
      (start ?s)
      (feasible-s3)
      (not (having_met_joseph))
    )
    :effect (and
      (having_met_joseph)
      (increase (total-cost) 775)
    )
  )
)