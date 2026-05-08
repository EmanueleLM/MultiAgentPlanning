(define (domain logistics)

  (:requirements :strips :typing)

  (:types
    city
    location
    vehicle
    truck - vehicle
    airplane - vehicle
    package
  )

  (:predicates
    (at ?vehicle - vehicle ?location - location)
    (in_truck ?package - package ?truck - truck)
    (in_airplane ?package - package ?airplane - airplane)
    (at_location ?package - package ?location - location)
    (airport ?location - location)
    (in_city ?location - location ?city - city)
    (truck_in_city ?truck - truck ?city - city)
    (airplane_at_airport ?airplane - airplane ?location - location)
  )

  (:action load-to-truck
    :parameters (?package - package ?truck - truck ?loc - location)
    :precondition (and (at ?truck ?loc) (at_location ?package ?loc))
    :effect (and (not (at_location ?package ?loc)) (in_truck ?package ?truck))
  )

  (:action unload-from-truck
    :parameters (?package - package ?truck - truck ?loc - location)
    :precondition (and (in_truck ?package ?truck) (at ?truck ?loc))
    :effect (and (not (in_truck ?package ?truck)) (at_location ?package ?loc))
  )

  (:action load-to-airplane
    :parameters (?package - package ?airplane - airplane ?loc - location)
    :precondition (and (airport ?loc) (at ?airplane ?loc) (at_location ?package ?loc))
    :effect (and (not (at_location ?package ?loc)) (in_airplane ?package ?airplane))
  )

  (:action unload-from-airplane
    :parameters (?package - package ?airplane - airplane ?loc - location)
    :precondition (and (in_airplane ?package ?airplane) (at ?airplane ?loc))
    :effect (and (not (in_airplane ?package ?airplane)) (at_location ?package ?loc))
  )

  (:action drive-truck
    :parameters (?truck - truck ?from - location ?to - location)
    :precondition (and (at ?truck ?from) 
                       (in_city ?from ?city) (in_city ?to ?city)
                       (truck_in_city ?truck ?city)
                       (not (airport ?from)) (not (airport ?to)))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  (:action fly-airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at ?airplane ?from) 
                       (airport ?from) (airport ?to))
    :effect (and (not (at ?airplane ?from)) (at ?airplane ?to))
  )
)