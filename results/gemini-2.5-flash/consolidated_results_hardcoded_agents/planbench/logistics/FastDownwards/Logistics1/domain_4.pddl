(define (domain Logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        thing
        package - thing
        vehicle - thing
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?obj - thing ?l - location)
        (in ?p - package ?v - vehicle)
        (in-city ?l - location ?c - city)
        (airport ?l - location)
    )

    ; Truck Movement (Intra-city)
    (:action drive-truck
        :parameters (?t - truck ?lfrom - location ?lto - location ?c - city)
        :precondition (and
            (at ?t ?lfrom)
            (in-city ?lfrom ?c)
            (in-city ?lto ?c)
            (not (= ?lfrom ?lto))
        )
        :effect (and
            (not (at ?t ?lfrom))
            (at ?t ?lto)
        )
    )

    ; Airplane Movement (Inter-city, Airport to Airport)
    (:action fly-airplane
        :parameters (?a - airplane ?lfrom - location ?lto - location ?cfrom - city ?cto - city)
        :precondition (and
            (at ?a ?lfrom)
            (airport ?lfrom)
            (airport ?lto)
            (in-city ?lfrom ?cfrom)
            (in-city ?lto ?cto)
            (not (= ?cfrom ?cto))
        )
        :effect (and
            (not (at ?a ?lfrom))
            (at ?a ?lto)
        )
    )

    ; Load Package into Truck
    (:action load-truck
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

    ; Unload Package from Truck
    (:action unload-truck
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

    ; Load Package into Airplane
    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
        )
    )

    ; Unload Package from Airplane
    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
        )
    )