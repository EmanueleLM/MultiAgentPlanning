(define (domain logistics_multiagent)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types
    city
    location
    truck
    airplane
    package
  )

  (:predicates
    ;; package at a location (true only if not inside any vehicle)
    (at_pkg ?p - package ?l - location)

    ;; package inside a truck
    (in_truck ?p - package ?t - truck)

    ;; package inside an airplane
    (in_plane ?p - package ?a - airplane)

    ;; truck at a location
    (at_truck ?t - truck ?l - location)

    ;; airplane at a location
    (at_plane ?a - airplane ?l - location)

    ;; location -> city membership
    (in_city ?l - location ?c - city)

    ;; airport-to-city link (each city's airport location)
    (airport_for ?l - location ?c - city)
  )

  ;; Truck actions

  (:action truck-load
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_truck ?t ?l)
      (at_pkg ?p ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_pkg ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  ;; Airplane actions

  (:action airplane-load
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_plane ?a ?l)
      (at_pkg ?p ?l)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (at_pkg ?p ?l))
    )
  )

  (:action airplane-unload
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (at_plane ?a ?l)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in_plane ?p ?a))
    )
  )

  (:action airplane-fly
    :parameters (?a - airplane ?src - location ?dst - location ?c1 - city ?c2 - city)
    :precondition (and
      (at_plane ?a ?src)
      (airport_for ?src ?c1)
      (airport_for ?dst ?c2)
      (not (= ?c1 ?c2))
    )
    :effect (and
      (at_plane ?a ?dst)
      (not (at_plane ?a ?src))
    )
  )
)