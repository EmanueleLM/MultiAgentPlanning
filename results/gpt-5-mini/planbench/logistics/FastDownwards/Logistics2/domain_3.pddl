(define (domain truck_airplane_logistics)
  (:requirements :strips :typing)
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
    (at_package ?p - package ?loc - location)      ; package is at a location
    (at_vehicle ?v - vehicle ?loc - location)     ; vehicle is at a location
    (in_vehicle ?p - package ?v - vehicle)        ; package is in a vehicle
    (can_fly ?src - location ?dst - location)     ; explicit flight connection from src airport to dst airport
  )

  ;; Truck actions
  (:action truck-load
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (at_package ?p ?loc)
      (at_vehicle ?tr ?loc)
    )
    :effect (and
      (not (at_package ?p ?loc))
      (in_vehicle ?p ?tr)
    )
  )

  (:action truck-unload
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (in_vehicle ?p ?tr)
      (at_vehicle ?tr ?loc)
    )
    :effect (and
      (not (in_vehicle ?p ?tr))
      (at_package ?p ?loc)
    )
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_vehicle ?tr ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (not (at_vehicle ?tr ?from))
      (at_vehicle ?tr ?to)
    )
  )

  ;; Airplane actions
  (:action plane-load
    :parameters (?p - package ?ap - airplane ?loc - location)
    :precondition (and
      (at_package ?p ?loc)
      (at_vehicle ?ap ?loc)
    )
    :effect (and
      (not (at_package ?p ?loc))
      (in_vehicle ?p ?ap)
    )
  )

  (:action plane-unload
    :parameters (?p - package ?ap - airplane ?loc - location)
    :precondition (and
      (in_vehicle ?p ?ap)
      (at_vehicle ?ap ?loc)
    )
    :effect (and
      (not (in_vehicle ?p ?ap))
      (at_package ?p ?loc)
    )
  )

  (:action plane-fly
    :parameters (?ap - airplane ?src - location ?dst - location)
    :precondition (and
      (at_vehicle ?ap ?src)
      (airport ?src)
      (airport ?dst)
      (can_fly ?src ?dst)
    )
    :effect (and
      (not (at_vehicle ?ap ?src))
      (at_vehicle ?ap ?dst)
    )
  )
)