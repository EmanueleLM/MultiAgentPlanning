(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    airplane truck - vehicle
    city location package vehicle
  )

  (:predicates
    (airport ?loc - location)
    (in_city ?loc - location ?c - city)
    (at ?v - vehicle ?loc - location)
    (at_pkg ?p - package ?loc - location)
    (in ?p - package ?v - vehicle)
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at_pkg ?p ?loc)
      (at ?t ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?t)
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in ?p ?t)
      (at ?t ?loc)
    )
    :effect (and
      (not (in ?p ?t))
      (at_pkg ?p ?loc)
    )
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at_pkg ?p ?loc)
      (at ?a ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?a)
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in ?p ?a)
      (at ?a ?loc)
    )
    :effect (and
      (not (in ?p ?a))
      (at_pkg ?p ?loc)
    )
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

  (:action fly-airplane
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