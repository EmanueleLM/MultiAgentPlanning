(define (domain orchestrator_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package stage)

  (:predicates
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?l - location)
    (package_at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)

    (location_in_city ?l - location ?c - city)
    (airport ?l - location)

    (connected_in_city ?from - location ?to - location ?c - city)
    (flight_path ?from - location ?to - location)

    (current_stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action truck_operator_load
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (truck_at ?t ?l)
      (package_at ?p ?l)
      (current_stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (package_at ?p ?l))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action truck_operator_unload
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (truck_at ?t ?l)
      (in_truck ?p ?t)
      (current_stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (package_at ?p ?l)
      (not (in_truck ?p ?t))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action truck_operator_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (truck_at ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
      (connected_in_city ?from ?to ?c)
      (current_stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (truck_at ?t ?to)
      (not (truck_at ?t ?from))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action plane_operator_load
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (airplane_at ?a ?l)
      (package_at ?p ?l)
      (airport ?l)
      (current_stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (package_at ?p ?l))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action plane_operator_unload
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (airplane_at ?a ?l)
      (in_plane ?p ?a)
      (airport ?l)
      (current_stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (package_at ?p ?l)
      (not (in_plane ?p ?a))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action plane_operator_fly
    :parameters (?a - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (airplane_at ?a ?from)
      (airport ?from)
      (airport ?to)
      (flight_path ?from ?to)
      (current_stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (airplane_at ?a ?to)
      (not (airplane_at ?a ?from))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )
)