(define (domain meet-matthew)
  (:requirements :typing :negative-preconditions)
  (:types person location timepoint)

  (:predicates
    (at ?p - person ?l - location ?t - timepoint)
    (travel_leg ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (wait_leg ?l - location ?t1 - timepoint ?t2 - timepoint)
    (allowed_meeting ?start - timepoint ?end - timepoint)
    (met_matt)
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?d - timepoint ?a - timepoint)
    :precondition (and (at ?p ?from ?d) (travel_leg ?from ?to ?d ?a))
    :effect (and (not (at ?p ?from ?d)) (at ?p ?to ?a))
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at ?p ?l ?t1) (wait_leg ?l ?t1 ?t2))
    :effect (and (not (at ?p ?l ?t1)) (at ?p ?l ?t2))
  )

  (:action meet_matt
    :parameters (?p - person ?mate - person ?loc - location ?s - timepoint ?e - timepoint)
    :precondition (and (at ?p ?loc ?s) (allowed_meeting ?s ?e) (not (met_matt)))
    :effect (and (met_matt) (not (at ?p ?loc ?s)) (at ?p ?loc ?e))
  )
)