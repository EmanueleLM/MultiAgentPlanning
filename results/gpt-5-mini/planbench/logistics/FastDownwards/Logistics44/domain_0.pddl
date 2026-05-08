(define (domain jack_of_all_trades_transport)
  (:requirements :strips :typing)
  (:types city location truck airplane package)

  (:predicates
    (in-city ?loc - location ?c - city)
    (airport ?loc - location)
    (truck-city ?t - truck ?c - city)

    (at-package ?p - package ?loc - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    (at-truck ?t - truck ?loc - location)
    (at-plane ?a - airplane ?loc - location)
  )

  ;; Load a package into a truck: package and truck must be at the same location.
  (:action load-into-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at-package ?p ?loc)
      (at-truck ?t ?loc)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-truck ?p ?t)
    )
  )

  ;; Unload a package from a truck: package must be in the truck; truck at some location.
  (:action unload-from-truck
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

  ;; Load a package into an airplane: package and airplane must be at the same location (airport).
  (:action load-into-plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at-package ?p ?loc)
      (at-plane ?a ?loc)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-plane ?p ?a)
    )
  )

  ;; Unload a package from an airplane.
  (:action unload-from-plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in-plane ?p ?a)
      (at-plane ?a ?loc)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at-package ?p ?loc)
    )
  )

  ;; Drive a truck between two locations inside the truck's assigned city.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (truck-city ?t ?c)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Fly an airplane between two airport locations.
  (:action fly-plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-plane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at-plane ?a ?from))
      (at-plane ?a ?to)
    )
  )
)