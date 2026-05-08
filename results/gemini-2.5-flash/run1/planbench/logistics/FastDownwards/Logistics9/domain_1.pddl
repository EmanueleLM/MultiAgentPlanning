(define (domain logistics9)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    package
    vehicle
    truck - vehicle
    airplane - vehicle
  )

  (:predicates
    (at ?obj - (or package vehicle) ?loc - location) ; ?obj is at ?loc
    (in ?pkg - package ?veh - vehicle) ; ?pkg is inside ?veh
    (is_airport ?loc - location) ; ?loc is an airport
    (in_city ?loc - location ?c - city) ; ?loc is located in ?c
    (assigned_to_city ?truck - truck ?c - city) ; ?truck is assigned to operate in ?c
  )

  (:action load_package_truck
    :parameters (?pkg - package ?truck - truck ?loc - location ?city - city)
    :precondition (and
      (at ?pkg ?loc)
      (at ?truck ?loc)
      (in_city ?loc ?city)
      (assigned_to_city ?truck ?city)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?truck)
    )
  )

  (:action unload_package_truck
    :parameters (?pkg - package ?truck - truck ?loc - location ?city - city)
    :precondition (and
      (in ?pkg ?truck)
      (at ?truck ?loc)
      (in_city ?loc ?city)
      (assigned_to_city ?truck ?city)
    )
    :effect (and
      (not (in ?pkg ?truck))
      (at ?pkg ?loc)
    )
  )

  (:action drive_truck
    :parameters (?truck - truck ?from_loc - location ?to_loc - location ?city - city)
    :precondition (and
      (at ?truck ?from_loc)
      (in_city ?from_loc ?city)
      (in_city ?to_loc ?city)
      (assigned_to_city ?truck ?city)
      (not (= ?from_loc ?to_loc)) ; Truck must move to a different location
    )
    :effect (and
      (not (at ?truck ?from_loc))
      (at ?truck ?to_loc)
    )
  )

  (:action load_package_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location ?city - city)
    :precondition (and
      (at ?pkg ?loc)
      (at ?airplane ?loc)
      (is_airport ?loc) ; Packages can only be loaded/unloaded from airplanes at airports
      (in_city ?loc ?city)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?airplane)
    )
  )

  (:action unload_package_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location ?city - city)
    :precondition (and
      (in ?pkg ?airplane)
      (at ?airplane ?loc)
      (is_airport ?loc) ; Packages can only be loaded/unloaded from airplanes at airports
      (in_city ?loc ?city)
    )
    :effect (and
      (not (in ?pkg ?airplane))
      (at ?pkg ?loc)
    )
  )

  (:action fly_airplane
    :parameters (?airplane - airplane ?from_loc - location ?to_loc - location ?from_city - city ?to_city - city)
    :precondition (and
      (at ?airplane ?from_loc)
      (is_airport ?from_loc)
      (is_airport ?to_loc)
      (in_city ?from_loc ?from_city)
      (in_city ?to_loc ?to_city)
      (not (= ?from_city ?to_city)) ; Airplane must fly between different cities
    )
    :effect (and
      (not (at ?airplane ?from_loc))
      (at ?airplane ?to_loc)
    )
  )
)