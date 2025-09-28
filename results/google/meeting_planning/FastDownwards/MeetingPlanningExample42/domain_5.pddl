(define (domain traveler-timothy-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)
  (:constants nob_hill presidio - location)
  (:predicates
    (at-time ?a - agent ?l - location ?t - time)
    (plus1 ?t1 - time ?t2 - time)
    (plus17 ?t1 - time ?t2 - time)
    (plus18 ?t1 - time ?t2 - time)
    (plus30 ?t1 - time ?t2 - time)
    (timothy-available-start ?t - time)
    (met-with-timothy)
    (is-traveler ?a - agent)
  )

  (:action travel-nob-to-presidio
    :parameters (?tr - agent ?t - time ?t2 - time)
    :precondition (and (is-traveler ?tr) (at-time ?tr nob_hill ?t) (plus17 ?t ?t2))
    :effect (and (not (at-time ?tr nob_hill ?t)) (at-time ?tr presidio ?t2))
  )

  (:action travel-presidio-to-nob
    :parameters (?tr - agent ?t - time ?t2 - time)
    :precondition (and (is-traveler ?tr) (at-time ?tr presidio ?t) (plus18 ?t ?t2))
    :effect (and (not (at-time ?tr presidio ?t)) (at-time ?tr nob_hill ?t2))
  )

  (:action wait-1
    :parameters (?tr - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (is-traveler ?tr) (at-time ?tr ?loc ?t) (plus1 ?t ?t2))
    :effect (and (not (at-time ?tr ?loc ?t)) (at-time ?tr ?loc ?t2))
  )

  (:action meet-with-timothy
    :parameters (?tr - agent ?t - time ?t2 - time)
    :precondition (and (is-traveler ?tr) (at-time ?tr presidio ?t) (plus30 ?t ?t2) (timothy-available-start ?t))
    :effect (and (not (at-time ?tr presidio ?t)) (at-time ?tr presidio ?t2) (met-with-timothy))
  )
)