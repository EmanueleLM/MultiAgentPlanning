(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)
  (:types city location truck airplane package)

  (:predicates
    ; static / typing
    (location_in ?loc - location ?city - city)
    (airport ?loc - location)
    (different_city ?c1 - city ?c2 - city)

    ; state fluents
    (at_truck ?t - truck ?loc - location)
    (at_plane ?a - airplane ?loc - location)
    (at_package ?p - package ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
  )

  ; Load a package into a truck (requires package physically at location and truck at same location)
  (:action load_into_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at_package ?p ?loc)
      (at_truck ?t ?loc)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_package ?p ?loc))
    )
  )

  ; Unload a package from a truck (requires package inside that truck and truck at a location)
  (:action unload_from_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?loc)
    )
    :effect (and
      (at_package ?p ?loc)
      (not (in_truck ?p ?t))
    )
  )

  ; Load a package into an airplane (requires package physically at location and airplane at same location)
  (:action load_into_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at_package ?p ?loc)
      (at_plane ?a ?loc)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (at_package ?p ?loc))
    )
  )

  ; Unload a package from an airplane (requires package inside that airplane and airplane at a location)
  (:action unload_from_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in_plane ?p ?a)
      (at_plane ?a ?loc)
    )
    :effect (and
      (at_package ?p ?loc)
      (not (in_plane ?p ?a))
    )
  )

  ; Drive a truck between two locations in the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?city - city)
    :precondition (and
      (at_truck ?t ?from)
      (location_in ?from ?city)
      (location_in ?to ?city)
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  ; Fly an airplane between airports in different cities
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?city_from - city ?city_to - city)
    :precondition (and
      (at_plane ?a ?from)
      (airport ?from)
      (airport ?to)
      (location_in ?from ?city_from)
      (location_in ?to ?city_to)
      (different_city ?city_from ?city_to)
    )
    :effect (and
      (at_plane ?a ?to)
      (not (at_plane ?a ?from))
    )
  )
)