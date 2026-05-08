(define (domain jack_of_all_trades_transport)
  (:requirements :strips :typing)
  (:types package truck airplane location city)

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (in-city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Load a package into a truck: package and truck must be at same location.
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

  ;; Unload a package from a truck: package must be in the truck and truck at some location.
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

  ;; Load a package into an airplane: package and airplane must be at same location.
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-airplane ?a ?l)
    )
    :effect (and
      (in-airplane ?p ?a)
      (not (at-package ?p ?l))
    )
  )

  ;; Unload a package from an airplane.
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in-airplane ?p ?a)
      (at-airplane ?a ?l)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-airplane ?p ?a))
    )
  )

  ;; Drive a truck between two locations in the same city.
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

  ;; Fly an airplane between two airport locations.
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at-airplane ?a ?to)
      (not (at-airplane ?a ?from))
    )
  )
)