(define (domain orchestrator_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package stage)

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

    ;; explicit discrete global stage progression (ordered)
    (current_stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Truck operator actions (intra-city only)
  ;; All actions require the current global stage and advance it to the next stage,
  ;; enforcing a hard ordering of actions as explicit stages.
  (:action truck_load
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

  (:action truck_unload
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

  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (truck_at ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
      (not (= ?from ?to))
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

  ;; Airplane operator actions (airport-to-airport inter-city only)
  (:action plane_load
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

  (:action plane_unload
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

  (:action plane_fly
    :parameters (?a - airplane ?from - location ?to - location ?cf - city ?ct - city ?s - stage ?s2 - stage)
    :precondition (and
      (airplane_at ?a ?from)
      (airport ?from)
      (airport ?to)
      (location_in_city ?from ?cf)
      (location_in_city ?to ?ct)
      (not (= ?cf ?ct))
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