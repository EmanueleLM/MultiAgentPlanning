(define (domain logistics48)
  (:requirements :strips :typing)
  (:types city location truck airplane package)

  (:predicates
    (in_city ?loc - location ?c - city)
    (airport ?loc - location)

    (truck_at ?t - truck ?loc - location)
    (airplane_at ?a - airplane ?loc - location)

    (package_at ?p - package ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (package_at ?p ?loc)
      (truck_at ?t ?loc)
    )
    :effect (and
      (not (package_at ?p ?loc))
      (in_truck ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in_truck ?p ?t)
      (truck_at ?t ?loc)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (package_at ?p ?loc)
    )
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (package_at ?p ?loc)
      (airplane_at ?a ?loc)
    )
    :effect (and
      (not (package_at ?p ?loc))
      (in_airplane ?p ?a)
    )
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in_airplane ?p ?a)
      (airplane_at ?a ?loc)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (package_at ?p ?loc)
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (not (truck_at ?t ?from))
      (truck_at ?t ?to)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane_at ?a ?from)
      (airport ?from)
      (airport ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (airplane_at ?a ?from))
      (airplane_at ?a ?to)
    )
  )
)