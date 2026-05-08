(define (domain logistics40)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package
        truck
        airplane
        location
        city - object
    )
    (:predicates
        (at_package ?p - package ?l - location)
        (at_truck ?t - truck ?l - location)
        (at_airplane ?a - airplane ?l - location)
        (in_truck ?p - package ?t - truck)
        (in_airplane ?p - package ?a - airplane)
        (loc_in_city ?l - location ?c - city)
        (is_airport ?l - location)
        (truck_in_city ?t - truck ?c - city)
        (airport_in_city ?l - location ?c - city)
    )

    (:action load_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at_package ?p ?l)
            (at_truck ?t ?l)
        )
        :effect (and
            (in_truck ?p ?t)
            (not (at_package ?p ?l))
        )
    )

    (:action unload_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in_truck ?p ?t)
            (at_truck ?t ?l)
        )
        :effect (and
            (at_package ?p ?l)
            (not (in_truck ?p ?t))
        )
    )

    (:action load_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at_package ?p ?l)
            (at_airplane ?a ?l)
        )
        :effect (and
            (in_airplane ?p ?a)
            (not (at_package ?p ?l))
        )
    )

    (:action unload_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in_airplane ?p ?a)
            (at_airplane ?a ?l)
        )
        :effect (and
            (at_package ?p ?l)
            (not (in_airplane ?p ?a))
        )
    )

    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at_truck ?t ?from)
            (loc_in_city ?from ?c)
            (loc_in_city ?to ?c)
            (truck_in_city ?t ?c)
            (not (= ?from ?to))
        )
        :effect (and
            (at_truck ?t ?to)
            (not (at_truck ?t ?from))
        )
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from_airport - location ?to_airport - location ?from_city - city ?to_city - city)
        :precondition (and
            (at_airplane ?a ?from_airport)
            (is_airport ?from_airport)
            (is_airport ?to_airport)
            (airport_in_city ?from_airport ?from_city)
            (airport_in_city ?to_airport ?to_city)
            (not (= ?from_airport ?to_airport))
        )
        :effect (and
            (at_airplane ?a ?to_airport)
            (not (at_airplane ?a ?from_airport))
        )
    )
)