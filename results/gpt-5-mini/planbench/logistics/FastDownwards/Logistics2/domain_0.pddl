(define (domain truck_airplane_logistics)
  (:requirements :strips :typing)
  (:types
    city
    location
    airport_location - location
    vehicle
    truck airplane - vehicle
    package
  )

  (:predicates
    ;; location and city membership
    (location_in_city ?loc - location ?c - city)
    (airport ?loc - location)                      ;; airport flag on locations
    ;; object placement: an object is either a vehicle or a package
    (at ?obj - (either vehicle package) ?loc - location)
    ;; package is loaded into a vehicle
    (in ?pkg - package ?veh - vehicle)
    ;; explicit flight connectivity between two airport locations (direct flight allowed)
    (flight_conn ?src - location ?dst - location)
    ;; declarative assertions provided in the inputs (kept as static facts)
    (uniqueness_of_truck_per_city)
    (each_city_has_exactly_one_airport)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Truck operator actions (prefixed with "truck-")
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action truck-load-into-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (at ?p ?loc)
      (at ?tr ?loc)
    )
    :effect (and
      (not (at ?p ?loc))
      (in ?p ?tr)
    )
  )

  (:action truck-unload-from-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (in ?p ?tr)
      (at ?tr ?loc)
    )
    :effect (and
      (not (in ?p ?tr))
      (at ?p ?loc)
    )
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?tr ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Airplane operator actions (prefixed with "plane-")
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action plane-load-into-airplane
    :parameters (?p - package ?ap - airplane ?loc - location)
    :precondition (and
      (at ?ap ?loc)
      (at ?p ?loc)
      (airport ?loc)            ; enforce loading at an airport location
    )
    :effect (and
      (not (at ?p ?loc))
      (in ?p ?ap)
    )
  )

  (:action plane-unload-from-airplane
    :parameters (?p - package ?ap - airplane ?loc - location)
    :precondition (and
      (in ?p ?ap)
      (at ?ap ?loc)
      (airport ?loc)            ; enforce unloading at an airport location
    )
    :effect (and
      (not (in ?p ?ap))
      (at ?p ?loc)
    )
  )

  (:action plane-fly-between-airports
    :parameters (?ap - airplane ?src - location ?dst - location)
    :precondition (and
      (at ?ap ?src)
      (airport ?src)
      (airport ?dst)
      (flight_conn ?src ?dst)    ; explicit connectivity controls allowed flights
    )
    :effect (and
      (not (at ?ap ?src))
      (at ?ap ?dst)
    )
  )

)