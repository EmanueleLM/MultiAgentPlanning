(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj package truck airplane - obj location city)

  (:predicates
    ;; a package, truck, or airplane is at a location
    (at ?o - obj ?l - location)
    ;; package is inside a truck
    (in-truck ?p - package ?t - truck)
    ;; package is inside an airplane
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
      (at ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Load a package into a truck (both at same location)
  (:action load-into-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (at ?p ?loc)
      (at ?tr ?loc)
    )
    :effect (and
      (not (at ?p ?loc))
      (in-truck ?p ?tr)
    )
  )

  ;; Unload a package from a truck to the truck's current location
  (:action unload-from-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (in-truck ?p ?tr)
      (at ?tr ?loc)
    )
    :effect (and
      (not (in-truck ?p ?tr))
      (at ?p ?loc)
    )
  )

  ;; Fly an airplane between airport locations
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  ;; Load a package into an airplane (both at same airport location)
  (:action load-onto-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at ?p ?loc)
      (at ?a ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (at ?p ?loc))
      (in-plane ?p ?a)
    )
  )

  ;; Unload a package from an airplane to the airplane's current airport location
  (:action unload-from-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in-plane ?p ?a)
      (at ?a ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at ?p ?loc)
    )
  )
)