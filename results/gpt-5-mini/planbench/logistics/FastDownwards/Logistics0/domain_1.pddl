(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; explicit location predicates per object type
    (at-package ?p - package ?loc - location)
    (at-truck ?t - truck ?loc - location)
    (at-airplane ?a - airplane ?loc - location)

    ;; containment predicates
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; location membership and airport / air connectivity
    (in-city ?loc - location ?c - city)
    (airport ?loc - location)
    (airlink ?from - location ?to - location)
  )

  ;; Truck-related actions
  (:action load-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at-package ?p ?loc)
      (at-truck ?t ?loc)
      (not (in-truck ?p ?t))
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-package ?p ?loc))
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?loc)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
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

  ;; Airplane-related actions
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at-package ?p ?loc)
      (at-airplane ?a ?loc)
      (airport ?loc)
      (not (in-airplane ?p ?a))
    )
    :effect (and
      (in-airplane ?p ?a)
      (not (at-package ?p ?loc))
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in-airplane ?p ?a)
      (at-airplane ?a ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-package ?p ?loc)
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (airlink ?from ?to)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )
)