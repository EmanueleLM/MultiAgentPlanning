(define (domain logistics22)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-pkg ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (airport ?l - location)
    (in_city ?l - location ?c - city)
    (free-truck ?t - truck)
    (free-airplane ?a - airplane)
  )

  ;; Truck actions (operate inside a city)
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
      (free-truck ?t)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in-truck ?p ?t)
      (not (free-truck ?t))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-pkg ?p ?l)
      (free-truck ?t)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Airplane actions (operate between airports)
  (:action airplane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at-airplane ?a ?l)
      (at-pkg ?p ?l)
      (free-airplane ?a)
      (airport ?l)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in-airplane ?p ?a)
      (not (free-airplane ?a))
    )
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at-airplane ?a ?l)
      (in-airplane ?p ?a)
      (airport ?l)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-pkg ?p ?l)
      (free-airplane ?a)
    )
  )

  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (in_city ?from ?cfrom)
      (in_city ?to ?cto)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )
)