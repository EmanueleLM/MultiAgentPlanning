(define (domain logistics33)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        truck
        airplane
        package
    )
    (:predicates
        (is_airport ?l - location)
        (at_location ?o - (or package truck airplane) ?l - location)
        (in_city ?l - location ?c - city)
        (in_truck ?p - package ?t - truck)
        (in_airplane ?p - package ?a - airplane)
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
            (not (in_truck ?p ?t))
            (at_location ?p ?l)
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
            (not (in_airplane ?p ?a))
            (at_location ?p ?l)
        )
    )

    (:action drive_truck
        :parameters (?t - truck ?from_l - location ?to_l - location ?c - city)
        :precondition (and
            (at_location ?t ?from_l)
            (in_city ?from_l ?c)
            (in_city ?to_l ?c)
            (not (= ?from_l ?to_l)) ; Truck must move between distinct locations
        )
        :effect (and
            (not (at_location ?t ?from_l))
            (at_location ?t ?to_l)
        )
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from_l - location ?to_l - location ?from_c - city ?to_c - city)
        :precondition (and
            (at_location ?a ?from_l)
            (is_airport ?from_l)
            (is_airport ?to_l)
            (in_city ?from_l ?from_c)
            (in_city ?to_l ?to_c)
            (not (= ?from_l ?to_l)) ; Airplane must fly between distinct airports
            (not (= ?from_c ?to_c)) ; Airplane must fly between distinct cities
        )
        :effect (and
            (not (at_location ?a ?from_l))
            (at_location ?a ?to_l)
        )
    )
)