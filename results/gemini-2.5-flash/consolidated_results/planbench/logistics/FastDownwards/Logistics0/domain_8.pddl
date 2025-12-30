(define (domain ground-air-logistics)
    (:requirements :typing :negative-preconditions :action-costs :equality)
    (:types
        city location
        movable
        package - movable
        vehicle - movable
        truck airplane - vehicle
    )

    (:predicates
        (at ?x - movable ?l - location)
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)
        (in ?p - package ?v - vehicle)
    )

    (:functions
        (total-cost) - number
    )

    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location ?c - city)
        :precondition (and
            (at ?t ?l)
            (at ?p ?l)
            (in-city ?l ?c)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?t)
            (increase (total-cost) 1)
        )
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location ?c - city)
        :precondition (and
            (at ?t ?l)
            (in ?p ?t)
            (in-city ?l ?c)
        )
        :effect (and
            (not (in ?p ?t))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

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

    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?a ?l)
            (at ?p ?l)
            (is-airport ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
            (increase (total-cost) 1)
        )
    )

    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?a ?l)
            (in ?p ?a)
            (is-airport ?l)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    (:action fly-airplane
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