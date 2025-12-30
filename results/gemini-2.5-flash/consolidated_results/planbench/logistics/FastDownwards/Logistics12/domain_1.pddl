(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        location
        truck
        airplane
        package
    )

    (:predicates
        (at ?obj - (either truck airplane package) ?loc - location)
        (in-city ?loc - location ?city - city)
        (is-airport ?loc - location)
        (in-city-truck ?t - truck ?c - city)
        (connected ?l1 - location ?l2 - location ?c - city)
        (loaded ?p - package ?v - (either truck airplane))
    )

    (:functions
        (total-cost)
    )

    ;; --- Truck Actions (within a City) ---

    (:action DRIVE-TRUCK
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and
            (at ?t ?l1)
            (in-city-truck ?t ?c)
            (in-city ?l1 ?c)
            (in-city ?l2 ?c)
            (connected ?l1 ?l2 ?c)
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
            (loaded ?p ?t)
            (increase (total-cost) 1)
        )
    )

    (:action UNLOAD-TRUCK
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?t ?l)
            (loaded ?p ?t)
        )
        :effect (and
            (not (loaded ?p ?t))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; --- Airplane Actions (between Airports) ---

    (:action FLY-PLANE
        :parameters (?a - airplane ?l1 - location ?l2 - location)
        :precondition (and
            (at ?a ?l1)
            (is-airport ?l1)
            (is-airport ?l2)
            (not (= ?l1 ?l2))
        )
        :effect (and
            (not (at ?a ?l1))
            (at ?a ?l2)
            (increase (total-cost) 10)
        )
    )

    (:action LOAD-PLANE
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?a ?l)
            (at ?p ?l)
            (is-airport ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (loaded ?p ?a)
            (increase (total-cost) 1)
        )
    )

    (:action UNLOAD-PLANE
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?a ?l)
            (loaded ?p ?a)
            (is-airport ?l)
        )
        :effect (and
            (not (loaded ?p ?a))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )
)