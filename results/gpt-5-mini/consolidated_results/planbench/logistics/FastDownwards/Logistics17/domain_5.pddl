(define (domain logistics17)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package truck airplane location city stage
  )

  (:predicates
    ; package/location and vehicle/location relations
    (at-package ?p - package ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)

    ; package-in-vehicle relations
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ; city membership and airport marker
    (in-city ?l - location ?c - city)
    (is-airport ?l - location)

    ; a simple exclusivity predicate: package is not inside any vehicle
    (free ?p - package)

    ; explicit discrete time / stage progression
    (current-stage ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ; Load package into a truck at the truck's location.
  ; Preconditions: package is at the same location, truck is at that location, package is free (not in any vehicle),
  ; current stage must advance to a direct successor stage.
  ; Effects: package removed from location, placed in truck, marked not free, and stage advances.
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-package ?p ?l)
      (at-truck ?t ?l)
      (free ?p)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-truck ?p ?t)
      (not (free ?p))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ; Unload package from a truck to the truck's current location.
  ; Preconditions: package is in the truck, truck is at the specified location, stage advances.
  ; Effects: package removed from truck, placed at location, marked free, and stage advances.
  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?l)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?l)
      (free ?p)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ; Drive a truck between two locations in the same city.
  ; Preconditions: truck at from-location, both locations in same city, stage advances.
  ; Effects: truck moves from from-location to to-location, and stage advances.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ; Load package into an airplane at an airport location.
  ; Preconditions: package at same airport location, airplane at that airport, package free, stage advances.
  ; Effects: package removed from location, placed in airplane, marked not free, and stage advances.
  (:action load-plane
    :parameters (?p - package ?a - airplane ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-package ?p ?l)
      (at-airplane ?a ?l)
      (is-airport ?l)
      (free ?p)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-plane ?p ?a)
      (not (free ?p))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ; Unload package from an airplane at an airport location.
  ; Preconditions: package is in the plane, airplane is at the specified airport, stage advances.
  ; Effects: package removed from plane, placed at the airport location, marked free, and stage advances.
  (:action unload-plane
    :parameters (?p - package ?a - airplane ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (in-plane ?p ?a)
      (at-airplane ?a ?l)
      (is-airport ?l)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at-package ?p ?l)
      (free ?p)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ; Fly an airplane from one airport to another airport (different or same city).
  ; Preconditions: airplane at from-airport, both locations are airports, stage advances.
  ; Effects: airplane moves to to-airport and stage advances. Packages inside the airplane remain in-plane.
  (:action fly
    :parameters (?a - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-airplane ?a ?from)
      (is-airport ?from)
      (is-airport ?to)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)