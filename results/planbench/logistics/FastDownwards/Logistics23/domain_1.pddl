(define (domain Logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package truck airplane - vehicle
        city location object - object
        vehicle - object
    )

    (:predicates
        (at ?obj - (or package vehicle) ?loc - location) ; Used for packages or vehicles at a location
        (in ?p - package ?v - vehicle) ; Package inside a vehicle
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)
        (connected ?l1 - location ?l2 - location) ; L1 and L2 are in the same city
    )

    ;; --- Truck Actions (Intra-city ground transport) ---

    (:action LOAD-TRUCK
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

    (:action UNLOAD-TRUCK
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?t))
        )
    )

    (:action DRIVE-TRUCK
        :parameters (?t - truck ?lfrom - location ?lto - location ?c - city)
        :precondition (and
            (at ?t ?lfrom)
            (not (= ?lfrom ?lto))
            (in-city ?lfrom ?c)
            (in-city ?lto ?c)
            (connected ?lfrom ?lto)
        )
        :effect (and
            (not (at ?t ?lfrom))
            (at ?t ?lto)
        )
    )

    ;; --- Airplane Actions (Inter-city air transport) ---

    (:action LOAD-AIRPLANE
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
        )
    )

    (:action UNLOAD-AIRPLANE
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?a))
        )
    )

    (:action FLY-AIRPLANE
        :parameters (?a - airplane ?lfrom - location ?lto - location ?cfrom - city ?cto - city)
        :precondition (and
            (at ?a ?lfrom)
            (is-airport ?lfrom)
            (is-airport ?lto)
            (in-city ?lfrom ?cfrom)
            (in-city ?lto ?cto)
            (not (= ?cfrom ?cto)) ; Must be flying between different cities
        )
        :effect (and
            (not (at ?a ?lfrom))
            (at ?a ?lto)
        )
    )
)