(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location package vehicle - object truck airplane - vehicle)
  (:predicates 
    (at ?pkg - package ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (at-vehicle ?veh - vehicle ?loc - location)
    (is-airport ?loc - location)
    (in-city ?loc - location ?city - city)
  )

  (:action load-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at-vehicle ?trk ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?trk))
  )

  (:action unload-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (in ?pkg ?trk) (at-vehicle ?trk ?loc))
    :effect (and (not (in ?pkg ?trk)) (at ?pkg ?loc))
  )

  (:action load-airplane
    :parameters (?pkg - package ?apl - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at-vehicle ?apl ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?apl))
  )

  (:action unload-airplane
    :parameters (?pkg - package ?apl - airplane ?loc - location)
    :precondition (and (in ?pkg ?apl) (at-vehicle ?apl ?loc))
    :effect (and (not (in ?pkg ?apl)) (at ?pkg ?loc))
  )

  (:action drive-truck
    :parameters (?trk - truck ?from - location ?to - location ?city - city)
    :precondition (and (at-vehicle ?trk ?from) (in-city ?from ?city) (in-city ?to ?city))
    :effect (and (not (at-vehicle ?trk ?from)) (at-vehicle ?trk ?to))
  )

  (:action fly-airplane
    :parameters (?apl - airplane ?from - location ?to - location)
    :precondition (and (at-vehicle ?apl ?from) (is-airport ?from) (is-airport ?to))
    :effect (and (not (at-vehicle ?apl ?from)) (at-vehicle ?apl ?to))
  )
)