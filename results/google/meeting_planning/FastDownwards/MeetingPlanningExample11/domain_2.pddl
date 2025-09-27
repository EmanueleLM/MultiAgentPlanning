(define (domain meet-visitors-classical)
  (:requirements :typing :negative-preconditions :fluents)
  (:types person location time)
  (:constants nob_hill sunset_district - location)
  (:predicates
    (at-time ?p - person ?l - location ?t - time)
    (available-at ?p - person ?t - time)
    (met ?p - person)
    (accounted ?p - person)
    (le ?t1 - time ?t2 - time)
    (plus25 ?t - time ?t2 - time)
    (plus27 ?t - time ?t2 - time)
    (meeting-slot ?t - time)
  )
  (:functions (total-cost))

  (:action travel-nobhill-to-sunset
    :parameters (?p - person ?t - time ?t2 - time)
    :precondition (and (at-time ?p nob_hill ?t) (plus25 ?t ?t2))
    :effect (and (not (at-time ?p nob_hill ?t)) (at-time ?p sunset_district ?t2))
  )

  (:action travel-sunset-to-nobhill
    :parameters (?p - person ?t - time ?t2 - time)
    :precondition (and (at-time ?p sunset_district ?t) (plus27 ?t ?t2))
    :effect (and (not (at-time ?p sunset_district ?t)) (at-time ?p nob_hill ?t2))
  )

  (:action meet-with-carol
    :parameters (?v - person ?c - person ?t - time)
    :precondition (and (meeting-slot ?t) (not (met ?c)) (at-time ?v sunset_district ?t) (at-time ?c sunset_district ?t))
    :effect (and (met ?c) (accounted ?c))
  )

  (:action skip-carol
    :parameters (?c - person)
    :precondition (not (accounted ?c))
    :effect (and (accounted ?c) (increase (total-cost) 1))
  )
)