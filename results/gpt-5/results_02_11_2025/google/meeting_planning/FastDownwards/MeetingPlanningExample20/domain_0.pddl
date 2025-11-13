(define (domain meeting_planner_sf)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (having_met_joseph)
  )
  (:functions (total-cost))
  (:action choose_schedule_A
    :parameters (?t - agent ?l - location)
    :precondition (and (at ?t ?l) (not (having_met_joseph)))
    :effect (and
      (having_met_joseph)
      (increase (total-cost) 895)
    )
  )
  (:action choose_schedule_B
    :parameters (?t - agent ?l - location)
    :precondition (and (at ?t ?l) (not (having_met_joseph)))
    :effect (and
      (having_met_joseph)
      (increase (total-cost) 925)
    )
  )
  (:action choose_schedule_C
    :parameters (?t - agent ?l - location)
    :precondition (and (at ?t ?l) (not (having_met_joseph)))
    :effect (and
      (having_met_joseph)
      (increase (total-cost) 820)
    )
  )
  (:action choose_schedule_D
    :parameters (?t - agent ?l - location)
    :precondition (and (at ?t ?l) (not (having_met_joseph)))
    :effect (and
      (having_met_joseph)
      (increase (total-cost) 880)
    )
  )
)