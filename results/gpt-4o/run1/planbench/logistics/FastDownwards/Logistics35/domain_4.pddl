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
    (at ?obj - (either package vehicle) ?loc - location)
    (in-truck ?pkg - package ?truck - truck)
    (in-airplane ?pkg - package ?airplane - airplane)
    (airport ?loc - location)
    (in-city ?loc - location ?city - city)
  )
  (:action load-into-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?truck ?loc))
    :effect (and (not (at ?pkg ?loc)) (in-truck ?pkg ?truck))
  )
  (:action unload-from-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (in-truck ?pkg ?truck) (at ?truck ?loc))
    :effect (and (not (in-truck ?pkg ?truck)) (at ?pkg ?loc))
  )
  (:action load-into-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?airplane ?loc))
    :effect (and (not (at ?pkg ?loc)) (in-airplane ?pkg ?airplane))
  )
  (:action unload-from-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (in-airplane ?pkg ?airplane) (at ?airplane ?loc))
    :effect (and (not (in-airplane ?pkg ?airplane)) (at ?pkg ?loc))
  )
  (:action drive-truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?truck ?from) (in-city ?from ?city) (in-city ?to ?city) (not (= ?from ?to)))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  (:action fly-airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at ?airplane ?from) (airport ?from) (airport ?to) (not (= ?from ?to)))
    :effect (and (not (at ?airplane ?from)) (at ?airplane ?to))
  )
)