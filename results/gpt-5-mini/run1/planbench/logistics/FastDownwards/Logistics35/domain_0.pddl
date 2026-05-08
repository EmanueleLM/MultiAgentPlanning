(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    (at ?p - package ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?pl - airplane)
    (at_truck ?t - truck ?loc - location)
    (at_plane ?pl - airplane ?loc - location)
    (location_in_city ?loc - location ?c - city)
    (airport ?loc - location)
  )

  ;; load a package into a truck: package and truck must be co-located
  (:action load-into-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at_truck ?t ?loc)
      (at ?p ?loc)
    )
    :effect (and
      (not (at ?p ?loc))
      (in_truck ?p ?t)
    )
  )

  ;; unload a package from a truck: truck must be at location and package in that truck
  (:action unload-from-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at_truck ?t ?loc)
      (in_truck ?p ?t)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at ?p ?loc)
    )
  )

  ;; load a package into an airplane: package and airplane must be co-located
  (:action load-into-airplane
    :parameters (?p - package ?pl - airplane ?loc - location)
    :precondition (and
      (at_plane ?pl ?loc)
      (at ?p ?loc)
    )
    :effect (and
      (not (at ?p ?loc))
      (in_plane ?p ?pl)
    )
  )

  ;; unload a package from an airplane: airplane must be at location and package in that airplane
  (:action unload-from-airplane
    :parameters (?p - package ?pl - airplane ?loc - location)
    :precondition (and
      (at_plane ?pl ?loc)
      (in_plane ?p ?pl)
    )
    :effect (and
      (not (in_plane ?p ?pl))
      (at ?p ?loc)
    )
  )

  ;; drive a truck between two locations in the same city
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; fly an airplane between two airport locations
  (:action fly-airplane
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