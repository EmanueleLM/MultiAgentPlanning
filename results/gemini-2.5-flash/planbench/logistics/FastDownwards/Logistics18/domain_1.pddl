(define (domain logistics)
  (:requirements :strips :typing)
  (:types
    package truck airplane - vehicle_object
    location - object
    city - object
    vehicle_object - object
  )

  (:predicates
    (at ?obj - (package vehicle_object))
    (in ?pkg - package ?veh - (truck airplane))
    (loc_in_city ?loc - location ?city - city)
    (is_airport ?loc - location)
  )

  (:action load_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?truck ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?truck)
    )
  )

  (:action unload_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and
      (in ?pkg ?truck)
      (at ?truck ?loc)
    )
    :effect (and
      (at ?pkg ?loc)
      (not (in ?pkg ?truck))
    )
  )

  (:action drive_truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and
      (at ?truck ?from)
      (loc_in_city ?from ?city)
      (loc_in_city ?to ?city)
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )

  (:action load_airplane
    :parameters (?pkg - package ?plane - airplane ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?plane ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?plane)
    )
  )

  (:action unload_airplane
    :parameters (?pkg - package ?plane - airplane ?loc - location)
    :precondition (and
      (in ?pkg ?plane)
      (at ?plane ?loc)
    )
    :effect (and
      (at ?pkg ?loc)
      (not (in ?pkg ?plane))
    )
  )

  (:action fly_airplane
    :parameters (?plane - airplane ?from - location ?to - location)
    :precondition (and
      (at ?plane ?from)
      (is_airport ?from)
      (is_airport ?to)
    )
    :effect (and
      (not (at ?plane ?from))
      (at ?plane ?to)
    )
  )
)