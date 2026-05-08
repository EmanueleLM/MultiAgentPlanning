(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane vehicle_or_package location city)
  ;; declare package, truck, airplane as subtypes of vehicle_or_package
  ;; (PDDL allows grouping subtypes with '-' in the types declaration)
  (:predicates
    ;; an object that is a package, truck or airplane is at a location
    (at ?o - vehicle_or_package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (airport ?l - location)
    (in_city ?l - location ?c - city)
  )

  ;; load package into truck: package and truck must be co-located
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at ?p ?l))
    )
  )

  ;; unload package from truck: package must be in truck and truck at a location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  ;; load package into airplane: package and airplane must be co-located
  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (at ?p ?l))
    )
  )

  ;; unload package from airplane: package in airplane and airplane at a location
  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in_plane ?p ?a))
    )
  )

  ;; drive a truck between two locations in the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  ;; fly an airplane between two airport locations
  (:action fly_plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at ?a ?to)
      (not (at ?a ?from))
    )
  )
)