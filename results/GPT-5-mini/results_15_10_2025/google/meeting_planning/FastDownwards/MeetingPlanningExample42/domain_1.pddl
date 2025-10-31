(define (domain traveler-timothy-meeting)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location time)
  (:predicates
    (at-time ?a - agent ?l - location ?t - time)
    (plus1 ?t1 - time ?t2 - time)
    (plus17 ?t1 - time ?t2 - time)
    (plus18 ?t1 - time ?t2 - time)
    (plus30 ?t1 - time ?t2 - time)
    (timothy-available-start ?t - time)
    (met-with-timothy)
  )

  (:action travel-nob-to-presidio
    :parameters (?t - time ?t2 - time)
    :precondition (and (at-time traveler nob_hill ?t) (plus17 ?t ?t2))
    :effect (and (not (at-time traveler nob_hill ?t)) (at-time traveler presidio ?t2))
    :cost 17
  )

  (:action travel-presidio-to-nob
    :parameters (?t - time ?t2 - time)
    :precondition (and (at-time traveler presidio ?t) (plus18 ?t ?t2))
    :effect (and (not (at-time traveler presidio ?t)) (at-time traveler nob_hill ?t2))
    :cost 18
  )

  (:action wait-1
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (at-time traveler ?loc ?t) (plus1 ?t ?t2))
    :effect (and (not (at-time traveler ?loc ?t)) (at-time traveler ?loc ?t2))
    :cost 1
  )

  (:action meet-with-timothy
    :parameters (?t - time ?t2 - time)
    :precondition (and (at-time traveler presidio ?t) (plus30 ?t ?t2) (timothy-available-start ?t))
    :effect (and (not (at-time traveler presidio ?t)) (at-time traveler presidio ?t2) (met-with-timothy))
    :cost 30
  )
)