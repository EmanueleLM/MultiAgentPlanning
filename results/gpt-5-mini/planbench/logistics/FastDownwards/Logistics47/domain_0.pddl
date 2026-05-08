(define (domain jack_of_all_trades_domain)
  (:requirements :strips :typing)
  (:types location city truck airplane package)
  (:predicates
    (airport ?loc - location)
    (in_city ?loc - location ?c - city)
    (at ?obj ?loc)  ; ?obj may be a truck, airplane, or package (untyped here to allow mixed objects)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
  )

  ;; load a package into a truck when both are at the same location
  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (at ?p ?loc) (at ?t ?loc))
    :effect (and (in_truck ?p ?t) (not (at ?p ?loc)))
  )

  ;; unload a package from a truck to the truck's current location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (in_truck ?p ?t) (at ?t ?loc))
    :effect (and (at ?p ?loc) (not (in_truck ?p ?t)))
  )

  ;; load a package into an airplane when both are at the same location
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (at ?p ?loc) (at ?a ?loc))
    :effect (and (in_airplane ?p ?a) (not (at ?p ?loc)))
  )

  ;; unload a package from an airplane to the airplane's current location
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (in_airplane ?p ?a) (at ?a ?loc))
    :effect (and (at ?p ?loc) (not (in_airplane ?p ?a)))
  )

  ;; drive a truck between two locations that belong to the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?t ?from) (in_city ?from ?c) (in_city ?to ?c))
    :effect (and (at ?t ?to) (not (at ?t ?from)))
  )

  ;; Grounded fly actions between every pair of distinct airport locations (instance-specific)
  ;; airplane_0 can fly from location_0_0 to location_1_0
  (:action fly_airplane_location_0_0_to_location_1_0
    :parameters (?a - airplane)
    :precondition (and (at ?a location_0_0) (airport location_0_0) (airport location_1_0) (in_city location_0_0 city_0) (in_city location_1_0 city_1))
    :effect (and (at ?a location_1_0) (not (at ?a location_0_0)))
  )

  ;; airplane_0 can fly from location_0_0 to location_2_0
  (:action fly_airplane_location_0_0_to_location_2_0
    :parameters (?a - airplane)
    :precondition (and (at ?a location_0_0) (airport location_0_0) (airport location_2_0) (in_city location_0_0 city_0) (in_city location_2_0 city_2))
    :effect (and (at ?a location_2_0) (not (at ?a location_0_0)))
  )

  ;; airplane_0 can fly from location_1_0 to location_0_0
  (:action fly_airplane_location_1_0_to_location_0_0
    :parameters (?a - airplane)
    :precondition (and (at ?a location_1_0) (airport location_1_0) (airport location_0_0) (in_city location_1_0 city_1) (in_city location_0_0 city_0))
    :effect (and (at ?a location_0_0) (not (at ?a location_1_0)))
  )

  ;; airplane_0 can fly from location_1_0 to location_2_0
  (:action fly_airplane_location_1_0_to_location_2_0
    :parameters (?a - airplane)
    :precondition (and (at ?a location_1_0) (airport location_1_0) (airport location_2_0) (in_city location_1_0 city_1) (in_city location_2_0 city_2))
    :effect (and (at ?a location_2_0) (not (at ?a location_1_0)))
  )

  ;; airplane_0 can fly from location_2_0 to location_0_0
  (:action fly_airplane_location_2_0_to_location_0_0
    :parameters (?a - airplane)
    :precondition (and (at ?a location_2_0) (airport location_2_0) (airport location_0_0) (in_city location_2_0 city_2) (in_city location_0_0 city_0))
    :effect (and (at ?a location_0_0) (not (at ?a location_2_0)))
  )

  ;; airplane_0 can fly from location_2_0 to location_1_0
  (:action fly_airplane_location_2_0_to_location_1_0
    :parameters (?a - airplane)
    :precondition (and (at ?a location_2_0) (airport location_2_0) (airport location_1_0) (in_city location_2_0 city_2) (in_city location_1_0 city_1))
    :effect (and (at ?a location_1_0) (not (at ?a location_2_0)))
  )

)