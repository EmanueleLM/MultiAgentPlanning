(define (domain orchestrator)
  (:requirements :strips :typing)
  (:types truck package location city airplane)

  (:predicates
    ;; location/position predicates
    (truck-at ?t - truck ?l - location)
    (package-at ?p - package ?l - location)
    (airplane-at ?a - airplane ?l - location)

    ;; load-state predicates
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; static/topology predicates
    (loc-in-city ?l - location ?c - city)
    (airport ?l - location)
    (connected ?l1 - location ?l2 - location)
  )

  ;; Truck operator actions (prefixed with truck- to show agent)
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
      (loc-in-city ?from ?c)
      (loc-in-city ?to ?c)
      (connected ?from ?to)
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
    )
  )

  ;; Airplane operator actions (prefixed with plane- to show agent)
  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane-at ?a ?l)
      (package-at ?p ?l)
      (airport ?l)
    )
    :effect (and
      (in-airplane ?p ?a)
      (not (package-at ?p ?l))
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane-at ?a ?l)
      (in-airplane ?p ?a)
      (airport ?l)
    )
    :effect (and
      (package-at ?p ?l)
      (not (in-airplane ?p ?a))
    )
  )

  (:action plane-fly
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