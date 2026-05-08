(define (domain Logistics1)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    (package-at ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (truck-at ?t - truck ?l - location)
    (airplane-at ?a - airplane ?l - location)
    (located-in-city ?l - location ?c - city)
    (airport ?l - location)
  )

  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
      (package-at ?p ?l)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (package-at ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (package-at ?p ?l)
      (not (in-truck ?p ?t))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?t ?from)
      (located-in-city ?from ?c)
      (located-in-city ?to ?c)
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
    )
  )

  (:action airplane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane-at ?a ?l)
      (airport ?l)
      (package-at ?p ?l)
    )
    :effect (and
      (in-airplane ?p ?a)
      (not (package-at ?p ?l))
    )
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane-at ?a ?l)
      (airport ?l)
      (in-airplane ?p ?a)
    )
    :effect (and
      (package-at ?p ?l)
      (not (in-airplane ?p ?a))
    )
  )

  (:action airplane-fly
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