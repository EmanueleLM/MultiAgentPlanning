(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        package
        location
        city
        truck airplane - vehicle
    )

    (:predicates
        (at ?x - (package vehicle) ?l - location)
        (in-city ?l - location ?c - city)
        (airport ?l - location)
        (loaded ?p - package ?v - vehicle)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Truck Actions (Local Movement)

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
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (loaded ?p ?t)
            (increase (total-cost) 1)
        )
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (loaded ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (not (loaded ?p ?t))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Airplane Actions (Inter-City Movement)

    (:action fly-air
        :parameters (?a - airplane ?l1 - location ?l2 - location ?c1 - city ?c2 - city)
        :precondition (and
            (at ?a ?l1)
            (airport ?l1)
            (airport ?l2)
            (in-city ?l1 ?c1)
            (in-city ?l2 ?c2)
            (not (= ?c1 ?c2))
        )
        :effect (and
            (not (at ?a ?l1))
            (at ?a ?l2)
            (increase (total-cost) 10) ; Inter-city travel cost is higher
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
            (loaded ?p ?a)
            (increase (total-cost) 1)
        )
    )

    (:action unload-air
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (loaded ?p ?a)
            (at ?a ?l)
            (airport ?l)
        )
        :effect (and
            (not (loaded ?p ?a))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )
)