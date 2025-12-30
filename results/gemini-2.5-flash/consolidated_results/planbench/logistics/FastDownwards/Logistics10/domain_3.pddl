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
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)
        (connected ?l1 - location ?l2 - location) ; Truck connections within a city
        
        (at-truck ?t - truck ?l - location)
        (at-airplane ?a - airplane ?l - location)
        (at-package ?p - package ?l - location)
        
        (in-truck ?p - package ?t - truck)
        (in-airplane ?p - package ?a - airplane)
    )
    
    (:functions
        (total-cost)
    )

    ;; 1. Truck Movement (Drive) - Intra-city
    (:action drive-truck
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and
            (at-truck ?t ?l1)
            (in-city ?l1 ?c)
            (in-city ?l2 ?c)
            (connected ?l1 ?l2)
        )
        :effect (and
            (not (at-truck ?t ?l1))
            (at-truck ?t ?l2)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Airplane Movement (Fly) - Inter-city, Airport only
    (:action fly-airplane
        :parameters (?a - airplane ?l1 - location ?l2 - location ?c1 - city ?c2 - city)
        :precondition (and
            (at-airplane ?a ?l1)
            (is-airport ?l1)
            (is-airport ?l2)
            (in-city ?l1 ?c1)
            (in-city ?l2 ?c2)
            (not (= ?c1 ?c2)) ; Must be between different cities
        )
        :effect (and
            (not (at-airplane ?a ?l1))
            (at-airplane ?a ?l2)
            (increase (total-cost) 10)
        )
    )

    ;; 3. Load Package onto Truck
    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at-package ?p ?l)
            (at-truck ?t ?l)
        )
        :effect (and
            (not (at-package ?p ?l))
            (in-truck ?p ?t)
            (increase (total-cost) 1)
        )
    )

    ;; 4. Unload Package from Truck
    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in-truck ?p ?t)
            (at-truck ?t ?l)
        )
        :effect (and
            (not (in-truck ?p ?t))
            (at-package ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; 5. Load Package onto Airplane (Requires location to be an airport where the airplane is present)
    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at-package ?p ?l)
            (at-airplane ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (not (at-package ?p ?l))
            (in-airplane ?p ?a)
            (increase (total-cost) 1)
        )
    )

    ;; 6. Unload Package from Airplane (Requires location to be an airport where the airplane is present)
    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in-airplane ?p ?a)
            (at-airplane ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (not (in-airplane ?p ?a))
            (at-package ?p ?l)
            (increase (total-cost) 1)
        )
    )
)