(define (domain transport-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location city truck airplane package
  )
  (:predicates
    ; Predicate represents an object (truck, airplane, or package) at a specific location
    (at_location ?obj - (either truck airplane package) ?loc - location)
    ; Predicate tracks which locations are part of which city
    (at_city ?loc - location ?city - city)
    ; Predicate checks if a package is in the truck
    (in_truck ?pkg - package ?trk - truck)
    ; Predicate checks if a package is in the airplane
    (in_airplane ?pkg - package ?airplane - airplane)
    ; Predicate to determine if a location is an airport
    (is_airport ?loc - location)
  )
  (:action load_truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (at_location ?pkg ?loc) (at_location ?trk ?loc))
    :effect (and (not (at_location ?pkg ?loc)) (in_truck ?pkg ?trk))
  )
  (:action unload_truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (in_truck ?pkg ?trk) (at_location ?trk ?loc))
    :effect (and (not (in_truck ?pkg ?trk)) (at_location ?pkg ?loc))
  )
  (:action load_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (at_location ?pkg ?loc) (at_location ?airplane ?loc) (is_airport ?loc))
    :effect (and (not (at_location ?pkg ?loc)) (in_airplane ?pkg ?airplane))
  )
  (:action unload_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (in_airplane ?pkg ?airplane) (at_location ?airplane ?loc))
    :effect (and (not (in_airplane ?pkg ?airplane)) (at_location ?pkg ?loc))
  )
  (:action drive
    :parameters (?trk - truck ?from - location ?to - location ?city - city)
    :precondition (and (at_location ?trk ?from) (at_city ?from ?city) (at_city ?to ?city))
    :effect (and (not (at_location ?trk ?from)) (at_location ?trk ?to))
  )
  (:action fly
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at_location ?airplane ?from) (is_airport ?from) (is_airport ?to))
    :effect (and (not (at_location ?airplane ?from)) (at_location ?airplane ?to))
  )
)