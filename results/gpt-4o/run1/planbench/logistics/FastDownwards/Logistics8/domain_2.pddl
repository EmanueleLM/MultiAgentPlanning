(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location vehicle truck airplane package
  )
  (:predicates
    (at ?obj - (truck airplane package) ?loc - location)
    (in ?pkg - package ?veh - (truck airplane))
    (is_airport ?loc - location)
    (in_city ?loc - location ?city - city)
    (vehicle_at_airport ?veh - (truck airplane) ?loc - location)
  )

  (:action load-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?trk ?loc))
    :effect (and (in ?pkg ?trk) (not (at ?pkg ?loc)))
  )

  (:action unload-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (in ?pkg ?trk) (at ?trk ?loc))
    :effect (and (at ?pkg ?loc) (not (in ?pkg ?trk)))
  )

  (:action drive-truck
    :parameters (?trk - truck ?from ?to - location ?city - city)
    :precondition (and (at ?trk ?from) (in_city ?from ?city) (in_city ?to ?city) (not (exists (?x - airplane) (at ?x ?to))))
    :effect (and (at ?trk ?to) (not (at ?trk ?from)))
  )

  (:action load-airplane
    :parameters (?pkg - package ?apl - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?apl ?loc) (is_airport ?loc))
    :effect (and (in ?pkg ?apl) (not (at ?pkg ?loc)))
  )

  (:action unload-airplane
    :parameters (?pkg - package ?apl - airplane ?loc - location)
    :precondition (and (in ?pkg ?apl) (at ?apl ?loc))
    :effect (and (at ?pkg ?loc) (not (in ?pkg ?apl)))
  )

  (:action fly-airplane
    :parameters (?apl - airplane ?from ?to - location)
    :precondition (and (is_airport ?from) (is_airport ?to) (at ?apl ?from))
    :effect (and (at ?apl ?to) (not (at ?apl ?from)))
  )
)