(define (domain scheduling-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location ?t - time)
    (next1 ?t - time ?t2 - time)
    (step11 ?t - time ?t2 - time)
    (step90 ?t - time ?t2 - time)
    (meeting-start-allowed ?t - time)
    (kenneth-present ?t - time)
    (met-kenneth)
  )
  (:action travel-traveler-fw-to-nobhill
    :parameters (?t - time ?t2 - time)
    :precondition (and (at traveler fishermans-wharf ?t) (step11 ?t ?t2))
    :effect (and (not (at traveler fishermans-wharf ?t)) (at traveler nob-hill ?t2))
    :cost 11
  )
  (:action travel-traveler-nobhill-to-fw
    :parameters (?t - time ?t2 - time)
    :precondition (and (at traveler nob-hill ?t) (step11 ?t ?t2))
    :effect (and (not (at traveler nob-hill ?t)) (at traveler fishermans-wharf ?t2))
    :cost 11
  )
  (:action wait-traveler
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (at traveler ?loc ?t) (next1 ?t ?t2))
    :effect (and (not (at traveler ?loc ?t)) (at traveler ?loc ?t2))
    :cost 0
  )
  (:action meet-traveler-kenneth-1
    :parameters (?t - time ?t2 - time)
    :precondition (and (at traveler nob-hill ?t) (at kenneth nob-hill ?t) (next1 ?t ?t2) (kenneth-present ?t))
    :effect (and (not (at traveler nob-hill ?t)) (at traveler nob-hill ?t2))
    :cost 0
  )
  (:action meet-traveler-kenneth-90
    :parameters (?t - time ?t2 - time)
    :precondition (and (at traveler nob-hill ?t) (at kenneth nob-hill ?t) (meeting-start-allowed ?t) (step90 ?t ?t2) (kenneth-present ?t) (kenneth-present ?t2))
    :effect (and (not (at traveler nob-hill ?t)) (at traveler nob-hill ?t2) (met-kenneth))
    :cost 0
  )
)