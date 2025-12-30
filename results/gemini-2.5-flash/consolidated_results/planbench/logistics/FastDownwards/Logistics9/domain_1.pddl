(define (domain logistics-hard)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        package
        vehicle
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)
        
        ; Location predicates
        (at-package ?p - package ?l - location)
        (at-vehicle ?v - vehicle ?l - location)

        ; Containment predicates
        (in-truck ?p - package ?t - truck)
        (in-airplane ?p - package ?a - airplane)
    )

    ; --- Truck Actions (Intra-City) ---

    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at-package ?p ?l)
            (at-vehicle ?t ?l)
        )
        :effect (and
            (in-truck ?p ?t)
            (not (at-package ?p ?l))
        )
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in-truck ?p ?t)
            (at-vehicle ?t ?l)
        )
        :effect (and
            (at-package ?p ?l)
            (not (in-truck ?p ?t))
        )
    )

    (:action drive-truck
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and
            (at-vehicle ?t ?l1)
            (in-city ?l1 ?c)
            (in-city ?l2 ?c)
            (not (= ?l1 ?l2))
        )
        :effect (and
            (at-vehicle ?t ?l2)
            (not (at-vehicle ?t ?l1))
        )
    )

    ; --- Airplane Actions (Inter-City) ---

    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at-package ?p ?l)
            (at-vehicle ?a ?l)
        )
        :effect (and
            (in-airplane ?p ?a)
            (not (at-package ?p ?l))
        )
    )

    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in-airplane ?p ?a)
            (at-vehicle ?a ?l)
        )
        :effect (and
            (at-package ?p ?l)
            (not (in-airplane ?p ?a))
        )
    )

    (:action fly-airplane
        :parameters (?a - airplane ?l1 - location ?l2 - location ?c1 - city ?c2 - city)
        :precondition (and
            (at-vehicle ?a ?l1)
            (is-airport ?l1)
            (is-airport ?l2)
            (in-city ?l1 ?c1)
            (in-city ?l2 ?c2)
            (not (= ?c1 ?c2))
        )
        :effect (and
            (at-vehicle ?a ?l2)
            (not (at-vehicle ?a ?l1))
        )
    )
)