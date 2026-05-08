(define (domain logistics34)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    package
    truck - vehicle
    airplane - vehicle
    vehicle
    location
    city
  )
  (:predicates
    (at ?pkg - package ?loc - location)
    (at-vehicle ?veh - vehicle ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (in-city ?loc - location ?city - city)
    (is-airport ?loc - location)
  )
  (:functions
    (total-cost)
  )

  (:action load-package-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at-vehicle ?trk ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?trk)
      (increase (total-cost) 1)
    )
  )

  (:action unload-package-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and
      (in ?pkg ?trk)
      (at-vehicle ?trk ?loc)
    )
    :effect (and
      (not (in ?pkg ?trk))
      (at ?pkg ?loc)
      (increase (total-cost) 1)
    )
  )

  (:action load-package-airplane
    :parameters (?pkg - package ?plane - airplane ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at-vehicle ?plane ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?plane)
      (increase (total-cost) 1)
    )
  )

  (:action unload-package-airplane
    :parameters (?pkg - package ?plane - airplane ?loc - location)
    :precondition (and
      (in ?pkg ?plane)
      (at-vehicle ?plane ?loc)
    )
    :effect (and
      (not (in ?pkg ?plane))
      (at ?pkg ?loc)
      (increase (total-cost) 1)
    )
  )

  (:action drive-truck
    :parameters (?trk - truck ?from - location ?to - location ?city - city)
    :precondition (and
      (at-vehicle ?trk ?from)
      (in-city ?from ?city)
      (in-city ?to ?city)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-vehicle ?trk ?from))
      (at-vehicle ?trk ?to)
      (increase (total-cost) 1)
    )
  )

  (:action fly-airplane
    :parameters (?plane - airplane ?from - location ?to - location ?from-city - city ?to-city - city)
    :precondition (and
      (at-vehicle ?plane ?from)
      (is-airport ?from)
      (is-airport ?to)
      (in-city ?from ?from-city)
      (in-city ?to ?to-city)
      (not (= ?from ?to))
      (not (= ?from-city ?to-city))
    )
    :effect (and
      (not (at-vehicle ?plane ?from))
      (at-vehicle ?plane ?to)
      (increase (total-cost) 1)
    )
  )
)