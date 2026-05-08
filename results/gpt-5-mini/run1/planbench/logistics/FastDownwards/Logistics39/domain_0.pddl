(define (domain jack_of_all_trades)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    package truck airplane location city
  )

  (:predicates
    ;; an object that is either a package, a truck, or an airplane is at a location
    (at ?obj - (either package truck airplane) ?loc - location)
    ;; package is loaded in a vehicle (truck or airplane)
    (in ?p - package ?v - (either truck airplane))
    ;; a location is an airport
    (airport ?loc - location)
    ;; mapping from location to containing city (static)
    (location_in ?loc - location ?c - city)
  )

  ;; load package into truck: package and truck must be at same location
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and
      (in ?p ?t)
      (not (at ?p ?l))
    )
  )

  ;; load package into airplane: package and airplane must be at same airport/location
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
    )
    :effect (and
      (in ?p ?a)
      (not (at ?p ?l))
    )
  )

  ;; unload package from truck: package in truck and truck at some location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?t))
    )
  )

  ;; unload package from airplane: package in airplane and airplane at some airport/location
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?a))
    )
  )

  ;; drive a truck between two locations in the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (location_in ?from ?c)
      (location_in ?to ?c)
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  ;; fly an airplane between two airports
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at ?a ?to)
      (not (at ?a ?from))
    )
  )
)