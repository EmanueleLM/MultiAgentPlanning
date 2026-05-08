(define (domain logistics-orchestrated)
  (:requirements :strips :typing)
  (:types truck airplane package location city)

  (:predicates
    (truck-at ?t - truck ?l - location)
    (plane-at ?a - airplane ?l - location)
    (package-at ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
    (airport ?l - location)
    (in-city ?l - location ?c - city)
  )

  ;; Load a package into a truck: package and truck must be co-located.
  (:action truck-load
    :parameters (?tr - truck ?pkg - package ?loc - location)
    :precondition (and
      (truck-at ?tr ?loc)
      (package-at ?pkg ?loc)
    )
    :effect (and
      (not (package-at ?pkg ?loc))
      (in-truck ?pkg ?tr)
    )
  )

  ;; Unload a package from a truck: truck at location and package in that truck.
  (:action truck-unload
    :parameters (?tr - truck ?pkg - package ?loc - location)
    :precondition (and
      (truck-at ?tr ?loc)
      (in-truck ?pkg ?tr)
    )
    :effect (and
      (not (in-truck ?pkg ?tr))
      (package-at ?pkg ?loc)
    )
  )

  ;; Drive a truck between two locations in the same city.
  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; Load a package into an airplane: airplane and package must be co-located;
  ;; loading is only allowed at an airport (airplanes operate between airports).
  (:action plane-load
    :parameters (?ac - airplane ?pkg - package ?loc - location)
    :precondition (and
      (plane-at ?ac ?loc)
      (package-at ?pkg ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (package-at ?pkg ?loc))
      (in-plane ?pkg ?ac)
    )
  )

  ;; Unload a package from an airplane: airplane at location and package in that airplane.
  ;; The location where the plane is located becomes the package location.
  (:action plane-unload
    :parameters (?ac - airplane ?pkg - package ?loc - location)
    :precondition (and
      (plane-at ?ac ?loc)
      (in-plane ?pkg ?ac)
    )
    :effect (and
      (not (in-plane ?pkg ?ac))
      (package-at ?pkg ?loc)
    )
  )

  ;; Fly an airplane between two airports.
  (:action plane-fly
    :parameters (?ac - airplane ?from - location ?to - location)
    :precondition (and
      (plane-at ?ac ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (plane-at ?ac ?from))
      (plane-at ?ac ?to)
    )
  )
)