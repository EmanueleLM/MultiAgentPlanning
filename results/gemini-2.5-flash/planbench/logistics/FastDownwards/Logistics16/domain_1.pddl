(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        movable
        package - movable
        vehicle - movable
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?obj - movable ?loc - location)
        (in ?pkg - package ?veh - vehicle)
        (is_airport ?loc - location)
        (in_city ?loc - location ?city - city)
    )

    (:action load_package_truck
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

    (:action unload_package_truck
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

    (:action load_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
        )
    )

    (:action unload_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
        )
    )

    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?t ?from)
            (in_city ?from ?c)
            (in_city ?to ?c)
            (not (= ?from ?to)) ; Truck must move
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
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
        )
    )
)