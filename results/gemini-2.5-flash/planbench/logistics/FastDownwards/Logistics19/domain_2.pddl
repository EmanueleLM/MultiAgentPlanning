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
    (at ?obj - (either package vehicle) ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (in-city ?loc - location ?c - city)
    (airport ?loc - location)
    (associated-city ?t - truck ?c - city) ; Represents that a truck belongs to a specific city
  )

  ;; Action to load a package into a truck
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
      (in-city ?l ?c)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )

  ;; Action to unload a package from a truck
  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l)
      (in-city ?l ?c)
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?t))
    )
  )

  ;; Action to load a package into an airplane
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location ?c - city)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
      (in-city ?l ?c)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )

  ;; Action to unload a package from an airplane
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location ?c - city)
    :precondition (and
      (in ?p ?a)
      (at ?a ?l)
      (in-city ?l ?c)
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?a))
    )
  )

  ;; Action to drive a truck within a city
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (associated-city ?t ?c) ; Ensure the truck belongs to this city
      (not (= ?from ?to)) ; Truck must move
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Action to fly an airplane between cities via airports
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location ?from_c - city ?to_c - city)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
      (in-city ?from ?from_c)
      (in-city ?to ?to_c)
      (not (= ?from_c ?to_c)) ; Must fly between different cities
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)