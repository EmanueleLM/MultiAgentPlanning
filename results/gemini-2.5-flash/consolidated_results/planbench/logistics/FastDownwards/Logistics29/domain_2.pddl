(define (domain logistics-29)
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
        (in-city ?loc - location ?city - city)
        (is-airport ?loc - location)
        (has-package ?v - (either truck airplane) ?p - package)
    )

    (:functions
        (total-cost) - number
    )

    ;; --- TRUCK ACTIONS (Within City) ---

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
            (at ?t ?l)
            (at ?p ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (has-package ?t ?p)
            (increase (total-cost) 1)
        )
    )

    (:action UNLOAD-TRUCK
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?t ?l)
            (has-package ?t ?p)
        )
        :effect (and
            (not (has-package ?t ?p))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; --- AIRPLANE ACTIONS (Between Cities via Airports) ---

    (:action FLY-AIRPLANE
        :parameters (?a - airplane ?l1 - location ?l2 - location ?c1 - city ?c2 - city)
        :precondition (and
            (at ?a ?l1)
            (is-airport ?l1)
            (is-airport ?l2)
            (in-city ?l1 ?c1)
            (in-city ?l2 ?c2)
            (not (= ?c1 ?c2))
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
            (at ?a ?l)
            (at ?p ?l)
            (is-airport ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (has-package ?a ?p)
            (increase (total-cost) 1)
        )
    )

    (:action UNLOAD-AIRPLANE
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?a ?l)
            (has-package ?a ?p)
            (is-airport ?l)
        )
        :effect (and
            (not (has-package ?a ?p))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )
)