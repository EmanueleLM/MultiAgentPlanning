(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (current ?t - time)
    (next ?t - time ?t2 - time)
    (travel-c2m ?ts - time ?tend - time)
    (travel-m2c ?ts - time ?tend - time)
    (meet-block ?ts - time ?tend - time)
    (meeting-scheduled)
  )

  (:functions
    (total-cost)
  )

  (:action travel-chinatown-to-marina
    :parameters (?a - agent ?ts - time ?tend - time)
    :precondition (and
      (current ?ts)
      (at ?a Chinatown)
      (travel-c2m ?ts ?tend)
      (not (meeting-scheduled))
    )
    :effect (and
      (not (current ?ts))
      (current ?tend)
      (not (at ?a Chinatown))
      (at ?a Marina)
      (increase (total-cost) 12)
    )
  )

  (:action travel-marina-to-chinatown
    :parameters (?a - agent ?ts - time ?tend - time)
    :precondition (and
      (current ?ts)
      (at ?a Marina)
      (travel-m2c ?ts ?tend)
      (not (meeting-scheduled))
    )
    :effect (and
      (not (current ?ts))
      (current ?tend)
      (not (at ?a Marina))
      (at ?a Chinatown)
      (increase (total-cost) 16)
    )
  )

  (:action wait-one-minute
    :parameters (?a - agent ?ts - time ?tend - time)
    :precondition (and
      (current ?ts)
      (next ?ts ?tend)
      (not (meeting-scheduled))
    )
    :effect (and
      (not (current ?ts))
      (current ?tend)
      (increase (total-cost) 1)
    )
  )

  (:action start-meeting-105
    :parameters (?ts - time ?tend - time ?loc - location)
    :precondition (and
      (current ?ts)
      (at you ?loc)
      (at steph ?loc)
      (meet-block ?ts ?tend)
      (not (meeting-scheduled))
    )
    :effect (and
      (not (current ?ts))
      (current ?tend)
      (meeting-scheduled)
      (increase (total-cost) 0)
    )
  )
)