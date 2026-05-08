(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (clock ?t - time)
    (met ?p - person)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_wait ?t1 ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time)
  )

  ;; Travel between locations which consumes time based on distance.
  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from) (clock ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (clock ?t1)) (clock ?t2))
  )

  ;; Wait at a location to advance the clock to a specific milestone.
  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (clock ?t1) (can_wait ?t1 ?t2))
    :effect (and (not (clock ?t1)) (clock ?t2))
  )

  ;; Meet a person at a location during their available window for the required duration.
  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (clock ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (met ?p) (not (clock ?t1)) (clock ?t2))
  )
)