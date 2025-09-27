(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
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

  (:action travel-chinatown-to-marina
    :parameters (?a - agent ?ts - time ?tend - time)
    :precondition (and
      (current ?ts)
      (at ?a chinatown)
      (travel-c2m ?ts ?tend)
      (not (meeting-scheduled))
    )
    :effect (and
      (not (current ?ts))
      (current ?tend)
      (not (at ?a chinatown))
      (at ?a marina)
    )
  )

  (:action travel-marina-to-chinatown
    :parameters (?a - agent ?ts - time ?tend - time)
    :precondition (and
      (current ?ts)
      (at ?a marina)
      (travel-m2c ?ts ?tend)
      (not (meeting-scheduled))
    )
    :effect (and
      (not (current ?ts))
      (current ?tend)
      (not (at ?a marina))
      (at ?a chinatown)
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
    )
  )
)