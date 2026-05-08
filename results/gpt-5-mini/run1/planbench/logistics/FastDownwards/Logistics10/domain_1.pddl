(define (domain multi-modal-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    truck
    airplane
    package
    location
    city
  )

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-plane ?ap - airplane ?l - location)
    (at-pkg ?p - package ?l - location)

    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?ap - airplane)

    (in-city ?l - location ?c - city)
    (is-airport ?l - location)
    (connected-airports ?a1 - location ?a2 - location)
  )

  ;; Truck actions (namespaced)
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
      (not (in-truck ?p ?t))
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-pkg ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in-truck ?p ?t))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (not (at-truck ?t ?to))
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  ;; Airplane actions (namespaced)
  (:action plane-load
    :parameters (?ap - airplane ?p - package ?loc - location)
    :precondition (and
      (is-airport ?loc)
      (at-plane ?ap ?loc)
      (at-pkg ?p ?loc)
      (not (in-plane ?p ?ap))
    )
    :effect (and
      (in-plane ?p ?ap)
      (not (at-pkg ?p ?loc))
    )
  )

  (:action plane-unload
    :parameters (?ap - airplane ?p - package ?loc - location)
    :precondition (and
      (is-airport ?loc)
      (at-plane ?ap ?loc)
      (in-plane ?p ?ap)
    )
    :effect (and
      (at-pkg ?p ?loc)
      (not (in-plane ?p ?ap))
    )
  )

  (:action plane-fly
    :parameters (?ap - airplane ?from - location ?to - location)
    :precondition (and
      (is-airport ?from)
      (is-airport ?to)
      (at-plane ?ap ?from)
      (connected-airports ?from ?to)
      (not (at-plane ?ap ?to))
    )
    :effect (and
      (at-plane ?ap ?to)
      (not (at-plane ?ap ?from))
    )
  )
)