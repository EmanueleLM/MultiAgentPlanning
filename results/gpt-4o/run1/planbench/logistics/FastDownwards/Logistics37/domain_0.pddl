(define (domain transport)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    vehicle location city package object - object
    truck airplane - vehicle
  )

  (:predicates
    (at ?obj - object ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (airport ?loc - location)
    (in_city ?loc - location ?city - city)
    (is_truck ?veh - vehicle)
    (is_airplane ?veh - vehicle)
  )

  (:action load_truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?trk ?loc) (is_truck ?trk))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?trk))
  )

  (:action unload_truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (in ?pkg ?trk) (at ?trk ?loc))
    :effect (and (not (in ?pkg ?trk)) (at ?pkg ?loc))
  )

  (:action load_airplane
    :parameters (?pkg - package ?apl - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?apl ?loc) (is_airplane ?apl))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?apl))
  )

  (:action unload_airplane
    :parameters (?pkg - package ?apl - airplane ?loc - location)
    :precondition (and (in ?pkg ?apl) (at ?apl ?loc))
    :effect (and (not (in ?pkg ?apl)) (at ?pkg ?loc))
  )

  (:action drive_truck
    :parameters (?trk - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?trk ?from) (in_city ?from ?city) (in_city ?to ?city) (is_truck ?trk))
    :effect (and (not (at ?trk ?from)) (at ?trk ?to))
  )

  (:action fly_airplane
    :parameters (?apl - airplane ?from - location ?to - location)
    :precondition (and (at ?apl ?from) (airport ?from) (airport ?to) (is_airplane ?apl))
    :effect (and (not (at ?apl ?from)) (at ?apl ?to))
  )
)