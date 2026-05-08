(define (domain logistics20)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
    (airport ?l - location)
    (in-city ?l - location ?c - city)
    (flight-route ?from - location ?to - location)
  )

  ;; Truck actions
  (:action load-into-truck
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (at-package ?p ?loc)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-package ?p ?loc))
    )
  )

  (:action unload-from-truck
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
    )
    :effect (and
      (at-package ?p ?loc)
      (not (in-truck ?p ?t))
    )
  )

  ;; Drive within the same city: requires both locations to be in the same city
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  ;; Airplane actions
  (:action load-into-plane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at-plane ?a ?loc)
      (airport ?loc)
      (at-package ?p ?loc)
    )
    :effect (and
      (in-plane ?p ?a)
      (not (at-package ?p ?loc))
    )
  )

  (:action unload-from-plane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at-plane ?a ?loc)
      (airport ?loc)
      (in-plane ?p ?a)
    )
    :effect (and
      (at-package ?p ?loc)
      (not (in-plane ?p ?a))
    )
  )

  ;; Fly only along declared flight routes between airports
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-plane ?a ?from)
      (airport ?from)
      (airport ?to)
      (flight-route ?from ?to)
    )
    :effect (and
      (at-plane ?a ?to)
      (not (at-plane ?a ?from))
    )
  )
)