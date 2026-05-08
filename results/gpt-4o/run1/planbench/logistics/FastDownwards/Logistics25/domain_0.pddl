(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    city location vehicle - object
    truck airplane - vehicle
    package - object
  )
  
  (:predicates 
    (at ?obj - (truck airplane package) ?loc - location)
    (in ?pkg - package ?veh - (truck airplane))
    (in_city ?loc - location ?city - city)
    (airport ?loc - location)
  )
  
  (:action load_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?truck ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?truck))
  )

  (:action unload_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (in ?pkg ?truck) (at ?truck ?loc))
    :effect (and (not (in ?pkg ?truck)) (at ?pkg ?loc))
  )

  (:action load_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?airplane ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?airplane))
  )

  (:action unload_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (in ?pkg ?airplane) (airport ?loc) (at ?airplane ?loc))
    :effect (and (not (in ?pkg ?airplane)) (at ?pkg ?loc))
  )

  (:action drive_truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?truck ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  (:action fly_airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (airport ?from) (airport ?to) (at ?airplane ?from))
    :effect (and (not (at ?airplane ?from)) (at ?airplane ?to))
  )
)