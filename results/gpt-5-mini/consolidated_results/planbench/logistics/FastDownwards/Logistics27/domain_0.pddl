(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location airport)

  ;; Predicates
  ;; at-truck: truck is at a ground location
  ;; at-plane: airplane is at an airport
  ;; at-package: package is at a ground location (not loaded)
  ;; in-truck: package is loaded in a truck
  ;; in-plane: package is loaded in an airplane
  ;; road: bidirectional road connectivity between two locations
  ;; air-route: bidirectional air connectivity between two airports
  (:predicates
    (at-truck ?tr - truck ?loc - location)
    (at-plane ?pl - airplane ?ap - airport)
    (at-package ?pkg - package ?loc - location)
    (in-truck ?pkg - package ?tr - truck)
    (in-plane ?pkg - package ?pl - airplane)
    (road ?from - location ?to - location)
    (air-route ?a1 - airport ?a2 - airport)
  )

  ;;; Truck actions
  ; Load a package into a truck at the same ground location.
  ; Preconditions: truck and package co-located; package not already in that truck.
  ; Effects: package removed from location and marked as in-truck.
  (:action truck-load
    :parameters (?tr - truck ?pkg - package ?loc - location)
    :precondition (and
      (at-truck ?tr ?loc)
      (at-package ?pkg ?loc)
      (not (in-truck ?pkg ?tr))
    )
    :effect (and
      (not (at-package ?pkg ?loc))
      (in-truck ?pkg ?tr)
    )
  )

  ; Unload a package from a truck to the truck's current ground location.
  ; Preconditions: truck at location and package currently in that truck.
  ; Effects: package placed at location and removed from in-truck.
  (:action truck-unload
    :parameters (?tr - truck ?pkg - package ?loc - location)
    :precondition (and
      (at-truck ?tr ?loc)
      (in-truck ?pkg ?tr)
    )
    :effect (and
      (at-package ?pkg ?loc)
      (not (in-truck ?pkg ?tr))
    )
  )

  ; Drive a truck along a road link (bidirectional links are given as road facts).
  ; Preconditions: truck at source and road connects source->dest; not already at destination.
  ; Effects: truck moves to destination.
  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (and
      (at-truck ?tr ?from)
      (road ?from ?to)
      (not (at-truck ?tr ?to))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;;; Airplane actions
  ; Load a package into an airplane at the same airport.
  ; (Packages at ground locations may not be at airports unless explicitly placed there.)
  (:action plane-load
    :parameters (?pl - airplane ?pkg - package ?ap - airport)
    :precondition (and
      (at-plane ?pl ?ap)
      ;; package must be at that airport to be loaded
      (at-package ?pkg ?ap)
      (not (in-plane ?pkg ?pl))
    )
    :effect (and
      (not (at-package ?pkg ?ap))
      (in-plane ?pkg ?pl)
    )
  )

  ; Unload a package from an airplane to an airport.
  (:action plane-unload
    :parameters (?pl - airplane ?pkg - package ?ap - airport)
    :precondition (and
      (at-plane ?pl ?ap)
      (in-plane ?pkg ?pl)
    )
    :effect (and
      (at-package ?pkg ?ap)
      (not (in-plane ?pkg ?pl))
    )
  )

  ; Fly an airplane between airports along an air-route link.
  (:action fly-plane
    :parameters (?pl - airplane ?from - airport ?to - airport)
    :precondition (and
      (at-plane ?pl ?from)
      (air-route ?from ?to)
      (not (at-plane ?pl ?to))
    )
    :effect (and
      (not (at-plane ?pl ?from))
      (at-plane ?pl ?to)
    )
  )
)