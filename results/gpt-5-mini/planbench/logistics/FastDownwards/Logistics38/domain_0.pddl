(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    thing
    vehicle - thing
    truck airplane - vehicle
    package - thing
  )

  (:predicates
    (at ?x - thing ?l - location)
    (in ?p - package ?v - vehicle)
    (airport ?l - location)
    (loc_in_city ?l - location ?c - city)
    (truck_in_city ?t - truck ?c - city)
  )

  ;; load a package into a truck when both are at the same location and the location belongs to the truck's city
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
      (loc_in_city ?l ?c)
      (truck_in_city ?t ?c)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )

  ;; unload a package from a truck: package becomes at the truck's current location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l)
      (loc_in_city ?l ?c)
      (truck_in_city ?t ?c)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
    )
  )

  ;; load a package into an airplane at an airport
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )

  ;; unload a package from an airplane at an airport
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )

  ;; drive a truck between two locations in the same city (fully connected intra-city)
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
      (truck_in_city ?t ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; fly an airplane between two airports (inter-city via airports)
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
      (loc_in_city ?from ?cfrom)
      (loc_in_city ?to ?cto)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)