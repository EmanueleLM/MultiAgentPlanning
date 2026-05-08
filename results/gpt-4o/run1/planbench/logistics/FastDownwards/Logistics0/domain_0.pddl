(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location package truck airplane city
  )
  (:predicates
    (is_airport ?loc - location)
    (in_city ?loc - location ?city - city)
    (at_location ?pkg - package ?loc - location)
    (in_truck ?pkg - package ?tr - truck)
    (in_airplane ?pkg - package ?air - airplane)
    (truck_at ?tr - truck ?loc - location)
    (airplane_at ?air - airplane ?loc - location)
  )
  (:action Load_Package_Truck
    :parameters (?pkg - package ?tr - truck ?loc - location)
    :precondition (and (at_location ?pkg ?loc) (truck_at ?tr ?loc))
    :effect (and (not (at_location ?pkg ?loc)) (in_truck ?pkg ?tr))
  )
  (:action Unload_Package_Truck
    :parameters (?pkg - package ?tr - truck ?loc - location)
    :precondition (and (in_truck ?pkg ?tr) (truck_at ?tr ?loc))
    :effect (and (not (in_truck ?pkg ?tr)) (at_location ?pkg ?loc))
  )
  (:action Load_Package_Airplane
    :parameters (?pkg - package ?air - airplane ?loc - location)
    :precondition (and (at_location ?pkg ?loc) (airplane_at ?air ?loc))
    :effect (and (not (at_location ?pkg ?loc)) (in_airplane ?pkg ?air))
  )
  (:action Unload_Package_Airplane
    :parameters (?pkg - package ?air - airplane ?loc - location)
    :precondition (and (in_airplane ?pkg ?air) (airplane_at ?air ?loc))
    :effect (and (not (in_airplane ?pkg ?air)) (at_location ?pkg ?loc))
  )
  (:action Drive_Truck
    :parameters (?tr - truck ?from - location ?to - location ?city - city)
    :precondition (and (truck_at ?tr ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (truck_at ?tr ?from)) (truck_at ?tr ?to))
  )
  (:action Fly_Airplane
    :parameters (?air - airplane ?from - location ?to - location)
    :precondition (and (is_airport ?from) (is_airport ?to) (airplane_at ?air ?from))
    :effect (and (not (airplane_at ?air ?from)) (airplane_at ?air ?to))
  )
)