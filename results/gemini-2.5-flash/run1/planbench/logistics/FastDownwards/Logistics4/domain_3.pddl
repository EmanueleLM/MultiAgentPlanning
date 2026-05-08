(define (domain logistics)
    (:requirements :strips :typing)
    (:types
        package
        location
        city
        truck
        airplane
    )
    (:predicates
        (at_package ?p - package ?l - location)
        (at_truck ?t - truck ?l - location)
        (at_airplane ?a - airplane ?l - location)
        (in_truck ?p - package ?t - truck)
        (in_airplane ?p - package ?a - airplane)
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)
    )

    (:action load_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at_package ?p ?l)
            (at_truck ?t ?l)
        )
        :effect (and
            (not (at_package ?p ?l))
            (in_truck ?p ?t)
        )
    )

    (:action unload_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in_truck ?p ?t)
            (at_truck ?t ?l)
        )
        :effect (and
            (not (in_truck ?p ?t))
            (at_package ?p ?l)
        )
    )

    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at_truck ?t ?from)
            (in-city ?from ?c)
            (in-city ?to ?c)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at_truck ?t ?from))
            (at_truck ?t ?to)
        )
    )

    (:action load_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at_package ?p ?l)
            (at_airplane ?a ?l)
        )
        :effect (and
            (not (at_package ?p ?l))
            (in_airplane ?p ?a)
        )
    )

    (:action unload_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in_airplane ?p ?a)
            (at_airplane ?a ?l)
        )
        :effect (and
            (not (in_airplane ?p ?a))
            (at_package ?p ?l)
        )
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from - location ?to - location)
        :precondition (and
            (at_airplane ?a ?from)
            (is-airport ?from)
            (is-airport ?to)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at_airplane ?a ?from))
            (at_airplane ?a ?to)
        )
    )
)