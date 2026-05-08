(define (domain jack_of_all_trades_transport)
  (:requirements :strips :typing)
  (:types package truck airplane location city)

  (:predicates
    (at ?p - package ?l - location)                ; package at a location (not in any vehicle)
    (free ?p - package)                           ; package not inside any vehicle
    (in_truck ?p - package ?t - truck)            ; package inside truck
    (in_airplane ?p - package ?a - airplane)      ; package inside airplane
    (truck_at ?t - truck ?l - location)           ; truck is at location
    (airplane_at ?a - airplane ?l - location)     ; airplane is at location
    (is_airport ?l - location)                    ; location is an airport
    (in_city ?l - location ?c - city)             ; location belongs to city
  )

  ;; Load a package into a truck: package and truck must be at the same location and package must be free.
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (truck_at ?t ?l)
      (free ?p)
    )
    :effect (and
      (not (at ?p ?l))
      (not (free ?p))
      (in_truck ?p ?t)
    )
  )

  ;; Unload a package from a truck: package must be in the truck; it becomes at the truck's location and free.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (truck_at ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at ?p ?l)
      (free ?p)
    )
  )

  ;; Load a package into an airplane: package and airplane must be at the same airport location and package must be free.
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (airplane_at ?a ?l)
      (free ?p)
    )
    :effect (and
      (not (at ?p ?l))
      (not (free ?p))
      (in_airplane ?p ?a)
    )
  )

  ;; Unload a package from an airplane: package must be in the airplane; it becomes at the airplane's location and free.
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (airplane_at ?a ?l)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at ?p ?l)
      (free ?p)
    )
  )

  ;; Drive a truck between two locations in the same city.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (truck_at ?t ?from))
      (truck_at ?t ?to)
    )
  )

  ;; Fly an airplane between two airport locations.
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane_at ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
    )
    :effect (and
      (not (airplane_at ?a ?from))
      (airplane_at ?a ?to)
    )
  )
)