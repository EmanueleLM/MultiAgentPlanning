(define (domain logistics41)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package
        truck - vehicle
        airplane - vehicle
        vehicle
        location
        city
    )
    (:predicates
        (at ?obj - (either package vehicle) ?loc - location)
        (in ?pkg - package ?veh - vehicle)
        (in_city ?loc - location ?city - city)
        (is_airport ?loc - location)
    )

    (:action load_package_truck
        :parameters (?pkg - package ?truck - truck ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?truck ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?truck)
        )
    )

    (:action unload_package_truck
        :parameters (?pkg - package ?truck - truck ?loc - location)
        :precondition (and
            (in ?pkg ?truck)
            (at ?truck ?loc)
        )
        :effect (and
            (not (in ?pkg ?truck))
            (at ?pkg ?loc)
        )
    )

    (:action load_package_airplane
        :parameters (?pkg - package ?airplane - airplane ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?airplane ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?airplane)
        )
    )

    (:action unload_package_airplane
        :parameters (?pkg - package ?airplane - airplane ?loc - location)
        :precondition (and
            (in ?pkg ?airplane)
            (at ?airplane ?loc)
        )
        :effect (and
            (not (in ?pkg ?airplane))
            (at ?pkg ?loc)
        )
    )

    (:action drive_truck
        :parameters (?truck - truck ?from - location ?to - location ?city - city)
        :precondition (and
            (at ?truck ?from)
            (in_city ?from ?city)
            (in_city ?to ?city)
        )
        :effect (and
            (not (at ?truck ?from))
            (at ?truck ?to)
        )
    )

    (:action fly_airplane
        :parameters (?airplane - airplane ?from_loc - location ?to_loc - location ?from_city - city ?to_city - city)
        :precondition (and
            (at ?airplane ?from_loc)
            (is_airport ?from_loc)
            (is_airport ?to_loc)
            (in_city ?from_loc ?from_city)
            (in_city ?to_loc ?to_city)
            (not (= ?from_city ?to_city)) ; Airplane flies between different cities
        )
        :effect (and
            (not (at ?airplane ?from_loc))
            (at ?airplane ?to_loc)
        )
    )
)