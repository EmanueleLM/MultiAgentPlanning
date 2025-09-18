(define (domain integrated-meeting)
  (:requirements :strips :typing :adl :fluents :negative-preconditions)
  (:types agent location starttime duration)

  (:predicates
    (at ?a - agent ?l - location)
    (met)
    (depart_ok ?s - starttime)
    (arrived_for ?s - starttime)
    (can_meet ?s - starttime ?d - duration)
    (next7 ?s1 - starttime ?s2 - starttime)
  )

  (:functions (total-cost))

  (:action travel
    :parameters (?depart - starttime ?arrive - starttime ?a - agent ?from - location ?to - location)
    :precondition (and (at ?a ?from) (depart_ok ?depart) (next7 ?depart ?arrive))
    :effect (and
              (not (at ?a ?from))
              (at ?a ?to)
              (arrived_for ?arrive)
              (increase (total-cost) 7)
            )
  )

  (:action wait
    :parameters (?depart - starttime ?arrive - starttime ?a - agent ?loc - location)
    :precondition (and (at ?a ?loc) (depart_ok ?depart) (next7 ?depart ?arrive))
    :effect (and
              (arrived_for ?arrive)
              (increase (total-cost) 0)
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
              (increase (total-cost) 0)
            )
  )
)