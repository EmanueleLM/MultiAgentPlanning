(define (domain logistics36)
  (:requirements :strips :typing)
  (:types
    vehicle - object
    truck airplane - vehicle
    package location city - object
  )

  (:predicates
    (at-package ?p - package ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (in-city ?l - location ?c - city)
    (is-airport ?l - location)
  )

  (:action load-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-truck ?p ?t)
    )
  )

  (:action unload-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?l)
    )
  )

  (:action load-package-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-airplane ?a ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-airplane ?p ?a)
    )
  )

  (:action unload-package-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in-airplane ?p ?a)
      (at-airplane ?a ?l)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-package ?p ?l)
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?a ?from)
      (is-airport ?from)
      (is-airport ?to)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )
)