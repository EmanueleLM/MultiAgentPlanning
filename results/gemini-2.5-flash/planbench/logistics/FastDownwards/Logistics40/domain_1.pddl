(define (domain logistics40)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package truck airplane - object
        location city - object
    )

    (:predicates
        (at_package ?p - package ?l - location)
        (at_truck ?t - truck ?l - location)
        (at_airplane ?a - airplane ?l - location)
        (in_truck ?p - package ?t - truck)
        (in_airplane ?p - package ?a - airplane)
        (is_airport ?l - location)
        (loc_in_city ?l - location ?c - city)
        (truck_home_city ?t - truck ?c - city)
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

    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at_truck ?t ?from)
            (truck_home_city ?t ?c)
            (loc_in_city ?from ?c)
            (loc_in_city ?to ?c)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at_truck ?t ?from))
            (at_truck ?t ?to)
        )
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
        :precondition (and
            (at_airplane ?a ?from)
            (is_airport ?from)
            (is_airport ?to)
            (loc_in_city ?from ?from_city)
            (loc_in_city ?to ?to_city)
            (not (= ?from_city ?to_city))
        )
        :effect (and
            (not (at_airplane ?a ?from))
            (at_airplane ?a ?to)
        )
    )
)