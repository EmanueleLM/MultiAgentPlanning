(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types 
    package 
    vehicle 
    truck - vehicle 
    airplane - vehicle 
    location 
    city)

  (:predicates 
    (at ?object ?location)  ;; An object (package or vehicle) is at a certain location
    (in ?package ?vehicle)  ;; A package is in a vehicle
    (is_airport ?location)  ;; A location is an airport
    (in_city ?location ?city)  ;; A location belongs to a specific city
  )

  (:action load-truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (at ?package ?location) (at ?truck ?location))
    :effect (and (not (at ?package ?location)) (in ?package ?truck))
  )

  (:action unload-truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (in ?package ?truck) (at ?truck ?location))
    :effect (and (not (in ?package ?truck)) (at ?package ?location))
  )

  (:action load-airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (at ?package ?location) (at ?airplane ?location) (is_airport ?location))
    :effect (and (not (at ?package ?location)) (in ?package ?airplane))
  )

  (:action unload-airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (in ?package ?airplane) (at ?airplane ?location) (is_airport ?location))
    :effect (and (not (in ?package ?airplane)) (at ?package ?location))
  )

  (:action drive-truck
    :parameters (?truck - truck ?from_location - location ?to_location - location ?city - city)
    :precondition (and (at ?truck ?from_location) 
                       (in_city ?from_location ?city)
                       (in_city ?to_location ?city))
    :effect (and (not (at ?truck ?from_location)) (at ?truck ?to_location))
  )

  (:action fly-airplane
    :parameters (?airplane - airplane ?from_airport - location ?to_airport - location)
    :precondition (and (at ?airplane ?from_airport) 
                       (is_airport ?from_airport) 
                       (is_airport ?to_airport))
    :effect (and (not (at ?airplane ?from_airport)) (at ?airplane ?to_airport))
  )
)