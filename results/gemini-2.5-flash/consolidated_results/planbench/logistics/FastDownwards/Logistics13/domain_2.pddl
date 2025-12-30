(define (domain logistics-domain)
    (:requirements :typing :negative-preconditions :action-costs)
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
        (in-city ?loc - location ?c - city)
        (is-airport ?loc - location)
    )

    (:functions
        (total-cost) - number
    )

    ;; Truck movement (Intra-city only)
    (:action drive-truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?t ?from)
            (in-city ?from ?c)
            (in-city ?to ?c)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Airplane movement (Airport to Airport only)
    (:action fly-airplane
        :parameters (?a - airplane ?from - location ?to - location)
        :precondition (and
            (at ?a ?from)
            (is-airport ?from)
            (is-airport ?to)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Load package into vehicle
    (:action load-pkg
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

    ;; Unload package from vehicle
    (:action unload-pkg
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
)