(define (domain logistics22)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        package
        truck
        airplane
    )

    (:predicates
        (in_city ?loc - location ?city - city)
        (is_airport ?loc - location)
        (at ?veh - (either truck airplane) ?loc - location)
        (at_package ?pkg - package ?loc - location)
        (in_truck ?pkg - package ?tru - truck)
        (in_airplane ?pkg - package ?air - airplane)
    )

    (:action load_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at_package ?p ?l)
            (at ?t ?l)
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
            (at ?t ?l)
        )
        :effect (and
            (not (in_truck ?p ?t))
            (at_package ?p ?l)
        )
    )

    (:action load_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at_package ?p ?l)
            (at ?a ?l)
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
            (at ?a ?l)
        )
        :effect (and
            (not (in_airplane ?p ?a))
            (at_package ?p ?l)
        )
    )

    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?t ?from)
            (in_city ?from ?c)
            (in_city ?to ?c)
            (not (= ?from ?to)) ; Truck must move to a distinct location
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from - location ?to - location ?from_c - city ?to_c - city)
        :precondition (and
            (at ?a ?from)
            (is_airport ?from)
            (is_airport ?to)
            (in_city ?from ?from_c)
            (in_city ?to ?to_c)
            (not (= ?from_c ?to_c)) ; Airplane must fly between different cities
            (not (= ?from ?to)) ; Airplane must fly between distinct airport locations
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
        )
    )
)