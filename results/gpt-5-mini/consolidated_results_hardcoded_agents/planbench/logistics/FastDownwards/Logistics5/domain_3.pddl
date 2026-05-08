(define (domain logistics_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package stage)

  (:predicates
    ;; Static predicates
    (location_in_city ?loc - location ?c - city)
    (truck_assigned_to ?t - truck ?c - city)
    (airport ?loc - location)
    (next ?s1 - stage ?s2 - stage)

    ;; Stage predicate to enforce discrete ordered progression
    (at_stage ?s - stage)

    ;; Dynamic predicates
    (at_truck ?t - truck ?loc - location)
    (at_airplane ?a - airplane ?loc - location)
    (at_pkg ?p - package ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
  )

  ;; Truck operator actions (prefix: truck_operator_)
  ;; All actions advance the global stage: consume current stage and produce next stage.

  (:action truck_operator_drive
    :parameters (?s - stage ?s2 - stage ?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_stage ?s)
      (next ?s ?s2)
      (at_truck ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
      (truck_assigned_to ?t ?c)
    )
    :effect (and
      (not (at_stage ?s))
      (at_stage ?s2)
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  (:action truck_operator_load
    :parameters (?s - stage ?s2 - stage ?t - truck ?p - package ?loc - location ?c - city)
    :precondition (and
      (at_stage ?s)
      (next ?s ?s2)
      (at_truck ?t ?loc)
      (at_pkg ?p ?loc)
      (location_in_city ?loc ?c)
      (truck_assigned_to ?t ?c)
    )
    :effect (and
      (not (at_stage ?s))
      (at_stage ?s2)
      (not (at_pkg ?p ?loc))
      (in_truck ?p ?t)
    )
  )

  (:action truck_operator_unload
    :parameters (?s - stage ?s2 - stage ?t - truck ?p - package ?loc - location ?c - city)
    :precondition (and
      (at_stage ?s)
      (next ?s ?s2)
      (at_truck ?t ?loc)
      (in_truck ?p ?t)
      (location_in_city ?loc ?c)
      (truck_assigned_to ?t ?c)
    )
    :effect (and
      (not (at_stage ?s))
      (at_stage ?s2)
      (not (in_truck ?p ?t))
      (at_pkg ?p ?loc)
    )
  )

  ;; Airplane operator actions (prefix: airplane_operator_)
  (:action airplane_operator_load
    :parameters (?s - stage ?s2 - stage ?a - airplane ?p - package ?loc - location ?c - city)
    :precondition (and
      (at_stage ?s)
      (next ?s ?s2)
      (at_airplane ?a ?loc)
      (at_pkg ?p ?loc)
      (airport ?loc)
      (location_in_city ?loc ?c)
    )
    :effect (and
      (not (at_stage ?s))
      (at_stage ?s2)
      (not (at_pkg ?p ?loc))
      (in_plane ?p ?a)
    )
  )

  (:action airplane_operator_unload
    :parameters (?s - stage ?s2 - stage ?a - airplane ?p - package ?loc - location ?c - city)
    :precondition (and
      (at_stage ?s)
      (next ?s ?s2)
      (at_airplane ?a ?loc)
      (in_plane ?p ?a)
      (airport ?loc)
      (location_in_city ?loc ?c)
    )
    :effect (and
      (not (at_stage ?s))
      (at_stage ?s2)
      (not (in_plane ?p ?a))
      (at_pkg ?p ?loc)
    )
  )

  (:action airplane_operator_fly
    :parameters (?s - stage ?s2 - stage ?a - airplane ?from - location ?to - location ?c1 - city ?c2 - city)
    :precondition (and
      (at_stage ?s)
      (next ?s ?s2)
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (location_in_city ?from ?c1)
      (location_in_city ?to ?c2)
      (not (= ?c1 ?c2))
    )
    :effect (and
      (not (at_stage ?s))
      (at_stage ?s2)
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )
)