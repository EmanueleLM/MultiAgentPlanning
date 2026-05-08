(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck plane package city loc airport - loc)

  (:predicates
    ;; Vehicle and package locations
    (at-truck ?t - truck ?l - loc)
    (at-plane ?p - plane ?a - airport)
    (at-package ?pkg - package ?l - loc)

    ;; Package carriage relations
    (in-truck ?pkg - package ?t - truck)
    (in-plane ?pkg - package ?p - plane)

    ;; City membership for locations
    (in-city ?l - loc ?c - city)

    ;; destination association for packages (used in problem goal reasoning)
    (package-dest ?pkg - package ?l - loc)
  )

  ;; Truck actions (namespaced)
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - loc)
    :precondition (and
      (at-truck ?t ?l)
      (at-package ?p ?l)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-package ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - loc)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-truck ?p ?t))
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

  ;; Plane actions (namespaced). Flight only between airport locations (typed as airport).
  (:action plane-load
    :parameters (?pl - plane ?pkg - package ?a - airport)
    :precondition (and
      (at-plane ?pl ?a)
      (at-package ?pkg ?a)
    )
    :effect (and
      (in-plane ?pkg ?pl)
      (not (at-package ?pkg ?a))
    )
  )

  (:action plane-unload
    :parameters (?pl - plane ?pkg - package ?a - airport)
    :precondition (and
      (at-plane ?pl ?a)
      (in-plane ?pkg ?pl)
    )
    :effect (and
      (at-package ?pkg ?a)
      (not (in-plane ?pkg ?pl))
    )
  )

  (:action plane-fly
    :parameters (?pl - plane ?from - airport ?to - airport ?cf - city ?ct - city)
    :precondition (and
      (at-plane ?pl ?from)
      (in-city ?from ?cf)
      (in-city ?to ?ct)
    )
    :effect (and
      (at-plane ?pl ?to)
      (not (at-plane ?pl ?from))
    )
  )
)