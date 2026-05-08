(define (domain cargo_orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck package location city airplane)

  (:predicates
    (truck-at ?t - truck ?l - location)
    (airplane-at ?a - airplane ?l - location)
    (pkg-at ?p - package ?l - location)

    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    (location-in-city ?l - location ?c - city)
    (airport ?l - location)
    (truck-of-city ?t - truck ?c - city)
  )

  (:action load-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
      (pkg-at ?p ?l)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (pkg-at ?p ?l))
    )
  )

  (:action unload-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (pkg-at ?p ?l)
      (not (in-truck ?p ?t))
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?t ?from)
      (truck-of-city ?t ?c)
      (location-in-city ?from ?c)
      (location-in-city ?to ?c)
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
    )
  )

  (:action load-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane-at ?a ?l)
      (pkg-at ?p ?l)
      (airport ?l)
    )
    :effect (and
      (in-airplane ?p ?a)
      (not (pkg-at ?p ?l))
    )
  )

  (:action unload-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane-at ?a ?l)
      (in-airplane ?p ?a)
      (airport ?l)
    )
    :effect (and
      (pkg-at ?p ?l)
      (not (in-airplane ?p ?a))
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane-at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (airplane-at ?a ?to)
      (not (airplane-at ?a ?from))
    )
  )
)