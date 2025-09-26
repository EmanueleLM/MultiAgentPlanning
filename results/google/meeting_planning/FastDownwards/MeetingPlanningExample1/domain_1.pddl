(define (domain sf-meeting)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent location time duration)
  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (can-travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (can-wait ?t1 - time ?t2 - time)
    (can-meet ?t1 - time ?t2 - time ?d - duration)
    (met ?d - duration)
  )

  (:action travel
    :parameters (?a - agent ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l1 ?t1) (can-travel ?l1 ?l2 ?t1 ?t2))
    :effect (and (not (at ?a ?l1 ?t1)) (at ?a ?l2 ?t2))
    :cost 0
  )

  (:action wait
    :parameters (?a - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (can-wait ?t1 ?t2))
    :effect (and (not (at ?a ?l ?t1)) (at ?a ?l ?t2))
    :cost 0
  )

  (:action meet-60
    :parameters (?a - agent ?b - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (at ?b ?l ?t1) (can-meet ?t1 ?t2 dur60))
    :effect (and (not (at ?a ?l ?t1)) (not (at ?b ?l ?t1)) (at ?a ?l ?t2) (at ?b ?l ?t2) (met dur60))
    :cost 210
  )

  (:action meet-120
    :parameters (?a - agent ?b - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (at ?b ?l ?t1) (can-meet ?t1 ?t2 dur120))
    :effect (and (not (at ?a ?l ?t1)) (not (at ?b ?l ?t1)) (at ?a ?l ?t2) (at ?b ?l ?t2) (met dur120))
    :cost 150
  )

  (:action meet-180
    :parameters (?a - agent ?b - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (at ?b ?l ?t1) (can-meet ?t1 ?t2 dur180))
    :effect (and (not (at ?a ?l ?t1)) (not (at ?b ?l ?t1)) (at ?a ?l ?t2) (at ?b ?l ?t2) (met dur180))
    :cost 90
  )

  (:action meet-240
    :parameters (?a - agent ?b - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (at ?b ?l ?t1) (can-meet ?t1 ?t2 dur240))
    :effect (and (not (at ?a ?l ?t1)) (not (at ?b ?l ?t1)) (at ?a ?l ?t2) (at ?b ?l ?t2) (met dur240))
    :cost 30
  )

  (:action meet-270
    :parameters (?a - agent ?b - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (at ?b ?l ?t1) (can-meet ?t1 ?t2 dur270))
    :effect (and (not (at ?a ?l ?t1)) (not (at ?b ?l ?t1)) (at ?a ?l ?t2) (at ?b ?l ?t2) (met dur270))
    :cost 0
  )
)