(define (domain logistics29)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        package
        truck
        airplane
    )

    (:predicates
        (at ?obj - (either package truck airplane) ?loc - location)
        (in ?pkg - package ?veh - (either truck airplane))
        (loc-in-city ?loc - location ?city - city)
        (is-airport ?loc - location)
    )

    (:action load-truck
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

    (:action unload-truck
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

    (:action load-airplane
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

    (:action unload-airplane
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

    (:action drive-truck
        :parameters (?truck - truck ?from - location ?to - location ?city - city)
        :precondition (and
            (at ?truck ?from)
            (loc-in-city ?from ?city)
            (loc-in-city ?to ?city)
            (not (= ?from ?to)) ; Must move to a different location
        )
        :effect (and
            (not (at ?truck ?from))
            (at ?truck ?to)
        )
    )

    (:action fly-airplane
        :parameters (?airplane - airplane ?from_airport - location ?to_airport - location ?from_city - city ?to_city - city)
        :precondition (and
            (at ?airplane ?from_airport)
            (is-airport ?from_airport)
            (is-airport ?to_airport)
            (loc-in-city ?from_airport ?from_city)
            (loc-in-city ?to_airport ?to_city)
            (not (= ?from_city ?to_city))    ; Must fly between different cities
            (not (= ?from_airport ?to_airport)) ; Airplanes always move between two *different* airport locations
        )
        :effect (and
            (not (at ?airplane ?from_airport))
            (at ?airplane ?to_airport)
        )
    )
)