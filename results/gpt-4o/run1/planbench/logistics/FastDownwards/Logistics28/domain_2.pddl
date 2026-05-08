(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types 
    city 
    location 
    vehicle 
    truck - vehicle 
    airplane - vehicle
    package
  )

  (:predicates 
    (at ?obj - (either vehicle package) ?loc - location)
    (in_city ?loc - location ?city - city)
    (is_airport ?loc - location)
    (in ?pkg - package ?veh - vehicle)
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

  (:action load-airplane
    :parameters (?pkg - package ?pln - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?pln ?loc))
    :effect (and (in ?pkg ?pln) (not (at ?pkg ?loc)))
  )

  (:action unload-airplane
    :parameters (?pkg - package ?pln - airplane ?loc - location)
    :precondition (and (in ?pkg ?pln) (at ?pln ?loc))
    :effect (and (at ?pkg ?loc) (not (in ?pkg ?pln)))
  )

  (:action drive-truck
    :parameters (?trk - truck ?from ?to - location ?city - city)
    :precondition (and (at ?trk ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (at ?trk ?to) (not (at ?trk ?from)))
  )

  (:action fly-airplane
    :parameters (?pln - airplane ?from ?to - location)
    :precondition (and (at ?pln ?from) (is_airport ?from) (is_airport ?to))
    :effect (and (at ?pln ?to) (not (at ?pln ?from)))
  )
)