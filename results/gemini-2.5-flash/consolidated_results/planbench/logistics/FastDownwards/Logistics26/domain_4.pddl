(define (domain Logistics26)
    (:requirements :strips :typing :negative-preconditions :action-costs)
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
        (in-city ?loc - location ?city - city)
        (connected ?loc1 - location ?loc2 - location ?city - city)
        (airport ?loc - location)
    )

    (:functions
        (total-cost) - number
    )

    ;; Action: Drive Truck within a city
    (:action drive-truck
        :parameters (?t - truck ?lfrom - location ?lto - location ?c - city)
        :precondition (and
            (at ?t ?lfrom)
            (connected ?lfrom ?lto ?c)
        )
        :effect (and
            (not (at ?t ?lfrom))
            (at ?t ?lto)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Load Package onto Vehicle (Truck or Airplane)
    (:action load
        :parameters (?p - package ?v - vehicle ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?v ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?v)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Unload Package from Vehicle (Truck or Airplane)
    (:action unload
        :parameters (?p - package ?v - vehicle ?l - location)
        :precondition (and
            (in ?p ?v)
            (at ?v ?l)
        )
        :effect (and
            (not (in ?p ?v))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Fly Airplane between Airports
    (:action fly
        :parameters (?a - airplane ?lfrom - location ?lto - location)
        :precondition (and
            (at ?a ?lfrom)
            (airport ?lfrom)
            (airport ?lto)
        )
        :effect (and
            (not (at ?a ?lfrom))
            (at ?a ?lto)
            (increase (total-cost) 1)
        )
    )