(define (domain logistics0)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; positions
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; containment
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; location attributes
    (airport ?l - location)
    (in-city ?l - location ?c - city)
  )

  ;; Truck actions
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-truck ?t ?l)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-package ?p ?l))
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?l)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-truck ?p ?t))
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

  ;; Airplane actions
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-airplane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (in-airplane ?p ?a)
      (not (at-package ?p ?l))
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in-airplane ?p ?a)
      (at-airplane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-airplane ?p ?a))
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )
)