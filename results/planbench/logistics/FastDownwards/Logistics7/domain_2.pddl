(define (domain logistics-7)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city - object
        location - object
        package - object
        vehicle - object
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?obj - (either package vehicle) ?loc - location)
        (in ?pkg - package ?v - vehicle)
        (in-city ?loc - location ?c - city)
        (airport ?loc - location)
    )

    (:functions
        (total-cost) - number
    )

    ;; Truck Actions (Intra-City)

    (:action DRIVE-TRUCK
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

    (:action LOAD-TRUCK
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

    (:action UNLOAD-TRUCK
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

    ;; Airplane Actions (Inter-Airport)

    (:action FLY-AIRPLANE
        :parameters (?a - airplane ?l1 - location ?l2 - location)
        :precondition (and
            (at ?a ?l1)
            (airport ?l1)
            (airport ?l2)
            (not (= ?l1 ?l2))
        )
        :effect (and
            (not (at ?a ?l1))
            (at ?a ?l2)
            (increase (total-cost) 1)
        )
    )

    (:action LOAD-AIRPLANE
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

    (:action UNLOAD-AIRPLANE
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