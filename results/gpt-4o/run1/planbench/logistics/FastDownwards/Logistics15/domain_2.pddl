(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location city vehicle package
    truck airplane - vehicle
  )
  (:predicates
    (at ?obj - (either truck airplane package) ?loc - location)
    (in ?pkg - package ?veh - (either truck airplane))
    (airport ?loc - location)
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
    :effect (and (at ?pkg ?loc) (not (in ?pkg ?truck)))
  )
  (:action Load_Airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?airplane ?loc) (airport ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?airplane))
  )
  (:action Unload_Airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (in ?pkg ?airplane) (at ?airplane ?loc))
    :effect (and (at ?pkg ?loc) (not (in ?pkg ?airplane)))
  )
  (:action Drive_Truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?truck ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  (:action Fly_Airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at ?airplane ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?airplane ?from)) (at ?airplane ?to))
  )
)