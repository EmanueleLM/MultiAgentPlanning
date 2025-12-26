(define (domain ground-air-logistics)
    (:requirements :strips :typing)
    (:types
        city
        location
        movable
        package - movable
        vehicle - movable
        truck airplane - vehicle
    )

    (:predicates
        (at ?o - movable ?l - location)
        (in ?p - package ?v - vehicle)
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)
        (connected ?l1 - location ?l2 - location)
    )

    ;; --- Ground Actions (Trucks - Intra-City) ---

    (:action drive-truck
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and
            (at ?t ?l1)
            (in-city ?l1 ?c)
            (in-city ?l2 ?c)
            (connected ?l1 ?l2)
            (not (= ?l1 ?l2))
        )
        :effect (and
            (not (at ?t ?l1))
            (at ?t ?l2)
        )
    )

    (:action load-package-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?t)
        )
    )

    (:action unload-package-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (not (in ?p ?t))
            (at ?p ?l)
        )
    )

    ;; --- Air Actions (Airplanes - Inter-City) ---

    (:action fly-airplane
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
        )
    )

    (:action load-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
        )
    )

    (:action unload-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
        )
    )