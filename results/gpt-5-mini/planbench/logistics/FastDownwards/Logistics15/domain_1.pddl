(define (domain logistics15)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck plane package city loc)

  (:predicates
    ;; vehicle and package locations
    (at-truck ?t - truck ?l - loc)
    (at-plane ?pl - plane ?l - loc)
    (at ?pkg - package ?l - loc)

    ;; package carriage relations
    (in-truck ?pkg - package ?t - truck)
    (in-plane ?pkg - package ?pl - plane)

    ;; city membership for locations and airport marker
    (in-city ?l - loc ?c - city)
    (is-airport ?l - loc)
  )

  ;; Truck actions
  (:action truck-load
    :parameters (?t - truck ?pkg - package ?l - loc)
    :precondition (and
      (at-truck ?t ?l)
      (at ?pkg ?l)
    )
    :effect (and
      (in-truck ?pkg ?t)
      (not (at ?pkg ?l))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?pkg - package ?l - loc)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?pkg ?t)
    )
    :effect (and
      (at ?pkg ?l)
      (not (in-truck ?pkg ?t))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - loc ?to - loc ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)  ;; enforces truck moves only within same city
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  ;; Plane actions
  (:action plane-load
    :parameters (?pl - plane ?pkg - package ?l - loc)
    :precondition (and
      (at-plane ?pl ?l)
      (at ?pkg ?l)
      (is-airport ?l)
    )
    :effect (and
      (in-plane ?pkg ?pl)
      (not (at ?pkg ?l))
    )
  )

  (:action plane-unload
    :parameters (?pl - plane ?pkg - package ?l - loc)
    :precondition (and
      (at-plane ?pl ?l)
      (in-plane ?pkg ?pl)
      (is-airport ?l)
    )
    :effect (and
      (at ?pkg ?l)
      (not (in-plane ?pkg ?pl))
    )
  )

  (:action plane-fly
    :parameters (?pl - plane ?from - loc ?to - loc ?cf - city ?ct - city)
    :precondition (and
      (at-plane ?pl ?from)
      (is-airport ?from)
      (is-airport ?to)
      (in-city ?from ?cf)
      (in-city ?to ?ct)
      ;; allow flights between any two airports (cities may be different or same,
      ;; the problem description allows flights between cities; staying-in-city flights
      ;; between two airports of same city are allowed but unnecessary)
    )
    :effect (and
      (at-plane ?pl ?to)
      (not (at-plane ?pl ?from))
    )
  )
)