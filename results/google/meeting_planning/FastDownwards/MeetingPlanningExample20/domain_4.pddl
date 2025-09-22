(define (domain joint-meeting-fd)
  (:requirements :typing :adl :negative-preconditions :fluents)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - time)
    (can-step-8 ?t1 - time ?t2 - time)
    (can-step-6 ?t1 - time ?t2 - time)
    (can-meet ?t1 - time ?t2 - time)
    (met ?a - agent ?b - agent)
  )

  (:functions (total-cost))

  (:action travel-8
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from) (current-time ?t1) (can-step-8 ?t1 ?t2))
    :effect (and
              (not (at ?a ?from))
              (at ?a ?to)
              (not (current-time ?t1))
              (current-time ?t2)
              (increase (total-cost) 8)
            )
  )

  (:action travel-6
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from) (current-time ?t1) (can-step-6 ?t1 ?t2))
    :effect (and
              (not (at ?a ?from))
              (at ?a ?to)
              (not (current-time ?t1))
              (current-time ?t2)
              (increase (total-cost) 6)
            )
  )

  (:action meet
    :parameters (?a - agent ?b - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
                    (at ?a ?loc)
                    (at ?b ?loc)
                    (current-time ?t1)
                    (can-meet ?t1 ?t2)
                  )
    :effect (and
              (met ?a ?b)
              (not (current-time ?t1))
              (current-time ?t2)
              (increase (total-cost) 75)
            )
  )
)