(define (domain Logistics5)
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
        (at ?o - (either package vehicle) ?l - location)
        (in ?p - package ?v - vehicle)
        (loc-in-city ?l - location ?c - city)
        (is-airport ?l - location)
    )
    
    (:functions
        (total-cost) - number
    )

    ;; 1. Drive Truck (Intra-city movement)
    (:action drive
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and
            (at ?t ?l1)
            (loc-in-city ?l1 ?c)
            (loc-in-city ?l2 ?c)
        )
        :effect (and
            (not (at ?t ?l1))
            (at ?t ?l2)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Load Package onto Truck
    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (in ?p ?t)
            (not (at ?p ?l))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Unload Package from Truck
    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?t))
            (increase (total-cost) 1)
        )
    )

    ;; 4. Fly Airplane (Inter-city movement)
    (:action fly
        :parameters (?a - airplane ?l1 - location ?l2 - location ?c1 - city ?c2 - city)
        :precondition (and
            (at ?a ?l1)
            (is-airport ?l1)
            (is-airport ?l2)
            (loc-in-city ?l1 ?c1)
            (loc-in-city ?l2 ?c2)
            (not (= ?c1 ?c2))
        )
        :effect (and
            (not (at ?a ?l1))
            (at ?a ?l2)
            (increase (total-cost) 1)
        )
    )
    
    ;; 5. Load Package onto Airplane (Requires Airport)
    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (in ?p ?a)
            (not (at ?p ?l))
            (increase (total-cost) 1)
        )
    )

    ;; 6. Unload Package from Airplane (Requires Airport)
    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?a))
            (increase (total-cost) 1)
        )
    )
)