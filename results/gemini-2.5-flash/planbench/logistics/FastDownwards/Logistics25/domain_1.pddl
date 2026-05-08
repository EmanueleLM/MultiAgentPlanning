(define (domain logistics25)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package truck airplane - object
    location city - object
  )

  (:predicates
    (at_package ?pkg - package ?loc - location)
    (at_truck ?trk - truck ?loc - location)
    (at_airplane ?ap - airplane ?loc - location)
    (in_truck ?pkg - package ?trk - truck)
    (in_airplane ?pkg - package ?ap - airplane)
    (in_city ?loc - location ?cty - city)
    (is_airport ?loc - location)
    (truck_home_city ?trk - truck ?cty - city)
  )

  (:action load_package_truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition
      (and
        (at_package ?pkg ?loc)
        (at_truck ?trk ?loc)
      )
    :effect
      (and
        (not (at_package ?pkg ?loc))
        (in_truck ?pkg ?trk)
      )
  )

  (:action unload_package_truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition
      (and
        (in_truck ?pkg ?trk)
        (at_truck ?trk ?loc)
      )
    :effect
      (and
        (not (in_truck ?pkg ?trk))
        (at_package ?pkg ?loc)
      )
  )

  (:action load_package_airplane
    :parameters (?pkg - package ?ap - airplane ?loc - location)
    :precondition
      (and
        (at_package ?pkg ?loc)
        (at_airplane ?ap ?loc)
      )
    :effect
      (and
        (not (at_package ?pkg ?loc))
        (in_airplane ?pkg ?ap)
      )
  )

  (:action unload_package_airplane
    :parameters (?pkg - package ?ap - airplane ?loc - location)
    :precondition
      (and
        (in_airplane ?pkg ?ap)
        (at_airplane ?ap ?loc)
      )
    :effect
      (and
        (not (in_airplane ?pkg ?ap))
        (at_package ?pkg ?loc)
      )
  )

  (:action drive_truck
    :parameters (?trk - truck ?from - location ?to - location ?cty - city)
    :precondition
      (and
        (at_truck ?trk ?from)
        (in_city ?from ?cty)
        (in_city ?to ?cty)
        (truck_home_city ?trk ?cty)
      )
    :effect
      (and
        (not (at_truck ?trk ?from))
        (at_truck ?trk ?to)
      )
  )

  (:action fly_airplane
    :parameters (?ap - airplane ?from_airport - location ?to_airport - location ?from_city - city ?to_city - city)
    :precondition
      (and
        (at_airplane ?ap ?from_airport)
        (is_airport ?from_airport)
        (is_airport ?to_airport)
        (in_city ?from_airport ?from_city)
        (in_city ?to_airport ?to_city)
        (not (= ?from_city ?to_city))
      )
    :effect
      (and
        (not (at_airplane ?ap ?from_airport))
        (at_airplane ?ap ?to_airport)
      )
  )
)