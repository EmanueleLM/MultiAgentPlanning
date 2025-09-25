(define (domain meetings-classical)
  (:requirements :strips :typing :negative-preconditions :equality :action-costs)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (free ?a - agent)
    (met)
    (at-time ?a - agent ?t - time)
    (skip12 ?t1 - time ?t2 - time)
    (skip11 ?t1 - time ?t2 - time)
    (plus30 ?t1 - time ?t2 - time)
  )

  (:action visitor-travel-md-to-haight
    :parameters (?t1 ?t2 - time)
    :precondition (and (at visitor missiondistrict) (free visitor) (at-time visitor ?t1) (skip12 ?t1 ?t2))
    :effect (and
              (not (at visitor missiondistrict))
              (at visitor haightashbury)
              (not (at-time visitor ?t1))
              (at-time visitor ?t2)
            )
    :cost 12
  )

  (:action visitor-travel-haight-to-md
    :parameters (?t1 ?t2 - time)
    :precondition (and (at visitor haightashbury) (free visitor) (at-time visitor ?t1) (skip11 ?t1 ?t2))
    :effect (and
              (not (at visitor haightashbury))
              (at visitor missiondistrict)
              (not (at-time visitor ?t1))
              (at-time visitor ?t2)
            )
    :cost 11
  )

  (:action margaret-travel-haight-to-md
    :parameters (?t1 ?t2 - time)
    :precondition (and (at margaret haightashbury) (free margaret) (at-time margaret ?t1) (skip11 ?t1 ?t2))
    :effect (and
              (not (at margaret haightashbury))
              (at margaret missiondistrict)
              (not (at-time margaret ?t1))
              (at-time margaret ?t2)
            )
    :cost 11
  )

  (:action margaret-travel-md-to-haight
    :parameters (?t1 ?t2 - time)
    :precondition (and (at margaret missiondistrict) (free margaret) (at-time margaret ?t1) (skip12 ?t1 ?t2))
    :effect (and
              (not (at margaret missiondistrict))
              (at margaret haightashbury)
              (not (at-time margaret ?t1))
              (at-time margaret ?t2)
            )
    :cost 12
  )

  (:action meet-visitor-margaret
    :parameters (?loc - location ?t1 ?t2 - time)
    :precondition (and
                    (at visitor ?loc)
                    (at margaret ?loc)
                    (free visitor)
                    (free margaret)
                    (at-time visitor ?t1)
                    (at-time margaret ?t1)
                    (plus30 ?t1 ?t2)
                  )
    :effect (and
              (met)
              (not (at-time visitor ?t1))
              (not (at-time margaret ?t1))
              (at-time visitor ?t2)
              (at-time margaret ?t2)
            )
    :cost 0
  )
)