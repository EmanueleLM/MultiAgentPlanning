(define (domain logistics25)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; locations of vehicles and packages
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; package-in-vehicle relations
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ;; static map facts
    (in-city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Truck actions
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-truck ?t ?l)
      ;; loading occurs only when package is physically at the location
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-truck ?p ?t)
    )
  )

  (:action unload-truck
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
  (:action load-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-airplane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-plane ?p ?a)
    )
  )

  (:action unload-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in-plane ?p ?a)
      (at-airplane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at-package ?p ?l)
    )
  )

  (:action fly-plane
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