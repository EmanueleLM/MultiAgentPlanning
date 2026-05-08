(define (domain logistics16)
  (:requirements :strips :typing :negative-preconditions)
  (:types vehicle package location city truck airplane - vehicle)

  (:predicates
    (at ?veh - vehicle ?loc - location)
    (at_pkg ?p - package ?loc - location)
    (in ?p - package ?veh - vehicle)
    (airport ?loc - location)
    (in_city ?loc - location ?c - city)
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action fly-plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  (:action load-truck
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at ?t ?loc)
      (at_pkg ?p ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?t)
    )
  )

  (:action unload-truck
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at ?t ?loc)
      (in ?p ?t)
    )
    :effect (and
      (not (in ?p ?t))
      (at_pkg ?p ?loc)
    )
  )

  (:action load-plane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at ?a ?loc)
      (at_pkg ?p ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?a)
    )
  )

  (:action unload-plane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at ?a ?loc)
      (in ?p ?a)
    )
    :effect (and
      (not (in ?p ?a))
      (at_pkg ?p ?loc)
    )
  )
)