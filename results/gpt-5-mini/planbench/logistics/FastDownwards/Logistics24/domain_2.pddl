(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ;; package at a location
    (at-pkg ?p - package ?l - location)
    ;; truck at a location
    (at-truck ?t - truck ?l - location)
    ;; airplane at an airport location
    (at-plane ?a - airplane ?l - location)
    ;; package inside a truck
    (in-truck ?p - package ?t - truck)
    ;; package inside an airplane
    (in-plane ?p - package ?a - airplane)
    ;; location is an airport
    (airport ?l - location)
    ;; location belongs to a city
    (in-city ?l - location ?c - city)
  )

  ;; Drive a truck between two locations in the same city
  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Load a package into a truck (both at same location)
  (:action load-into-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (at-pkg ?p ?loc)
      (at-truck ?tr ?loc)
    )
    :effect (and
      (not (at-pkg ?p ?loc))
      (in-truck ?p ?tr)
    )
  )

  ;; Unload a package from a truck to the truck's current location
  (:action unload-from-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (in-truck ?p ?tr)
      (at-truck ?tr ?loc)
    )
    :effect (and
      (not (in-truck ?p ?tr))
      (at-pkg ?p ?loc)
    )
  )

  ;; Fly an airplane between airport locations
  (:action fly-airplane
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

  ;; Load a package into an airplane (both at same airport location)
  (:action load-onto-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at-pkg ?p ?loc)
      (at-plane ?a ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (at-pkg ?p ?loc))
      (in-plane ?p ?a)
    )
  )

  ;; Unload a package from an airplane to the airplane's current airport location
  (:action unload-from-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in-plane ?p ?a)
      (at-plane ?a ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at-pkg ?p ?loc)
    )
  )
)