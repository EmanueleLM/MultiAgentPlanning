(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        location
        vehicle
        truck - vehicle
        airplane - vehicle
        package
    )

    (:predicates
        (at ?obj - (either package vehicle) ?loc - location)
        (in ?pkg - package ?veh - vehicle) ; Package inside vehicle
        (in-city ?loc - location ?city - city)
        (airport ?loc - location)
    )

    (:functions
        (total-cost)
    )

    ;; Truck Actions
    (:action drive-truck
        :parameters (?t - truck ?lfrom - location ?lto - location ?c - city)
        :precondition (and
            (at ?t ?lfrom)
            (in-city ?lfrom ?c)
            (in-city ?lto ?c)
        )
        :effect (and
            (not (at ?t ?lfrom))
            (at ?t ?lto)
            (increase (total-cost) 1)
        )
    )

    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?t)
            (increase (total-cost) 1)
        )
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (not (in ?p ?t))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; Airplane Actions
    (:action fly-air
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
            (increase (total-cost) 10) ; Intercity travel cost
        )
    )

    (:action load-air
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
            (airport ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
            (increase (total-cost) 1)
        )
    )

    (:action unload-air
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
            (airport ?l)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )
)