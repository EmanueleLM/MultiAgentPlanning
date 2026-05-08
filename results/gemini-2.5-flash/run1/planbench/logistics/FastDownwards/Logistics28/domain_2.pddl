(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    package
    vehicle
    truck - vehicle
    airplane - vehicle
  )

  (:predicates
    (at ?obj - (either package vehicle) ?loc - location) ; Fix: Changed (or ...) to (either ...)
    (in ?pkg - package ?veh - vehicle) ; package is inside vehicle
    (in_city ?loc - location ?city - city)
    (is_airport ?loc - location)
  )

  ;; Action: Load a package into a truck
  (:action load_truck
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

  ;; Action: Unload a package from a truck
  (:action unload_truck
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

  ;; Action: Drive a truck within a city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (not (= ?from ?to)) ; Must drive to a different location
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Action: Load a package into an airplane
  (:action load_airplane
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

  ;; Action: Unload a package from an airplane
  (:action unload_airplane
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

  ;; Action: Fly an airplane between airports in different cities
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
    :precondition (and
      (at ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
      (in_city ?from ?from_city)
      (in_city ?to ?to_city)
      (not (= ?from_city ?to_city)) ; Must fly between different cities
      (not (= ?from ?to)) ; Must fly to a different location
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)