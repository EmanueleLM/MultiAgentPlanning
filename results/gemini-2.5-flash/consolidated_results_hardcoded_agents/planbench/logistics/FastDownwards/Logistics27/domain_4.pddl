(define (domain logistics-27)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city location
        thing ; Common parent for package and vehicle
        package - thing
        vehicle - thing
        truck airplane - vehicle
    )

    (:predicates
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)
        (at ?o - thing ?l - location)
        (in ?p - package ?v - vehicle)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Load Package into Truck
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

    ;; 2. Unload Package from Truck
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

    ;; 3. Load Package into Airplane
    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
            (increase (total-cost) 1)
        )
    )

    ;; 4. Unload Package from Airplane
    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; 5. Drive Truck (Intra-city movement)
    (:action drive-truck
        :parameters (?t - truck ?l_from - location ?l_to - location ?c - city)
        :precondition (and
            (at ?t ?l_from)
            (in-city ?l_from ?c)
            (in-city ?l_to ?c)
            (not (= ?l_from ?l_to))
        )
        :effect (and
            (not (at ?t ?l_from))
            (at ?t ?l_to)
            (increase (total-cost) 1)
        )
    )

    ;; 6. Fly Airplane (Inter-city movement, airport to airport)
    (:action fly-airplane
        :parameters (?a - airplane ?l_from - location ?l_to - location ?c_from - city ?c_to - city)
        :precondition (and
            (at ?a ?l_from)
            (is-airport ?l_from)
            (is-airport ?l_to)
            (in-city ?l_from ?c_from)
            (in-city ?l_to ?c_to)
            (not (= ?c_from ?c_to)) ; Must move between different cities
        )
        :effect (and
            (not (at ?a ?l_from))
            (at ?a ?l_to)
            (increase (total-cost) 1)
        )
    )
)