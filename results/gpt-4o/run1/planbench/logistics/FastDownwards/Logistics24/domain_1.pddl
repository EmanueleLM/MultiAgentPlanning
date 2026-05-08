(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types
    package vehicle - object
    truck airplane - vehicle
    location city - object
  )
  
  (:predicates
    (at ?obj - (either package vehicle) ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (connected_in_city ?loc1 - location ?loc2 - location ?c - city)
    (airport ?loc - location ?c - city)
  )
  
  (:action load_to_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?truck ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?truck)
    )
  )
  
  (:action unload_from_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and
      (in ?pkg ?truck)
      (at ?truck ?loc)
    )
    :effect (and
      (not (in ?pkg ?truck))
      (at ?pkg ?loc)
    )
  )
  
  (:action load_to_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?airplane ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?airplane)
    )
  )
  
  (:action unload_from_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and
      (in ?pkg ?airplane)
      (at ?airplane ?loc)
    )
    :effect (and
      (not (in ?pkg ?airplane))
      (at ?pkg ?loc)
    )
  )
  
  (:action drive_truck
    :parameters (?truck - truck ?loc1 - location ?loc2 - location ?c - city)
    :precondition (and
      (at ?truck ?loc1)
      (connected_in_city ?loc1 ?loc2 ?c)
    )
    :effect (and
      (not (at ?truck ?loc1))
      (at ?truck ?loc2)
    )
  )
  
  (:action fly_airplane
    :parameters (?airplane - airplane ?loc1 - location ?loc2 - location ?c1 - city ?c2 - city)
    :precondition (and
      (at ?airplane ?loc1)
      (airport ?loc1 ?c1)
      (airport ?loc2 ?c2)
    )
    :effect (and
      (not (at ?airplane ?loc1))
      (at ?airplane ?loc2)
    )
  )
)