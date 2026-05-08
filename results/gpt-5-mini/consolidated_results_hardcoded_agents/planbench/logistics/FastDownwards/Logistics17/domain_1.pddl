(define (domain logistics17)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ; location occupancy predicates
    (at-package ?p - package ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)

    ; containment predicates
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ; topology predicates
    (in-city ?loc - location ?c - city)
    (airport ?loc - location)
  )

  ;; Load a package into a truck at the truck's location.
  ;; Preconditions:
  ;;   - package is at location L
  ;;   - truck is at location L
  ;; Effects:
  ;;   - package is no longer at L
  ;;   - package is in the truck
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-truck ?p ?t)
    )
  )

  ;; Unload a package from a truck to the truck's current location.
  ;; Preconditions:
  ;;   - package is in the truck
  ;;   - truck is at location L
  ;; Effects:
  ;;   - package is no longer in the truck
  ;;   - package is at location L
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

  ;; Drive a truck between two locations inside the same city.
  ;; Preconditions:
  ;;   - truck is at from-location
  ;;   - from-location and to-location are both in the same city C
  ;; Effects:
  ;;   - truck is no longer at from-location
  ;;   - truck is at to-location
  (:action drive
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

  ;; Load a package into an airplane at an airport location.
  ;; Preconditions:
  ;;   - location is an airport
  ;;   - package is at the airport location
  ;;   - airplane is at the airport location
  ;; Effects:
  ;;   - package is no longer at the airport
  ;;   - package is in the airplane
  (:action load-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (airport ?l)
      (at-package ?p ?l)
      (at-airplane ?a ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-plane ?p ?a)
    )
  )

  ;; Unload a package from an airplane at the airplane's current airport location.
  ;; Preconditions:
  ;;   - package is in the airplane
  ;;   - airplane is at location L
  ;; Effects:
  ;;   - package is no longer in the airplane
  ;;   - package is at location L
  (:action unload-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in-plane ?p ?a)
      (at-airplane ?a ?l)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at-package ?p ?l)
    )
  )

  ;; Fly an airplane between two airports.
  ;; Preconditions:
  ;;   - airplane is at the from-airport
  ;;   - both from and to are airports (airport predicate)
  ;;   - (Cities of from/to are provided via in-city facts; flight does not require explicit city inequality)
  ;; Effects:
  ;;   - airplane is no longer at from
  ;;   - airplane is at to
  (:action fly
    :parameters (?a - airplane ?from - location ?to - location ?cf - city ?ct - city)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (in-city ?from ?cf)
      (in-city ?to ?ct)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )
)