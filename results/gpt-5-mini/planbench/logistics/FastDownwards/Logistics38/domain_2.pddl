(define (domain logistics38)
  (:requirements :strips :typing)
  (:types
    city
    location
    object
    vehicle package - object
    truck airplane - vehicle
  )

  (:predicates
    (at ?o - object ?l - location)
    (in ?p - package ?v - vehicle)
    (airport ?l - location)
    (loc_in_city ?l - location ?c - city)
  )

  ;; load a package into a truck when both are at the same location
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

  ;; unload a package from a truck: package becomes at the truck's current location
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

  ;; load a package into an airplane (at an airport)
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )

  ;; unload a package from an airplane (at an airport)
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )

  ;; drive a truck between two locations in the same city (fully connected intra-city)
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; fly an airplane between two airports (inter-city via airports)
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
      (loc_in_city ?from ?cfrom)
      (loc_in_city ?to ?cto)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)