(define (domain logistics44)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        truck
        airplane
        package
    )
    (:predicates
        (at_location ?obj - (either package airplane truck) ?loc - location)
        (in_truck ?p - package ?t - truck)
        (in_airplane ?p - package ?a - airplane)
        (is_airport ?loc - location)
        (in_city ?loc - location ?c - city)
    )

    (:action load_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at_location ?p ?l)
            (at_location ?t ?l)
        )
        :effect (and
            (not (at_location ?p ?l))
            (in_truck ?p ?t)
        )
    )

    (:action unload_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in_truck ?p ?t)
            (at_location ?t ?l)
        )
        :effect (and
            (at_location ?p ?l)
            (not (in_truck ?p ?t))
        )
    )

    (:action load_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at_location ?p ?l)
            (at_location ?a ?l)
        )
        :effect (and
            (not (at_location ?p ?l))
            (in_airplane ?p ?a)
        )
    )

    (:action unload_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in_airplane ?p ?a)
            (at_location ?a ?l)
        )
        :effect (and
            (at_location ?p ?l)
            (not (in_airplane ?p ?a))
        )
    )

    (:action drive_truck
        :parameters (?t - truck ?from_loc - location ?to_loc - location ?c - city)
        :precondition (and
            (at_location ?t ?from_loc)
            (in_city ?from_loc ?c)
            (in_city ?to_loc ?c)
            (not (= ?from_loc ?to_loc))
        )
        :effect (and
            (not (at_location ?t ?from_loc))
            (at_location ?t ?to_loc)
        )
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from_loc - location ?to_loc - location ?from_city - city ?to_city - city)
        :precondition (and
            (at_location ?a ?from_loc)
            (is_airport ?from_loc)
            (is_airport ?to_loc)
            (in_city ?from_loc ?from_city)
            (in_city ?to_loc ?to_city)
            (not (= ?from_city ?to_city))
        )
        :effect (and
            (not (at_location ?a ?from_loc))
            (at_location ?a ?to_loc)
        )
    )
)