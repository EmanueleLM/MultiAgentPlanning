(define (domain transport_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location vehicle truck airplane package)

  (:predicates
    ;; static membership and site properties
    (in_city ?l - location ?c - city)
    (airport ?l - location)
    (same_city ?l1 - location ?l2 - location)  ;; true iff both locations in same city (static)
    (diff_city ?l1 - location ?l2 - location)  ;; true iff locations are in different cities (static)

    ;; truck state
    (at_truck ?t - truck ?l - location)
    (assigned_to ?t - truck ?c - city) ;; static metadata: each city has exactly one assigned truck

    ;; airplane state
    (at_airplane ?a - airplane ?l - location)

    ;; package state (exclusive: at_pkg XOR in_pkg)
    (at_pkg ?p - package ?l - location)
    (in_pkg ?p - package ?v - vehicle)
  )

  ;; -------------------
  ;; Truck actions (truck_operator)
  ;; -------------------

  (:action truck_operator-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?tr ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      ;; same_city is static and equivalent to the two in_city checks; included for clarity
      (same_city ?from ?to)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  (:action truck_operator-load
    :parameters (?tr - truck ?p - package ?loc - location)
    :precondition (and
      (at_truck ?tr ?loc)
      (at_pkg ?p ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in_pkg ?p ?tr)
    )
  )

  (:action truck_operator-unload
    :parameters (?tr - truck ?p - package ?loc - location)
    :precondition (and
      (at_truck ?tr ?loc)
      (in_pkg ?p ?tr)
    )
    :effect (and
      (not (in_pkg ?p ?tr))
      (at_pkg ?p ?loc)
    )
  )

  ;; -------------------
  ;; Airplane actions (airplane_operator)
  ;; -------------------

  (:action airplane_operator-load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (airport ?loc)
      (at_airplane ?a ?loc)
      (at_pkg ?p ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in_pkg ?p ?a)
    )
  )

  (:action airplane_operator-unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (airport ?loc)
      (at_airplane ?a ?loc)
      (in_pkg ?p ?a)
    )
    :effect (and
      (not (in_pkg ?p ?a))
      (at_pkg ?p ?loc)
    )
  )

  (:action airplane_operator-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airport ?from)
      (airport ?to)
      (at_airplane ?a ?from)
      (diff_city ?from ?to)  ;; enforces flights only between airports in different cities (static)
    )
    :effect (and
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )

)