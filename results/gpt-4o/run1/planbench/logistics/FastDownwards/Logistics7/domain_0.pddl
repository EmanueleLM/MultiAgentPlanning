(define (domain transport_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types package vehicle - object airplane truck - vehicle location city)
  (:predicates 
    (at ?entity - object ?location - location)
    (in ?package - package ?vehicle - vehicle)
    (at_location ?vehicle - vehicle ?location - location)
    (in_city ?location - location ?city - city)
    (is_airport ?location - location)
    (vehicle_in_city ?vehicle - vehicle ?city - city)
  )

  (:action Load_Truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (at ?package ?location) (at_location ?truck ?location))
    :effect (and (not (at ?package ?location)) (in ?package ?truck))
  )

  (:action Unload_Truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (in ?package ?truck) (at_location ?truck ?location))
    :effect (and (not (in ?package ?truck)) (at ?package ?location))
  )

  (:action Load_Airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (at ?package ?location) (at_location ?airplane ?location))
    :effect (and (not (at ?package ?location)) (in ?package ?airplane))
  )

  (:action Unload_Airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (in ?package ?airplane) (at_location ?airplane ?location))
    :effect (and (not (in ?package ?airplane)) (at ?package ?location))
  )

  (:action Drive_Truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at_location ?truck ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at_location ?truck ?from)) (at_location ?truck ?to))
  )

  (:action Fly_Airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at_location ?airplane ?from) (is_airport ?from) (is_airport ?to))
    :effect (and (not (at_location ?airplane ?from)) (at_location ?airplane ?to))
  )
)