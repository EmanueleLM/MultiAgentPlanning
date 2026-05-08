(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    location city truck airplane package
  )

  (:predicates
    (at ?obj - (truck airplane package) ?loc - location)
    (in ?pkg - package ?vehicle - (truck airplane))
    (airport ?loc - location ?city - city)
    (in_city ?loc - location ?city - city)
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
    :precondition (and (at ?pkg ?loc) (at ?airplane ?loc) (airport ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?airplane))
  )

  (:action unload_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (in ?pkg ?airplane) (at ?airplane ?loc) (airport ?loc))
    :effect (and (not (in ?pkg ?airplane)) (at ?pkg ?loc))
  )

  (:action drive
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?truck ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  (:action fly
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at ?airplane ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?airplane ?from)) (at ?airplane ?to))
  )
)