(define (domain MeetingPlanningExample15)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (time-link ?t1 - time ?t2 - time)
    (available-interval ?t1 - time ?t2 - time)
    (met ?a - agent ?b - agent)
  )

  (:action wait
    :parameters (?a - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (time-link ?t1 ?t2))
    :effect (and (not (at ?a ?l ?t1)) (at ?a ?l ?t2))
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from ?t1) (time-link ?t1 ?t2))
    :effect (and (not (at ?a ?from ?t1)) (at ?a ?to ?t2))
  )

  (:action meet
    :parameters (?a - agent ?b - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?loc ?t1) (at ?b ?loc ?t1) (available-interval ?t1 ?t2) (time-link ?t1 ?t2))
    :effect (and (met ?a ?b) (not (at ?a ?loc ?t1)) (not (at ?b ?loc ?t1)) (at ?a ?loc ?t2) (at ?b ?loc ?t2))
  )
)