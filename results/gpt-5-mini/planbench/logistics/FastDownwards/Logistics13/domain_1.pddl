(define (domain logistics13)
  (:requirements :strips :typing)
  (:types truck airplane package location city)

  (:predicates
    (at_truck ?tr - truck ?loc - location)     ; truck at location
    (at_plane ?pl - airplane ?loc - location)  ; airplane at location
    (p_at ?p - package ?loc - location)        ; package at a location (not in vehicle)
    (in_truck ?p - package ?tr - truck)        ; package in a truck
    (in_plane ?p - package ?pl - airplane)     ; package in an airplane
    (airport ?loc - location)                  ; location is an airport
    (in_city ?loc - location ?c - city)        ; location belongs to a city
    (plane_free ?pl - airplane)                ; airplane has capacity for one package
  )

  ;; Drive a truck between two locations in the same city
  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?tr ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; Load a package into a truck (package and truck must be at same location)
  (:action load-onto-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (p_at ?p ?loc)
      (at_truck ?tr ?loc)
    )
    :effect (and
      (not (p_at ?p ?loc))
      (in_truck ?p ?tr)
    )
  )

  ;; Unload a package from a truck to the truck's current location
  (:action unload-from-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (in_truck ?p ?tr)
      (at_truck ?tr ?loc)
    )
    :effect (and
      (not (in_truck ?p ?tr))
      (p_at ?p ?loc)
    )
  )

  ;; Load a package into an airplane at an airport (airplane capacity = 1)
  (:action load-onto-plane
    :parameters (?p - package ?pl - airplane ?loc - location)
    :precondition (and
      (p_at ?p ?loc)
      (at_plane ?pl ?loc)
      (airport ?loc)
      (plane_free ?pl)
    )
    :effect (and
      (not (p_at ?p ?loc))
      (in_plane ?p ?pl)
      (not (plane_free ?pl))
    )
  )

  ;; Unload a package from an airplane to the airplane's current airport location
  (:action unload-from-plane
    :parameters (?p - package ?pl - airplane ?loc - location)
    :precondition (and
      (in_plane ?p ?pl)
      (at_plane ?pl ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (in_plane ?p ?pl))
      (p_at ?p ?loc)
      (plane_free ?pl)
    )
  )

  ;; Fly an airplane between two airports (airports may be in different cities)
  (:action fly-plane
    :parameters (?pl - airplane ?from - location ?to - location)
    :precondition (and
      (at_plane ?pl ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at_plane ?pl ?from))
      (at_plane ?pl ?to)
    )
  )
)