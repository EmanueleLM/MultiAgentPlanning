(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent city daytoken)

  (:predicates
    (at ?a - agent ?c - city)
    (direct-flight ?from - city ?to - city)
    (unallocated ?d - daytoken)
    (allocated ?d - daytoken ?c - city)
    (visited ?c - city)
  )

  ;; Fly using only explicitly provided direct-flight facts.
  (:action fly
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at ?a ?from) (direct-flight ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  ;; Allocate a single day token to the city where the agent currently is.
  ;; This action both consumes a day token and marks the city as visited.
  (:action allocate-day
    :parameters (?a - agent ?c - city ?d - daytoken)
    :precondition (and (at ?a ?c) (unallocated ?d))
    :effect (and
             (not (unallocated ?d))
             (allocated ?d ?c)
             (visited ?c)
            )
  )
)