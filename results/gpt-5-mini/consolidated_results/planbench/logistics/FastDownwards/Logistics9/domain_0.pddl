(define (domain orchestrator_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    ;; vehicle and package locations / states
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?l - location)
    (package_at ?p - package ?l - location)  ;; package on the ground at a location
    (in_truck ?p - package ?t - truck)       ;; package loaded in truck
    (in_plane ?p - package ?a - airplane)    ;; package loaded in airplane

    ;; map / site predicates
    (location_in_city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Truck operator actions (intra-city only)
  (:action truck_load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck_at ?t ?l)
      (package_at ?p ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (package_at ?p ?l))
    )
  )

  (:action truck_unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck_at ?t ?l)
      (in_truck ?p ?t)
    )
    :effect (and
      (package_at ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (truck_at ?t ?to)
      (not (truck_at ?t ?from))
    )
  )

  ;; Airplane operator actions (airport-to-airport inter-city only)
  (:action plane_load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane_at ?a ?l)
      (package_at ?p ?l)
      (airport ?l)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (package_at ?p ?l))
    )
  )

  (:action plane_unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane_at ?a ?l)
      (in_plane ?p ?a)
      (airport ?l)
    )
    :effect (and
      (package_at ?p ?l)
      (not (in_plane ?p ?a))
    )
  )

  (:action plane_fly
    :parameters (?a - airplane ?from - location ?to - location ?cf - city ?ct - city)
    :precondition (and
      (airplane_at ?a ?from)
      (airport ?from)
      (airport ?to)
      (location_in_city ?from ?cf)
      (location_in_city ?to ?ct)
      (not (= ?cf ?ct))
    )
    :effect (and
      (airplane_at ?a ?to)
      (not (airplane_at ?a ?from))
    )
  )
)