(define (domain integrated-meeting)
  (:requirements :strips :typing :fluents :adl)
  (:types agent location starttime duration)

  (:predicates
    (at ?a - agent ?l - location)
    (met)
    (depart_ok ?s - starttime)
    (arrived_for ?s - starttime)
    (can_meet ?s - starttime ?d - duration)
  )

  (:functions (total-cost))

  (:action travel
    :parameters (?s - starttime ?a - agent ?from - location ?to - location)
    :precondition (and (at ?a ?from) (depart_ok ?s))
    :effect (and
              (not (at ?a ?from))
              (at ?a ?to)
              (arrived_for ?s)
            )
  )

  (:action meet
    :parameters (?s - starttime ?d - duration ?trav - agent ?sarah - agent ?loc - location)
    :precondition (and
                    (at ?trav ?loc)
                    (at ?sarah ?loc)
                    (arrived_for ?s)
                    (can_meet ?s ?d)
                    (not (met))
                  )
    :effect (and
              (met)
            )
  )
)