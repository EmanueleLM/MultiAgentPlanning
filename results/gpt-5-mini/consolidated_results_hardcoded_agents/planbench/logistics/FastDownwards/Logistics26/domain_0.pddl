(define (domain multiagent_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    ;; location membership
    (in-city ?loc - location ?c - city)
    (is-airport ?loc - location)
    (diff-city ?c1 - city ?c2 - city)

    ;; positions
    (at-package ?p - package ?loc - location)
    (at-truck ?t - truck ?loc - location)
    (at-airplane ?a - airplane ?loc - location)

    ;; in-vehicle relations
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; truck assignment to a single city (enforces truck locality)
    (truck-in-city ?t - truck ?c - city)
  )

  ;; Truck (ground) actions - prefixed with "truck_"
  (:action truck_load_into_truck
    :parameters (?p - package ?t - truck ?loc - location ?c - city)
    :precondition (and
      (at-package ?p ?loc)
      (at-truck ?t ?loc)
      (in-city ?loc ?c)
      (truck-in-city ?t ?c)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-truck ?p ?t)
    )
  )

  (:action truck_unload_from_truck
    :parameters (?p - package ?t - truck ?loc - location ?c - city)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?loc)
      (in-city ?loc ?c)
      (truck-in-city ?t ?c)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
    )
  )

  (:action truck_drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (truck-in-city ?t ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Airplane (air) actions - prefixed with "airplane_"
  (:action airplane_load_into_airplane
    :parameters (?p - package ?a - airplane ?loc - location ?c - city)
    :precondition (and
      (at-package ?p ?loc)
      (at-airplane ?a ?loc)
      (is-airport ?loc)
      (in-city ?loc ?c)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-airplane ?p ?a)
    )
  )

  (:action airplane_unload_from_airplane
    :parameters (?p - package ?a - airplane ?loc - location ?c - city)
    :precondition (and
      (in-airplane ?p ?a)
      (at-airplane ?a ?loc)
      (is-airport ?loc)
      (in-city ?loc ?c)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-package ?p ?loc)
    )
  )

  (:action airplane_fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?c1 - city ?c2 - city)
    :precondition (and
      (at-airplane ?a ?from)
      (is-airport ?from)
      (is-airport ?to)
      (in-city ?from ?c1)
      (in-city ?to ?c2)
      (diff-city ?c1 ?c2)  ;; enforce flight between different cities' airports
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )
)