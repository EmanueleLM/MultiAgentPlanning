(define (domain logistics29)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package truck airplane - movable
    location - object
    city - object
    movable - object
  )
  (:predicates
    (at ?obj - movable ?loc - location)
    (in ?pkg - package ?veh - (either truck airplane))
    (in-city ?loc - location ?city - city)
    (is-airport ?loc - location)
  )

  ;; Load package into truck
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

  ;; Unload package from truck
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

  ;; Load package into airplane
  (:action load_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?airplane ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?airplane)
    )
  )

  ;; Unload package from airplane
  (:action unload_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and
      (in ?pkg ?airplane)
      (at ?airplane ?loc)
    )
    :effect (and
      (at ?pkg ?loc)
      (not (in ?pkg ?airplane))
    )
  )

  ;; Drive truck within a city
  (:action drive_truck
    :parameters (?truck - truck ?from_loc - location ?to_loc - location ?city - city)
    :precondition (and
      (at ?truck ?from_loc)
      (in-city ?from_loc ?city)
      (in-city ?to_loc ?city)
      (not (= ?from_loc ?to_loc))
    )
    :effect (and
      (not (at ?truck ?from_loc))
      (at ?truck ?to_loc)
    )
  )

  ;; Fly airplane between cities
  (:action fly_airplane
    :parameters (?airplane - airplane ?from_loc - location ?to_loc - location ?from_city - city ?to_city - city)
    :precondition (and
      (at ?airplane ?from_loc)
      (is-airport ?from_loc)
      (is-airport ?to_loc)
      (in-city ?from_loc ?from_city)
      (in-city ?to_loc ?to_city)
      (not (= ?from_city ?to_city))
    )
    :effect (and
      (not (at ?airplane ?from_loc))
      (at ?airplane ?to_loc)
    )
  )
)