(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  ;; Predicates
  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
    (airport ?l - location)
    (road ?from - location ?to - location)
    (flight-route ?from - location ?to - location)
    (in-city ?l - location ?c - city)
  )

  ;; Truck actions
  (:action load-truck
    :parameters (?t - truck ?pkg - package ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (at-package ?pkg ?loc)
    )
    :effect (and
      (in-truck ?pkg ?t)
      (not (at-package ?pkg ?loc))
    )
  )

  (:action unload-truck
    :parameters (?t - truck ?pkg - package ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?pkg ?t)
    )
    :effect (and
      (at-package ?pkg ?loc)
      (not (in-truck ?pkg ?t))
    )
  )

  (:action drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at-truck ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  ;; Airplane actions (kept distinct)
  (:action load-plane
    :parameters (?a - airplane ?pkg - package ?loc - location)
    :precondition (and
      (at-plane ?a ?loc)
      (airport ?loc)
      (at-package ?pkg ?loc)
    )
    :effect (and
      (in-plane ?pkg ?a)
      (not (at-package ?pkg ?loc))
    )
  )

  (:action unload-plane
    :parameters (?a - airplane ?pkg - package ?loc - location)
    :precondition (and
      (at-plane ?a ?loc)
      (airport ?loc)
      (in-plane ?pkg ?a)
    )
    :effect (and
      (at-package ?pkg ?loc)
      (not (in-plane ?pkg ?a))
    )
  )

  (:action fly
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