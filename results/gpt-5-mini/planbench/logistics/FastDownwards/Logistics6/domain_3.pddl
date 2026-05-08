(define (domain transport_domain)
  (:requirements :typing :negative-preconditions)
  (:types truck airplane package location city)
  (:constants
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    city_0 city_1 - city
  )
  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (in-city ?l - location ?c - city)
    (airport ?l - location)
  )

  (:action driver_0_load_truck_0
    :parameters (?p - package ?l - location)
    :precondition (and
      (at-truck truck_0 ?l)
      (at-package ?p ?l)
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
      (not (in-airplane ?p airplane_0))
      (not (in-airplane ?p airplane_1))
      (in-city ?l city_0)
    )
    :effect (and
      (in-truck ?p truck_0)
      (not (at-package ?p ?l))
    )
  )

  (:action driver_0_unload_truck_0
    :parameters (?p - package ?l - location)
    :precondition (and
      (in-truck ?p truck_0)
      (at-truck truck_0 ?l)
      (in-city ?l city_0)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-truck ?p truck_0))
    )
  )

  (:action driver_0_drive_truck_0
    :parameters (?from - location ?to - location)
    :precondition (and
      (at-truck truck_0 ?from)
      (in-city ?from city_0)
      (in-city ?to city_0)
    )
    :effect (and
      (at-truck truck_0 ?to)
      (not (at-truck truck_0 ?from))
    )
  )

  (:action driver_1_load_truck_1
    :parameters (?p - package ?l - location)
    :precondition (and
      (at-truck truck_1 ?l)
      (at-package ?p ?l)
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
      (not (in-airplane ?p airplane_0))
      (not (in-airplane ?p airplane_1))
      (in-city ?l city_1)
    )
    :effect (and
      (in-truck ?p truck_1)
      (not (at-package ?p ?l))
    )
  )

  (:action driver_1_unload_truck_1
    :parameters (?p - package ?l - location)
    :precondition (and
      (in-truck ?p truck_1)
      (at-truck truck_1 ?l)
      (in-city ?l city_1)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-truck ?p truck_1))
    )
  )

  (:action driver_1_drive_truck_1
    :parameters (?from - location ?to - location)
    :precondition (and
      (at-truck truck_1 ?from)
      (in-city ?from city_1)
      (in-city ?to city_1)
    )
    :effect (and
      (at-truck truck_1 ?to)
      (not (at-truck truck_1 ?from))
    )
  )

  (:action pilot_0_load_airplane_0
    :parameters (?p - package ?l - location)
    :precondition (and
      (at-airplane airplane_0 ?l)
      (at-package ?p ?l)
      (airport ?l)
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
      (not (in-airplane ?p airplane_0))
      (not (in-airplane ?p airplane_1))
    )
    :effect (and
      (in-airplane ?p airplane_0)
      (not (at-package ?p ?l))
    )
  )

  (:action pilot_0_unload_airplane_0
    :parameters (?p - package ?l - location)
    :precondition (and
      (in-airplane ?p airplane_0)
      (at-airplane airplane_0 ?l)
      (airport ?l)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-airplane ?p airplane_0))
    )
  )

  (:action pilot_0_fly_airplane_0
    :parameters (?from - location ?to - location)
    :precondition (and
      (at-airplane airplane_0 ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at-airplane airplane_0 ?to)
      (not (at-airplane airplane_0 ?from))
    )
  )

  (:action pilot_1_load_airplane_1
    :parameters (?p - package ?l - location)
    :precondition (and
      (at-airplane airplane_1 ?l)
      (at-package ?p ?l)
      (airport ?l)
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
      (not (in-airplane ?p airplane_0))
      (not (in-airplane ?p airplane_1))
    )
    :effect (and
      (in-airplane ?p airplane_1)
      (not (at-package ?p ?l))
    )
  )

  (:action pilot_1_unload_airplane_1
    :parameters (?p - package ?l - location)
    :precondition (and
      (in-airplane ?p airplane_1)
      (at-airplane airplane_1 ?l)
      (airport ?l)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-airplane ?p airplane_1))
    )
  )

  (:action pilot_1_fly_airplane_1
    :parameters (?from - location ?to - location)
    :precondition (and
      (at-airplane airplane_1 ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at-airplane airplane_1 ?to)
      (not (at-airplane airplane_1 ?from))
    )
  )
)