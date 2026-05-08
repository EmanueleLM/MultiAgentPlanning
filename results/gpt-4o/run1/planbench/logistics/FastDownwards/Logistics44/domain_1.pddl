(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    vehicle
    truck - vehicle
    airplane - vehicle
    location
    city
    package
  )

  (:predicates
    (at ?pkg - package ?loc - location)
    (in-truck ?pkg - package ?truck - truck)
    (in-airplane ?pkg - package ?airplane - airplane)
    (in-city ?loc - location ?city - city)
    (at-truck ?truck - truck ?loc - location)
    (at-airplane ?airplane - airplane ?loc - location)
    (airport ?loc - location)
  )

  (:action load-package-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at-truck ?truck ?loc))
    :effect (and (not (at ?pkg ?loc)) (in-truck ?pkg ?truck))
  )

  (:action unload-package-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (in-truck ?pkg ?truck) (at-truck ?truck ?loc))
    :effect (and (not (in-truck ?pkg ?truck)) (at ?pkg ?loc))
  )

  (:action load-package-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at-airplane ?airplane ?loc))
    :effect (and (not (at ?pkg ?loc)) (in-airplane ?pkg ?airplane))
  )

  (:action unload-package-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (in-airplane ?pkg ?airplane) (at-airplane ?airplane ?loc))
    :effect (and (not (in-airplane ?pkg ?airplane)) (at ?pkg ?loc))
  )

  (:action drive-truck
    :parameters (?truck - truck ?from - location ?to - location)
    :precondition (and (at-truck ?truck ?from) (exists (?city - city) (and (in-city ?from ?city) (in-city ?to ?city))))
    :effect (and (not (at-truck ?truck ?from)) (at-truck ?truck ?to))
  )

  (:action fly-airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at-airplane ?airplane ?from) (airport ?from) (airport ?to))
    :effect (and (not (at-airplane ?airplane ?from)) (at-airplane ?airplane ?to))
  )
  
)