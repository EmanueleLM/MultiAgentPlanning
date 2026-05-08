(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types 
    city 
    location 
    vehicle - object
    truck - vehicle 
    airplane - vehicle
    package
  )

  (:predicates 
    (at ?obj - (vehicle package) ?loc - location)
    (in_city ?loc - location ?city - city)
    (is_airport ?loc - location)
    (in ?pkg - package ?veh - vehicle)
  )

  (:action Load_Truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?trk ?loc))
    :effect (and (in ?pkg ?trk) (not (at ?pkg ?loc)))
  )

  (:action Unload_Truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (in ?pkg ?trk) (at ?trk ?loc))
    :effect (and (at ?pkg ?loc) (not (in ?pkg ?trk)))
  )

  (:action Load_Airplane
    :parameters (?pkg - package ?ap - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?ap ?loc))
    :effect (and (in ?pkg ?ap) (not (at ?pkg ?loc)))
  )

  (:action Unload_Airplane
    :parameters (?pkg - package ?ap - airplane ?loc - location)
    :precondition (and (in ?pkg ?ap) (at ?ap ?loc))
    :effect (and (at ?pkg ?loc) (not (in ?pkg ?ap)))
  )

  (:action Drive_Truck
    :parameters (?trk - truck ?from ?to - location)
    :precondition (and (at ?trk ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (at ?trk ?to) (not (at ?trk ?from)))
  )

  (:action Fly_Airplane
    :parameters (?ap - airplane ?from ?to - location)
    :precondition (and (at ?ap ?from) (is_airport ?from) (is_airport ?to))
    :effect (and (at ?ap ?to) (not (at ?ap ?from)))
  )
)