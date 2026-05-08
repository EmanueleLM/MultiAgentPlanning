(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  ;; Known constant objects (declared here so domain references to these names are valid)
  (:constants
    package_0 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
  )

  (:predicates
    ;; package state
    (pkg-at ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?pl - airplane)

    ;; vehicle locations
    (truck-at ?t - truck ?l - location)
    (plane-at ?pl - airplane ?l - location)

    ;; static location properties
    (airport ?l - location)
    (loc-in-city ?l - location ?c - city)
  )

  ;; Truck actions for driver_0 (namespaced action for truck_0)
  (:action drive_truck_0
    :parameters (?from - location ?to - location)
    :precondition (and
      (truck-at truck_0 ?from)
      (loc-in-city ?from city_0)
      (loc-in-city ?to city_0)
    )
    :effect (and
      (not (truck-at truck_0 ?from))
      (truck-at truck_0 ?to)
    )
  )

  (:action load_truck_0
    :parameters (?p - package ?loc - location)
    :precondition (and
      (truck-at truck_0 ?loc)
      (pkg-at ?p ?loc)
      ;; package must not already be in any vehicle
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
      (not (in-plane ?p airplane_0))
      (not (in-plane ?p airplane_1))
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-truck ?p truck_0)
    )
  )

  (:action unload_truck_0
    :parameters (?p - package ?loc - location)
    :precondition (and
      (truck-at truck_0 ?loc)
      (in-truck ?p truck_0)
    )
    :effect (and
      (not (in-truck ?p truck_0))
      (pkg-at ?p ?loc)
    )
  )

  ;; Truck actions for driver_1 (namespaced action for truck_1)
  (:action drive_truck_1
    :parameters (?from - location ?to - location)
    :precondition (and
      (truck-at truck_1 ?from)
      (loc-in-city ?from city_1)
      (loc-in-city ?to city_1)
    )
    :effect (and
      (not (truck-at truck_1 ?from))
      (truck-at truck_1 ?to)
    )
  )

  (:action load_truck_1
    :parameters (?p - package ?loc - location)
    :precondition (and
      (truck-at truck_1 ?loc)
      (pkg-at ?p ?loc)
      ;; package must not already be in any vehicle
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
      (not (in-plane ?p airplane_0))
      (not (in-plane ?p airplane_1))
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-truck ?p truck_1)
    )
  )

  (:action unload_truck_1
    :parameters (?p - package ?loc - location)
    :precondition (and
      (truck-at truck_1 ?loc)
      (in-truck ?p truck_1)
    )
    :effect (and
      (not (in-truck ?p truck_1))
      (pkg-at ?p ?loc)
    )
  )

  ;; Airplane actions for pilot_0 (namespaced action for airplane_0)
  (:action fly_airplane_0
    :parameters (?from - location ?to - location)
    :precondition (and
      (plane-at airplane_0 ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (plane-at airplane_0 ?from))
      (plane-at airplane_0 ?to)
    )
  )

  (:action load_airplane_0
    :parameters (?p - package ?loc - location)
    :precondition (and
      (plane-at airplane_0 ?loc)
      (airport ?loc)
      (pkg-at ?p ?loc)
      ;; package must not already be in any vehicle
      (not (in-plane ?p airplane_0))
      (not (in-plane ?p airplane_1))
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-plane ?p airplane_0)
    )
  )

  (:action unload_airplane_0
    :parameters (?p - package ?loc - location)
    :precondition (and
      (plane-at airplane_0 ?loc)
      (airport ?loc)
      (in-plane ?p airplane_0)
    )
    :effect (and
      (not (in-plane ?p airplane_0))
      (pkg-at ?p ?loc)
    )
  )

  ;; Airplane actions for pilot_1 (namespaced action for airplane_1)
  (:action fly_airplane_1
    :parameters (?from - location ?to - location)
    :precondition (and
      (plane-at airplane_1 ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (plane-at airplane_1 ?from))
      (plane-at airplane_1 ?to)
    )
  )

  (:action load_airplane_1
    :parameters (?p - package ?loc - location)
    :precondition (and
      (plane-at airplane_1 ?loc)
      (airport ?loc)
      (pkg-at ?p ?loc)
      ;; package must not already be in any vehicle
      (not (in-plane ?p airplane_0))
      (not (in-plane ?p airplane_1))
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-plane ?p airplane_1)
    )
  )

  (:action unload_airplane_1
    :parameters (?p - package ?loc - location)
    :precondition (and
      (plane-at airplane_1 ?loc)
      (airport ?loc)
      (in-plane ?p airplane_1)
    )
    :effect (and
      (not (in-plane ?p airplane_1))
      (pkg-at ?p ?loc)
    )
  )
)