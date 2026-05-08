(define (domain truck_airplane_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    vehicle
    truck airplane - vehicle
    package
  )

  (:predicates
    (location_in_city ?loc - location ?c - city)
    (airport ?loc - location)
    (at_pkg ?p - package ?loc - location)
    (at_veh ?v - vehicle ?loc - location)
    (in ?p - package ?v - vehicle)
    (flight_conn ?src - location ?dst - location)
  )

  (:action truck-load
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (at_pkg ?p ?loc)
      (at_veh ?tr ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?tr)
    )
  )

  (:action truck-unload
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (in ?p ?tr)
      (at_veh ?tr ?loc)
    )
    :effect (and
      (not (in ?p ?tr))
      (at_pkg ?p ?loc)
    )
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_veh ?tr ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (not (at_veh ?tr ?from))
      (at_veh ?tr ?to)
    )
  )

  (:action plane-load
    :parameters (?p - package ?ap - airplane ?loc - location)
    :precondition (and
      (at_pkg ?p ?loc)
      (at_veh ?ap ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?ap)
    )
  )

  (:action plane-unload
    :parameters (?p - package ?ap - airplane ?loc - location)
    :precondition (and
      (in ?p ?ap)
      (at_veh ?ap ?loc)
    )
    :effect (and
      (not (in ?p ?ap))
      (at_pkg ?p ?loc)
    )
  )

  (:action plane-fly
    :parameters (?ap - airplane ?src - location ?dst - location)
    :precondition (and
      (at_veh ?ap ?src)
      (airport ?src)
      (airport ?dst)
      (flight_conn ?src ?dst)
    )
    :effect (and
      (not (at_veh ?ap ?src))
      (at_veh ?ap ?dst)
    )
  )
)