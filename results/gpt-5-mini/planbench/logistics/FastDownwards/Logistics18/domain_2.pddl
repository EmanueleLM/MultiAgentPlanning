(define (domain transport-domain)
  (:requirements :typing :negative-preconditions)
  (:types
    package
    location
    city
    vehicle
    truck airplane - vehicle
  )

  (:predicates
    (in-city ?l - location ?c - city)
    (airport ?l - location)
    (truck-of-city ?t - truck ?c - city)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (in_any ?p - package)
    (same-city ?l1 - location ?l2 - location)
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (in-city ?l ?c)
      (truck-of-city ?t ?c)
      (at ?p ?l)
      (at-truck ?t ?l)
      (not (in_any ?p))
    )
    :effect (and
      (in ?p ?t)
      (in-truck ?p ?t)
      (in_any ?p)
      (not (at ?p ?l))
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (in-city ?l ?c)
      (truck-of-city ?t ?c)
      (in ?p ?t)
      (in-truck ?p ?t)
      (at-truck ?t ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?t))
      (not (in-truck ?p ?t))
      (not (in_any ?p))
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (in-city ?from ?c)
      (in-city ?to ?c)
      (truck-of-city ?t ?c)
      (at-truck ?t ?from)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location ?c - city)
    :precondition (and
      (airport ?l)
      (in-city ?l ?c)
      (at-airplane ?a ?l)
      (at ?p ?l)
      (not (in_any ?p))
    )
    :effect (and
      (in ?p ?a)
      (in-airplane ?p ?a)
      (in_any ?p)
      (not (at ?p ?l))
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location ?c - city)
    :precondition (and
      (airport ?l)
      (in-city ?l ?c)
      (in ?p ?a)
      (in-airplane ?p ?a)
      (at-airplane ?a ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?a))
      (not (in-airplane ?p ?a))
      (not (in_any ?p))
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airport ?from)
      (airport ?to)
      (at-airplane ?a ?from)
      (not (same-city ?from ?to))
    )
    :effect (and
      (at-airplane ?a ?to)
      (not (at-airplane ?a ?from))
    )
  )

)