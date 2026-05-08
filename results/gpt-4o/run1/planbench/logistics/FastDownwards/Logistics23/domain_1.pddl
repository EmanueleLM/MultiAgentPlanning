(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types location package vehicle city - object
           truck airplane - vehicle)
  (:predicates
    (at ?obj - object ?loc - location)
    (in ?pkg - package ?vehicle - vehicle)
    (is_airport ?loc - location)
    (in_city ?loc - location ?city - city)
  )
  (:action Load_Truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?truck ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?truck))
  )
  (:action Unload_Truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (in ?pkg ?truck) (at ?truck ?loc))
    :effect (and (not (in ?pkg ?truck)) (at ?pkg ?loc))
  )
  (:action Load_Airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?airplane ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?airplane))
  )
  (:action Unload_Airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (in ?pkg ?airplane) (at ?airplane ?loc))
    :effect (and (not (in ?pkg ?airplane)) (at ?pkg ?loc))
  )
  (:action Drive_Truck
    :parameters (?truck - truck ?from_loc - location ?to_loc - location)
    :precondition (and (at ?truck ?from_loc) (in_city ?from_loc ?city) (in_city ?to_loc ?city))
    :effect (and (not (at ?truck ?from_loc)) (at ?truck ?to_loc))
  )
  (:action Fly_Airplane
    :parameters (?airplane - airplane ?from_loc - location ?to_loc - location)
    :precondition (and (at ?airplane ?from_loc) (is_airport ?from_loc) (is_airport ?to_loc))
    :effect (and (not (at ?airplane ?from_loc)) (at ?airplane ?to_loc))
  )
)