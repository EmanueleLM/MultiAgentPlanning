(define (domain logistics-unified)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        airport - location ; Specialized type for locations known to be airports
        package
        vehicle
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?o - (either package vehicle) ?l - location)
        (in-truck ?p - package ?t - truck)
        (in-airplane ?p - package ?a - airplane)
        (in-city ?l - location ?c - city)
    )

    ;; --- TRUCK ACTIONS ---

    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (in-truck ?p ?t)
            (not (at ?p ?l))
        )
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in-truck ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in-truck ?p ?t))
        )
    )

    (:action drive-truck
        :parameters (?t - truck ?l-from - location ?l-to - location ?c - city)
        :precondition (and
            (at ?t ?l-from)
            (in-city ?l-from ?c)
            (in-city ?l-to ?c)
            (not (= ?l-from ?l-to))
        )
        :effect (and
            (at ?t ?l-to)
            (not (at ?t ?l-from))
        )
    )

    ;; --- AIRPLANE ACTIONS ---

    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - airport) ; Uses airport type restriction
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (in-airplane ?p ?a)
            (not (at ?p ?l))
        )
    )

    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - airport) ; Uses airport type restriction
        :precondition (and
            (in-airplane ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in-airplane ?p ?a))
        )
    )

    (:action fly-airplane
        :parameters (?a - airplane ?l-from - airport ?l-to - airport ?c-from - city ?c-to - city) ; Uses airport type restrictions
        :precondition (and
            (at ?a ?l-from)
            (in-city ?l-from ?c-from)
            (in-city ?l-to ?c-to)
            (not (= ?c-from ?c-to))
        )
        :effect (and
            (at ?a ?l-to)
            (not (at ?a ?l-from))
        )
    )
)