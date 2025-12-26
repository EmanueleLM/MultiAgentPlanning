(define (domain logistics-Logistics17)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        location
        airport - location
        non-airport - location
        thing
        package - thing
        vehicle - thing
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?obj - thing ?loc - location)
        (in ?pkg - package ?veh - vehicle)
        (in-city ?loc - location ?c - city)
    )

    (:functions
        (total-cost)
    )

    ; --- Truck Actions (Intra-city movement) ---

    (:action drive-truck
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and
            (at ?t ?l1)
            (in-city ?l1 ?c)
            (in-city ?l2 ?c)
            (not (= ?l1 ?l2))
        )
        :effect (and
            (not (at ?t ?l1))
            (at ?t ?l2)
            (increase (total-cost) 1)
        )
    )

    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?t ?l)
            (at ?p ?l)
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
            (at ?t ?l)
            (in ?p ?t)
        )
        :effect (and
            (not (in ?p ?t))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ; --- Airplane Actions (Inter-city movement) ---

    (:action fly-airplane
        :parameters (?a - airplane ?l1 - airport ?l2 - airport)
        :precondition (and
            (at ?a ?l1)
            (not (= ?l1 ?l2))
        )
        :effect (and
            (not (at ?a ?l1))
            (at ?a ?l2)
            (increase (total-cost) 10) ; Higher cost for inter-city travel
        )
    )

    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - airport)
        :precondition (and
            (at ?a ?l)
            (at ?p ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
            (increase (total-cost) 1)
        )
    )

    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - airport)
        :precondition (and
            (at ?a ?l)
            (in ?p ?a)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )