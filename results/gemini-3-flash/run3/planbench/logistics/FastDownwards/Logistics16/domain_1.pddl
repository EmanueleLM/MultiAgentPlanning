(define (domain logistics_16)
  (:requirements :strips :typing)
  (:types
    city
    location
    package
    truck
    airplane
    thing - object
    vehicle - thing
    package - thing
    truck - vehicle
    airplane - vehicle
  )

  (:predicates
    (at ?obj - thing ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (in_city ?loc - location ?city - city)
    (airport ?loc - location)
  )

  (:action load_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?truck ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?truck))
  )

  (:action load_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?airplane ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?airplane))
  )

  (:action unload_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (in ?pkg ?truck) (at ?truck ?loc))
    :effect (and (not (in ?pkg ?truck)) (at ?pkg ?loc))
  )

  (:action unload_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (in ?pkg ?airplane) (at ?airplane ?loc))
    :effect (and (not (in ?pkg ?airplane)) (at ?pkg ?loc))
  )

  (:action drive_truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?truck ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  (:action fly_airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at ?airplane ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?airplane ?from)) (at ?airplane ?to))
  )
)