(define (domain logistics_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types package vehicle - object truck airplane - vehicle location city - object)
  
  (:predicates 
    (at ?obj - (either package vehicle) ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (airport ?loc - location)
    (in_city ?loc - location ?city - city)
  )
  
  (:action load_package_truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?trk ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?trk))
  )

  (:action unload_package_truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (in ?pkg ?trk) (at ?trk ?loc))
    :effect (and (not (in ?pkg ?trk)) (at ?pkg ?loc))
  )

  (:action load_package_airplane
    :parameters (?pkg - package ?apl - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?apl ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?apl))
  )

  (:action unload_package_airplane
    :parameters (?pkg - package ?apl - airplane ?loc - location)
    :precondition (and (in ?pkg ?apl) (at ?apl ?loc))
    :effect (and (not (in ?pkg ?apl)) (at ?pkg ?loc))
  )

  (:action drive_truck
    :parameters (?trk - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?trk ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at ?trk ?from)) (at ?trk ?to))
  )

  (:action fly_airplane
    :parameters (?apl - airplane ?from - location ?to - location)
    :precondition (and (at ?apl ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?apl ?from)) (at ?apl ?to))
  )
)