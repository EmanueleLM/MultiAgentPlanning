(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)
  (:predicates
    (at ?obj - (either truck airplane package) ?loc - location)
    (in_city ?loc - location ?city - city)
    (airport ?loc - location)
    (in_truck ?package - package ?truck - truck)
    (in_airplane ?package - package ?airplane - airplane)
  )

  (:action load_truck
    :parameters (?package - package ?truck - truck ?loc - location)
    :precondition (and (at ?package ?loc) (at ?truck ?loc))
    :effect (and (not (at ?package ?loc)) (in_truck ?package ?truck))
  )

  (:action unload_truck
    :parameters (?package - package ?truck - truck ?loc - location)
    :precondition (and (in_truck ?package ?truck) (at ?truck ?loc))
    :effect (and (not (in_truck ?package ?truck)) (at ?package ?loc))
  )

  (:action drive_truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?truck ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  (:action load_airplane
    :parameters (?package - package ?airplane - airplane ?loc - location)
    :precondition (and (at ?package ?loc) (at ?airplane ?loc))
    :effect (and (not (at ?package ?loc)) (in_airplane ?package ?airplane))
  )

  (:action unload_airplane
    :parameters (?package - package ?airplane - airplane ?loc - location)
    :precondition (and (in_airplane ?package ?airplane) (at ?airplane ?loc))
    :effect (and (not (in_airplane ?package ?airplane)) (at ?package ?loc))
  )

  (:action fly_airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at ?airplane ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?airplane ?from)) (at ?airplane ?to))
  )
)