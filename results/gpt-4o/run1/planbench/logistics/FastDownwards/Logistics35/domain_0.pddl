(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    package
    vehicle
    truck - vehicle
    airplane - vehicle
  )
  (:predicates
    (at ?obj - locatable ?loc - location)
    (in-truck ?pkg - package ?truck - truck)
    (in-airplane ?pkg - package ?airplane - airplane)
    (airport ?loc - location)
    (in-city ?loc - location ?city - city)
    (truck-at ?truck - truck ?loc - location)
    (airplane-at ?airplane - airplane ?loc - location)
  )

  (:action load-into-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (truck-at ?truck ?loc))
    :effect (and (not (at ?pkg ?loc)) (in-truck ?pkg ?truck))
  )

  (:action unload-from-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (in-truck ?pkg ?truck) (truck-at ?truck ?loc))
    :effect (and (not (in-truck ?pkg ?truck)) (at ?pkg ?loc))
  )

  (:action load-into-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (airplane-at ?airplane ?loc))
    :effect (and (not (at ?pkg ?loc)) (in-airplane ?pkg ?airplane))
  )

  (:action unload-from-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (in-airplane ?pkg ?airplane) (airplane-at ?airplane ?loc))
    :effect (and (not (in-airplane ?pkg ?airplane)) (at ?pkg ?loc))
  )

  (:action drive-truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (truck-at ?truck ?from) (in-city ?from ?city) (in-city ?to ?city))
    :effect (and (not (truck-at ?truck ?from)) (truck-at ?truck ?to))
  )

  (:action fly-airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (airplane-at ?airplane ?from) (airport ?from) (airport ?to))
    :effect (and (not (airplane-at ?airplane ?from)) (airplane-at ?airplane ?to))
  )
)