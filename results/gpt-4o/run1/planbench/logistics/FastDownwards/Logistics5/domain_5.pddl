(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location vehicle - object
    truck airplane - vehicle
    package - object
  )
  (:predicates
    (at ?vehicle - vehicle ?location - location)
    (at ?package - package ?location - location)
    (in ?package - package ?vehicle - vehicle)
    (is_airport ?location - location)
    (in_city ?location - location ?city - city)
  )

  (:action load_truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (at ?truck ?location) (at ?package ?location))
    :effect (and (not (at ?package ?location)) (in ?package ?truck))
  )

  (:action unload_truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (in ?package ?truck) (at ?truck ?location))
    :effect (and (not (in ?package ?truck)) (at ?package ?location))
  )

  (:action load_airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (at ?airplane ?location) (at ?package ?location) (is_airport ?location))
    :effect (and (not (at ?package ?location)) (in ?package ?airplane))
  )

  (:action unload_airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (in ?package ?airplane) (at ?airplane ?location))
    :effect (and (not (in ?package ?airplane)) (at ?package ?location))
  )

  (:action drive_truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?truck ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  (:action fly_airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at ?airplane ?from) (is_airport ?from) (is_airport ?to))
    :effect (and (not (at ?airplane ?from)) (at ?airplane ?to))
  )
)