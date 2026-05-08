(define (domain logistics10)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        package
        vehicle
        truck airplane - vehicle
    )
    (:predicates
        (at-location ?obj - (either package vehicle) ?loc - location)
        (in-vehicle ?pkg - package ?veh - vehicle)
        (is-airport ?loc - location)
        (in-city ?loc - location ?c - city)
    )

    (:action load-truck
        :parameters (?pkg - package ?truck - truck ?loc - location)
        :precondition (and
            (at-location ?pkg ?loc)
            (at-location ?truck ?loc)
        )
        :effect (and
            (not (at-location ?pkg ?loc))
            (in-vehicle ?pkg ?truck)
        )
    )

    (:action unload-truck
        :parameters (?pkg - package ?truck - truck ?loc - location)
        :precondition (and
            (in-vehicle ?pkg ?truck)
            (at-location ?truck ?loc)
        )
        :effect (and
            (not (in-vehicle ?pkg ?truck))
            (at-location ?pkg ?loc)
        )
    )

    (:action load-airplane
        :parameters (?pkg - package ?airplane - airplane ?loc - location)
        :precondition (and
            (at-location ?pkg ?loc)
            (at-location ?airplane ?loc)
        )
        :effect (and
            (not (at-location ?pkg ?loc))
            (in-vehicle ?pkg ?airplane)
        )
    )

    (:action unload-airplane
        :parameters (?pkg - package ?airplane - airplane ?loc - location)
        :precondition (and
            (in-vehicle ?pkg ?airplane)
            (at-location ?airplane ?loc)
        )
        :effect (and
            (not (in-vehicle ?pkg ?airplane))
            (at-location ?pkg ?loc)
        )
    )

    (:action drive-truck
        :parameters (?truck - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at-location ?truck ?from)
            (in-city ?from ?c)
            (in-city ?to ?c)
            (not (= ?from ?to)) ; Must move to a different location
        )
        :effect (and
            (not (at-location ?truck ?from))
            (at-location ?truck ?to)
        )
    )

    (:action fly-airplane
        :parameters (?airplane - airplane ?from - location ?to - location ?from_c - city ?to_c - city)
        :precondition (and
            (at-location ?airplane ?from)
            (is-airport ?from)
            (is-airport ?to)
            (in-city ?from ?from_c)
            (in-city ?to ?to_c)
            (not (= ?from_c ?to_c)) ; Must fly between different cities
        )
        :effect (and
            (not (at-location ?airplane ?from))
            (at-location ?airplane ?to)
        )
    )
)