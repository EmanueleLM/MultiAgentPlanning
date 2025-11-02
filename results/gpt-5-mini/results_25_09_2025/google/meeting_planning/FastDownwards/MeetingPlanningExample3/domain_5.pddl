(define (domain meeting-domain)
  (:requirements :strips :typing)
  (:types agent location time)
  (:predicates
    (at-time ?a - agent ?l - location ?t - time)
    (plus1 ?t - time ?t1 - time)
    (plus22 ?t - time ?t2 - time)
    (interval90 ?s - time ?e - time)
    (in-interval ?s - time ?e - time ?t - time)
    (travel22 ?from - location ?to - location)
    (met)
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and
      (at-time ?a ?from ?t)
      (travel22 ?from ?to)
      (plus22 ?t ?t2)
    )
    :effect (and
      (at-time ?a ?to ?t2)
    )
  )

  (:action wait
    :parameters (?a - agent ?l - location ?t - time ?t1 - time)
    :precondition (and
      (at-time ?a ?l ?t)
      (plus1 ?t ?t1)
    )
    :effect (and
      (at-time ?a ?l ?t1)
    )
  )

  (:action start-meeting
    :parameters (?a1 - agent ?a2 - agent ?loc - location ?s - time ?e - time)
    :precondition (and
      (interval90 ?s ?e)
      (at-time ?a1 ?loc ?s)
      (at-time ?a2 ?loc ?s)
    )
    :effect (and
      (met)
    )
  )
)