(define (domain logistics_combined)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    object
    vehicle - object
    truck airplane - vehicle
    package - object
  )

  (:predicates
    ; location and city membership
    (in_city ?l - location ?c - city)
    (airport ?l - location)

    ; object locations (packages and vehicles)
    (at ?o - object ?l - location)

    ; package inside a vehicle
    (in ?p - package ?v - vehicle)

    ; package on ground (not inside any vehicle)
    (free ?p - package)

    ; each truck is associated with a city (static)
    (city_of ?t - truck ?c - city)
  )

  ; -------------------------
  ; Truck-manager actions (namespaced: truck_manager)
  ; -------------------------
  (:action truck_manager_load_truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (city_of ?t ?c)
      (in_city ?l ?c)
      (at ?p ?l)
      (at ?t ?l)
      (free ?p)
    )
    :effect (and
      (in ?p ?t)
      (not (at ?p ?l))
      (not (free ?p))
    )
  )

  (:action truck_manager_unload_truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (city_of ?t ?c)
      (in_city ?l ?c)
      (in ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
      (free ?p)
    )
  )

  (:action truck_manager_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (city_of ?t ?c)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (at ?t ?from)
      (not (at ?t ?to))
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  ; -------------------------
  ; Air-manager actions (namespaced: air_manager)
  ; -------------------------
  (:action air_manager_load_airplane
    :parameters (?p - package ?a - airplane ?ap - location ?c - city)
    :precondition (and
      (airport ?ap)
      (in_city ?ap ?c)
      (at ?p ?ap)
      (at ?a ?ap)
      (free ?p)
    )
    :effect (and
      (in ?p ?a)
      (not (at ?p ?ap))
      (not (free ?p))
    )
  )

  (:action air_manager_unload_airplane
    :parameters (?p - package ?a - airplane ?ap - location ?c - city)
    :precondition (and
      (airport ?ap)
      (in_city ?ap ?c)
      (in ?p ?a)
      (at ?a ?ap)
    )
    :effect (and
      (not (in ?p ?a))
      (at ?p ?ap)
      (free ?p)
    )
  )

  (:action air_manager_fly
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city)
    :precondition (and
      (airport ?from)
      (airport ?to)
      (at ?a ?from)
      (in_city ?from ?c_from)
      (in_city ?to ?c_to)
      (not (at ?a ?to))
    )
    :effect (and
      (at ?a ?to)
      (not (at ?a ?from))
    )
  )
)