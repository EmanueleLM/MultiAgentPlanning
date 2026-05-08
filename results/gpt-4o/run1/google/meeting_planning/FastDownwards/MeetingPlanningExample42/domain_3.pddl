(define (domain san_francisco_schedule)
  (:requirements :strips :typing)

  (:types
    location friend time_slot agent
  )

  (:predicates
    (at ?a - agent ?l - location)
    (visited ?f - friend)
    (present ?f - friend ?l - location ?t - time_slot)
    (can_meet ?a - agent ?f - friend ?l - location ?t - time_slot)
    (next ?t1 ?t2 - time_slot)
  )

  (:action travel
    :parameters (?from - location ?to - location ?a - agent ?t1 - time_slot ?t2 - time_slot)
    :precondition (and
      (at ?a ?from)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  (:action meet
    :parameters (?a - agent ?f - friend ?l - location ?t1 - time_slot ?t2 - time_slot)
    :precondition (and
      (at ?a ?l)
      (present ?f ?l ?t1)
      (can_meet ?a ?f ?l ?t2)
      (next ?t1 ?t2)
      (not (visited ?f))
    )
    :effect (visited ?f)
  )
)