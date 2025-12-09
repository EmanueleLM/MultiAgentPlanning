(define (domain transport_domain)
  (:requirements :strips :typing)
  (:types truck airplane package location airport)  ; airport is a subtype of location

  (:predicates
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?al - airport)
    (package_at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (same_city ?l1 - location ?l2 - location)
    (different_city ?l1 - location ?l2 - location)
  )

  ;; Truck agent actions (prefixed with agent name)
  (:action truck_load_truck
    :parameters (?tr - truck ?p - package ?loc - location)
    :precondition (and
      (truck_at ?tr ?loc)
      (package_at ?p ?loc)
    )
    :effect (and
      (in_truck ?p ?tr)
      (not (package_at ?p ?loc))
    )
  )

  (:action truck_unload_truck
    :parameters (?tr - truck ?p - package ?loc - location)
    :precondition (and
      (truck_at ?tr ?loc)
      (in_truck ?p ?tr)
    )
    :effect (and
      (package_at ?p ?loc)
      (not (in_truck ?p ?tr))
    )
  )

  (:action truck_drive_truck
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (and
      (truck_at ?tr ?from)
      (same_city ?from ?to)
    )
    :effect (and
      (truck_at ?tr ?to)
      (not (truck_at ?tr ?from))
    )
  )

  ;; Airplane agent actions (prefixed with agent name)
  (:action airplane_load_airplane
    :parameters (?ap - airplane ?p - package ?airport - airport)
    :precondition (and
      (airplane_at ?ap ?airport)
      (package_at ?p ?airport)
    )
    :effect (and
      (in_airplane ?p ?ap)
      (not (package_at ?p ?airport))
    )
  )

  (:action airplane_unload_airplane
    :parameters (?ap - airplane ?p - package ?airport - airport)
    :precondition (and
      (airplane_at ?ap ?airport)
      (in_airplane ?p ?ap)
    )
    :effect (and
      (package_at ?p ?airport)
      (not (in_airplane ?p ?ap))
    )
  )

  (:action airplane_fly
    :parameters (?ap - airplane ?from - airport ?to - airport)
    :precondition (and
      (airplane_at ?ap ?from)
      (different_city ?from ?to)
    )
    :effect (and
      (airplane_at ?ap ?to)
      (not (airplane_at ?ap ?from))
    )
  )
)