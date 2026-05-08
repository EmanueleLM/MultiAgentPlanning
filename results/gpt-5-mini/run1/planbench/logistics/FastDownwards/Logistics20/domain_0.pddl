(define (domain logistics-multiagent)
  ; Requirements limited to those supported by the target solver
  (:requirements :strips :typing :negative-preconditions)

  (:types city location truck airplane package)

  (:predicates
    ; Location and city relations
    (loc-in-city ?l - location ?c - city)
    (airport ?l - location)

    ; Connectivity
    (connected-road ?l1 - location ?l2 - location)
    (connected-air ?l1 - location ?l2 - location)

    ; Positions
    (truck-at ?t - truck ?l - location)
    (plane-at ?a - airplane ?l - location)
    (at ?p - package ?l - location)

    ; Package containment and availability
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
    (free ?p - package)
  )

  ; Truck actions (distinct from airplane actions)
  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (at ?p ?loc)
      (free ?p)
    )
    :effect (and
      (not (at ?p ?loc))
      (in-truck ?p ?t)
      (not (free ?p))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (in-truck ?p ?t)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at ?p ?loc)
      (free ?p)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?t ?from)
      (connected-road ?from ?to)
      (loc-in-city ?from ?c)
      (loc-in-city ?to ?c)  ; enforce drive only within same city
    )
    :effect (and
      (not (truck-at ?t ?from))
      (truck-at ?t ?to)
    )
  )

  ; Airplane actions (distinct from truck actions)
  (:action plane-load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (plane-at ?a ?loc)
      (airport ?loc)
      (at ?p ?loc)
      (free ?p)
    )
    :effect (and
      (not (at ?p ?loc))
      (in-plane ?p ?a)
      (not (free ?p))
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (plane-at ?a ?loc)
      (airport ?loc)
      (in-plane ?p ?a)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at ?p ?loc)
      (free ?p)
    )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (plane-at ?a ?from)
      (airport ?from)
      (airport ?to)
      (connected-air ?from ?to)
    )
    :effect (and
      (not (plane-at ?a ?from))
      (plane-at ?a ?to)
    )
  )
)