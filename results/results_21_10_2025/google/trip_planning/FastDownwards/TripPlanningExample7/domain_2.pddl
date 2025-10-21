(define (domain trip-domain)
  (:requirements :typing :negative-preconditions)
  (:types agent city daytoken needtoken)

  (:predicates
    (at ?a - agent ?c - city)
    (direct-flight ?from - city ?to - city)
    (unallocated ?d - daytoken)
    (allocated ?d - daytoken ?c - city)
    (need ?n - needtoken ?c - city)
    (visited ?c - city)
  )

  (:action fly
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at ?a ?from) (direct-flight ?from ?to))
    :effect (and
              (not (at ?a ?from))
              (at ?a ?to)
            )
  )

  (:action allocate-day
    :parameters (?a - agent ?d - daytoken ?n - needtoken ?c - city)
    :precondition (and (at ?a ?c) (unallocated ?d) (need ?n ?c))
    :effect (and
             (not (unallocated ?d))
             (allocated ?d ?c)
             (not (need ?n ?c))
             (visited ?c)
            )
  )
)