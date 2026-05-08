(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?loc - location ?t - time)
    (travel-edge ?from - location ?to - location ?t1 - time ?t2 - time)
    (wait-edge ?t1 - time ?t2 - time)
    (available-james ?t1 - time ?t2 - time)
    (met)
  )

  (:action wait
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?loc ?t1) (wait-edge ?t1 ?t2))
    :effect (and (not (at ?a ?loc ?t1)) (at ?a ?loc ?t2))
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from ?t1) (travel-edge ?from ?to ?t1 ?t2))
    :effect (and (not (at ?a ?from ?t1)) (at ?a ?to ?t2))
  )

  (:action meet-james
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?loc ?t1) (available-james ?t1 ?t2))
    :effect (and (not (at ?a ?loc ?t1)) (at ?a ?loc ?t2) (met))
  )
)