(define (domain city_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    airport - location
    vehicle
    truck airplane - vehicle
    package
  )

  (:predicates
    ;; vehicle at a location (airports are locations)
    (at ?v - vehicle ?l - location)

    ;; package is physically at a location (not inside a vehicle)
    (at_package ?p - package ?l - location)

    ;; package loaded inside a vehicle
    (loaded_in ?p - package ?v - vehicle)

    ;; static membership: which city a location belongs to
    (in_city ?l - location ?c - city)

    ;; which city a truck is assigned to
    (truck_assigned_to_city ?t - truck ?c - city)

    ;; air connectivity between airports (directed, include both directions in problem if needed)
    (air_route ?from - airport ?to - airport)

    ;; truck connectivity between locations (intra-city). Populate per-problem.
    (connected_by_truck ?from - location ?to - location)
  )

  ;; Load package into a truck (package and truck must be co-located)
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?t ?l)
      (at_package ?p ?l)
    )
    :effect (and
      (loaded_in ?p ?t)
      (not (at_package ?p ?l))
    )
  )

  ;; Unload package from a truck (package becomes physically at truck's location)
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (loaded_in ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (loaded_in ?p ?t))
      (at_package ?p ?l)
    )
  )

  ;; Load package into an airplane (requires airplane at an airport and package at same airport)
  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - airport)
    :precondition (and
      (at ?a ?l)
      (at_package ?p ?l)
    )
    :effect (and
      (loaded_in ?p ?a)
      (not (at_package ?p ?l))
    )
  )

  ;; Unload package from an airplane (package becomes physically at airplane's airport)
  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - airport)
    :precondition (and
      (loaded_in ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (not (loaded_in ?p ?a))
      (at_package ?p ?l)
    )
  )

  ;; Drive a truck from one location to another within the same city.
  ;; Requires explicit connected_by_truck edge in the problem (intra-city connectivity).
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (truck_assigned_to_city ?t ?c)
      (connected_by_truck ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  ;; Fly an airplane from one airport to another (air_route must exist).
  (:action fly_plane
    :parameters (?a - airplane ?from - airport ?to - airport)
    :precondition (and
      (at ?a ?from)
      (air_route ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (at ?a ?to)
      (not (at ?a ?from))
    )
  )
)