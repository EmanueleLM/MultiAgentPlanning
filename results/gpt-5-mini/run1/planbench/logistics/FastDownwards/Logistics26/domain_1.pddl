(define (domain multi_modal_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane - vehicle city location package)

  (:predicates
    (at ?v - vehicle ?l - location)
    (at_pkg ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (airport ?l - location)
    (loc_in_city ?l - location ?c - city)
  )

  (:action truck_agent_load
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

  (:action truck_agent_unload
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

  (:action truck_agent_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action airplane_agent_load
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

  (:action airplane_agent_unload
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

  (:action airplane_agent_fly
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
)