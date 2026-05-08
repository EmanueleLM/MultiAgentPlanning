(define (domain logistics_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    ;; Static predicates
    (location_in_city ?loc - location ?c - city)
    (truck_assigned_to ?t - truck ?c - city)
    (airport ?loc - location)
    ;; Dynamic predicates
    (at_truck ?t - truck ?loc - location)
    (at_airplane ?a - airplane ?loc - location)
    (at_pkg ?p - package ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
  )

  ;; Truck operator actions (prefix: truck_operator_)
  (:action truck_operator_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
      (truck_assigned_to ?t ?c)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  (:action truck_operator_load
    :parameters (?t - truck ?p - package ?loc - location ?c - city)
    :precondition (and
      (at_truck ?t ?loc)
      (at_pkg ?p ?loc)
      (location_in_city ?loc ?c)
      (truck_assigned_to ?t ?c)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in_truck ?p ?t)
    )
  )

  (:action truck_operator_unload
    :parameters (?t - truck ?p - package ?loc - location ?c - city)
    :precondition (and
      (at_truck ?t ?loc)
      (in_truck ?p ?t)
      (location_in_city ?loc ?c)
      (truck_assigned_to ?t ?c)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_pkg ?p ?loc)
    )
  )

  ;; Airplane operator actions (prefix: plane_operator_)
  (:action plane_operator_load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at_airplane ?a ?loc)
      (at_pkg ?p ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in_plane ?p ?a)
    )
  )

  (:action plane_operator_unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at_airplane ?a ?loc)
      (in_plane ?p ?a)
      (airport ?loc)
    )
    :effect (and
      (not (in_plane ?p ?a))
      (at_pkg ?p ?loc)
    )
  )

  (:action plane_operator_fly
    :parameters (?a - airplane ?from - location ?to - location ?c1 - city ?c2 - city)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (location_in_city ?from ?c1)
      (location_in_city ?to ?c2)
      (not (= ?c1 ?c2))
    )
    :effect (and
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )
)