(define (domain logistics-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity truck airplane package location city)
  (:predicates
    ;; Generic physical presence: vehicles (truck/airplane) and packages are entities
    (At ?e - entity ?l - location)
    ;; Package contained in a vehicle (truck or airplane)
    (In ?p - package ?v - entity)
    ;; Static location -> city membership
    (LocationInCity ?l - location ?c - city)
    ;; Static truck -> city assignment (truck operates only within this city)
    (TruckInCity ?t - truck ?c - city)
    ;; Airports - only airports allow airplane load/unload and flights
    (IsAirport ?l - location)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Truck agent actions (prefixed with truck_)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Load a package into a truck at a location in the truck's city.
  (:action truck_load
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
                    (At ?t ?l)
                    (At ?p ?l)
                    (TruckInCity ?t ?c)
                    (LocationInCity ?l ?c)
                  )
    :effect (and
              (not (At ?p ?l))
              (In ?p ?t)
            )
  )

  ;; Drive a truck between two locations in the same city the truck operates in.
  ;; This action moves the truck; any packages In the truck remain In the truck.
  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
                    (At ?t ?from)
                    (TruckInCity ?t ?c)
                    (LocationInCity ?from ?c)
                    (LocationInCity ?to ?c)
                    ;; disallow no-op flights where from and to are the same by ensuring
                    ;; the truck is not already at the destination (requires :negative-preconditions).
                    (not (At ?t ?to))
                  )
    :effect (and
              (not (At ?t ?from))
              (At ?t ?to)
            )
  )

  ;; Unload a package from a truck at a location in the truck's city.
  (:action truck_unload
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
                    (At ?t ?l)
                    (In ?p ?t)
                    (TruckInCity ?t ?c)
                    (LocationInCity ?l ?c)
                  )
    :effect (and
              (not (In ?p ?t))
              (At ?p ?l)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Airplane agent actions (prefixed with airplane_)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Load a package into an airplane at an airport (both plane and package must be co-located).
  (:action airplane_load
    :parameters (?plane - airplane ?p - package ?l - location)
    :precondition (and
                    (At ?plane ?l)
                    (At ?p ?l)
                    (IsAirport ?l)
                  )
    :effect (and
              (not (At ?p ?l))
              (In ?p ?plane)
            )
  )

  ;; Fly an airplane between two airports. Packages In the airplane remain In the airplane.
  (:action airplane_fly
    :parameters (?plane - airplane ?from - location ?to - location)
    :precondition (and
                    (At ?plane ?from)
                    (IsAirport ?from)
                    (IsAirport ?to)
                    ;; prevent trivial/no-op flight to same airport by ensuring plane is not already at destination
                    (not (At ?plane ?to))
                  )
    :effect (and
              (not (At ?plane ?from))
              (At ?plane ?to)
            )
  )

  ;; Unload a package from an airplane at an airport (plane must be at the airport; package In plane).
  (:action airplane_unload
    :parameters (?plane - airplane ?p - package ?l - location)
    :precondition (and
                    (At ?plane ?l)
                    (In ?p ?plane)
                    (IsAirport ?l)
                  )
    :effect (and
              (not (In ?p ?plane))
              (At ?p ?l)
            )
  )
)