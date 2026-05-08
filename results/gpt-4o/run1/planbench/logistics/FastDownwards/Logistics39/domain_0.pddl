(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types vehicle package location city - object)
  (:predicates
    (at ?veh - vehicle ?loc - location)
    (in_city ?loc - location ?city - city)
    (at_airport ?loc - location)
    (loaded ?pkg - package ?veh - vehicle)
    (package_at ?pkg - package ?loc - location)
  )
  
  (:action load_truck
    :parameters (?pkg - package ?trk - vehicle ?loc - location)
    :precondition (and (at ?trk ?loc) (package_at ?pkg ?loc))
    :effect (and (loaded ?pkg ?trk) (not (package_at ?pkg ?loc)))
  )

  (:action unload_truck
    :parameters (?pkg - package ?trk - vehicle ?loc - location)
    :precondition (and (at ?trk ?loc) (loaded ?pkg ?trk))
    :effect (and (package_at ?pkg ?loc) (not (loaded ?pkg ?trk)))
  )

  (:action load_airplane
    :parameters (?pkg - package ?pln - vehicle ?loc - location)
    :precondition (and (at ?pln ?loc) (package_at ?pkg ?loc))
    :effect (and (loaded ?pkg ?pln) (not (package_at ?pkg ?loc)))
  )

  (:action unload_airplane
    :parameters (?pkg - package ?pln - vehicle ?loc - location)
    :precondition (and (at ?pln ?loc) (loaded ?pkg ?pln))
    :effect (and (package_at ?pkg ?loc) (not (loaded ?pkg ?pln)))
  )

  (:action drive_truck
    :parameters (?trk - vehicle ?from - location ?to - location)
    :precondition (and (at ?trk ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (at ?trk ?to) (not (at ?trk ?from)))
  )

  (:action fly_airplane
    :parameters (?pln - vehicle ?from - location ?to - location)
    :precondition (and (at ?pln ?from) (at_airport ?from) (at_airport ?to))
    :effect (and (at ?pln ?to) (not (at ?pln ?from)))
  )
)