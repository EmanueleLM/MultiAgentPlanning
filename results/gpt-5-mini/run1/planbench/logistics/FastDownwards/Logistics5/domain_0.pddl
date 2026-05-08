(define (domain logistics_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    (location_in_city ?l - location ?c - city)
    (airport ?l - location)
    (truck_assigned_to ?t - truck ?c - city)
    (truck_at ?t - truck ?l - location)
    (package_at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (airplane_at ?a - airplane ?l - location)
    (in_airplane ?p - package ?a - airplane)
  )

  ; Truck operator actions (names prefixed to keep agents distinct)
  (:action truck_operator-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
      (truck_assigned_to ?t ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (not (truck_at ?t ?from))
      (truck_at ?t ?to)
    )
  )

  (:action truck_operator-load
    :parameters (?t - truck ?p - package ?l - location ?c - city)
    :precondition (and
      (truck_at ?t ?l)
      (package_at ?p ?l)
      (location_in_city ?l ?c)
      (truck_assigned_to ?t ?c)
    )
    :effect (and
      (not (package_at ?p ?l))
      (in_truck ?p ?t)
    )
  )

  (:action truck_operator-unload
    :parameters (?t - truck ?p - package ?l - location ?c - city)
    :precondition (and
      (truck_at ?t ?l)
      (in_truck ?p ?t)
      (location_in_city ?l ?c)
      (truck_assigned_to ?t ?c)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (package_at ?p ?l)
    )
  )

  ; Airplane operator actions (names prefixed to keep agents distinct)
  (:action airplane_operator-load
    :parameters (?a - airplane ?p - package ?l - location ?c - city)
    :precondition (and
      (airplane_at ?a ?l)
      (package_at ?p ?l)
      (airport ?l)
      (location_in_city ?l ?c)
    )
    :effect (and
      (not (package_at ?p ?l))
      (in_airplane ?p ?a)
    )
  )

  (:action airplane_operator-unload
    :parameters (?a - airplane ?p - package ?l - location ?c - city)
    :precondition (and
      (in_airplane ?p ?a)
      (airplane_at ?a ?l)
      (airport ?l)
      (location_in_city ?l ?c)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (package_at ?p ?l)
    )
  )

  (:action airplane_operator-fly
    :parameters (?a - airplane ?from - location ?to - location ?c1 - city ?c2 - city)
    :precondition (and
      (airplane_at ?a ?from)
      (airport ?from)
      (airport ?to)
      (location_in_city ?from ?c1)
      (location_in_city ?to ?c2)
      (not (= ?c1 ?c2))
      (not (= ?from ?to))
    )
    :effect (and
      (not (airplane_at ?a ?from))
      (airplane_at ?a ?to)
    )
  )
)