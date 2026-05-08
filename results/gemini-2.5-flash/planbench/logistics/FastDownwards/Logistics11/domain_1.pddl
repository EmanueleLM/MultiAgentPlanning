(define (domain logistics_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package
    city
    location
    truck
    airplane
  )
  (:predicates
    (at ?obj - (or package truck airplane) ?loc - location)
    (in ?pkg - package ?veh - (or truck airplane))
    (in_city ?loc - location ?c - city)
    (is_airport ?l - location)
  )
  (:action load_pkg_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )

  (:action unload_pkg_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
    )
  )

  (:action load_pkg_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )

  (:action unload_pkg_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (not (= ?from ?to)) ; Truck must move to a different location
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from_loc - location ?to_loc - location ?from_city - city ?to_city - city)
    :precondition (and
      (at ?a ?from_loc)
      (is_airport ?from_loc)
      (is_airport ?to_loc)
      (in_city ?from_loc ?from_city)
      (in_city ?to_loc ?to_city)
      (not (= ?from_city ?to_city)) ; Airplanes fly between different cities
      (not (= ?from_loc ?to_loc)) ; Airplane must move to a different airport location
    )
    :effect (and
      (not (at ?a ?from_loc))
      (at ?a ?to_loc)
    )
  )
)