(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package truck airplane location city
  )

  (:predicates
    ;; package/vehicle/location membership
    (at_package ?p - package ?l - location)
    (in_truck  ?p - package ?tr - truck)
    (in_airplane ?p - package ?ap - airplane)

    ;; vehicle location predicates
    (at_truck ?tr - truck ?l - location)
    (at_airplane ?ap - airplane ?l - location)

    ;; map/attribute predicates
    (location_in_city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Truck 0 actions (driver_0)
  (:action drive_truck_0
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_truck truck_0 ?from)
      (location_in_city ?from city_0)
      (location_in_city ?to   city_0)
    )
    :effect (and
      (not (at_truck truck_0 ?from))
      (at_truck truck_0 ?to)
    )
  )

  (:action load_truck_0
    :parameters (?p - package ?loc - location)
    :precondition (and
      (at_truck truck_0 ?loc)
      (at_package ?p ?loc)
      ;; package must not already be in any other vehicle (explicitly enumerated)
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
      (not (in_airplane ?p airplane_0))
      (not (in_airplane ?p airplane_1))
      ;; ensure the location is in truck_0's city (explicit constraint)
      (location_in_city ?loc city_0)
    )
    :effect (and
      (in_truck ?p truck_0)
      (not (at_package ?p ?loc))
    )
  )

  (:action unload_truck_0
    :parameters (?p - package ?loc - location)
    :precondition (and
      (at_truck truck_0 ?loc)
      (in_truck ?p truck_0)
      (location_in_city ?loc city_0)
    )
    :effect (and
      (at_package ?p ?loc)
      (not (in_truck ?p truck_0))
    )
  )

  ;; Truck 1 actions (driver_1)
  (:action drive_truck_1
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_truck truck_1 ?from)
      (location_in_city ?from city_1)
      (location_in_city ?to   city_1)
    )
    :effect (and
      (not (at_truck truck_1 ?from))
      (at_truck truck_1 ?to)
    )
  )

  (:action load_truck_1
    :parameters (?p - package ?loc - location)
    :precondition (and
      (at_truck truck_1 ?loc)
      (at_package ?p ?loc)
      ;; package must not already be in any other vehicle (explicitly enumerated)
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
      (not (in_airplane ?p airplane_0))
      (not (in_airplane ?p airplane_1))
      ;; ensure the location is in truck_1's city (explicit constraint)
      (location_in_city ?loc city_1)
    )
    :effect (and
      (in_truck ?p truck_1)
      (not (at_package ?p ?loc))
    )
  )

  (:action unload_truck_1
    :parameters (?p - package ?loc - location)
    :precondition (and
      (at_truck truck_1 ?loc)
      (in_truck ?p truck_1)
      (location_in_city ?loc city_1)
    )
    :effect (and
      (at_package ?p ?loc)
      (not (in_truck ?p truck_1))
    )
  )

  ;; Airplane 0 actions (pilot_0)
  (:action fly_airplane_0
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_airplane airplane_0 ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at_airplane airplane_0 ?from))
      (at_airplane airplane_0 ?to)
      ;; packages in the airplane remain (in_airplane facts are unchanged)
    )
  )

  (:action load_airplane_0
    :parameters (?p - package ?loc - location)
    :precondition (and
      (airport ?loc)
      (at_airplane airplane_0 ?loc)
      (at_package ?p ?loc)
      ;; package must not already be in any vehicle (explicitly enumerated)
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
      (not (in_airplane ?p airplane_0))
      (not (in_airplane ?p airplane_1))
    )
    :effect (and
      (in_airplane ?p airplane_0)
      (not (at_package ?p ?loc))
    )
  )

  (:action unload_airplane_0
    :parameters (?p - package ?loc - location)
    :precondition (and
      (airport ?loc)
      (at_airplane airplane_0 ?loc)
      (in_airplane ?p airplane_0)
    )
    :effect (and
      (at_package ?p ?loc)
      (not (in_airplane ?p airplane_0))
    )
  )

  ;; Airplane 1 actions (pilot_1)
  (:action fly_airplane_1
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_airplane airplane_1 ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at_airplane airplane_1 ?from))
      (at_airplane airplane_1 ?to)
    )
  )

  (:action load_airplane_1
    :parameters (?p - package ?loc - location)
    :precondition (and
      (airport ?loc)
      (at_airplane airplane_1 ?loc)
      (at_package ?p ?loc)
      ;; package must not already be in any vehicle (explicitly enumerated)
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
      (not (in_airplane ?p airplane_0))
      (not (in_airplane ?p airplane_1))
    )
    :effect (and
      (in_airplane ?p airplane_1)
      (not (at_package ?p ?loc))
    )
  )

  (:action unload_airplane_1
    :parameters (?p - package ?loc - location)
    :precondition (and
      (airport ?loc)
      (at_airplane airplane_1 ?loc)
      (in_airplane ?p airplane_1)
    )
    :effect (and
      (at_package ?p ?loc)
      (not (in_airplane ?p airplane_1))
    )
  )

)