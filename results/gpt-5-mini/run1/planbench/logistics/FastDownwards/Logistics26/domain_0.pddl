(define (domain multi_modal_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location package vehicle truck airplane)

  (:predicates
    ; vehicle location
    (at ?v - vehicle ?l - location)
    ; package at a location
    (at_pkg ?p - package ?l - location)
    ; package inside a vehicle (truck or airplane)
    (in ?p - package ?v - vehicle)
    ; location is an airport
    (airport ?l - location)
    ; location belongs to a city
    (loc_in_city ?l - location ?c - city)
  )

  ; Truck agent actions - names prefixed with truck_agent_
  (:action truck_agent_load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at ?t ?loc)
      (at_pkg ?p ?loc)  ; package and truck in same location
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?t)
    )
  )

  (:action truck_agent_unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at ?t ?loc)
      (in ?p ?t)  ; package must be in this truck
    )
    :effect (and
      (not (in ?p ?t))
      (at_pkg ?p ?loc)
    )
  )

  (:action truck_agent_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (loc_in_city ?from ?c)  ; ensure both locations are in the same city
      (loc_in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ; Airplane agent actions - names prefixed with airplane_agent_
  (:action airplane_agent_load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at ?a ?loc)
      (at_pkg ?p ?loc)  ; package and airplane in same location
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?a)
    )
  )

  (:action airplane_agent_unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at ?a ?loc)
      (in ?p ?a)  ; package must be in this airplane
    )
    :effect (and
      (not (in ?p ?a))
      (at_pkg ?p ?loc)
    )
  )

  (:action airplane_agent_fly
    :parameters (?a - airplane ?from - location ?to - location ?c1 - city ?c2 - city)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
      (loc_in_city ?from ?c1)
      (loc_in_city ?to ?c2)
      (not (= ?c1 ?c2)) ; airplanes fly between airports in different cities only
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)