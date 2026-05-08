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
        (package-at ?pkg - package ?loc - location)
        (truck-at ?truck - truck ?loc - location)
        (airplane-at ?airplane - airplane ?loc - location)
        (in-vehicle ?pkg - package ?veh - vehicle)
        (is-airport ?loc - location)
        (in-city ?loc - location ?c - city)
    )

    (:action load-truck
        :parameters (?pkg - package ?truck - truck ?loc - location)
        :precondition (and
            (package-at ?pkg ?loc)
            (truck-at ?truck ?loc)
        )
        :effect (and
            (not (package-at ?pkg ?loc))
            (in-vehicle ?pkg ?truck)
        )
    )

    (:action unload-truck
        :parameters (?pkg - package ?truck - truck ?loc - location)
        :precondition (and
            (in-vehicle ?pkg ?truck)
            (truck-at ?truck ?loc)
        )
        :effect (and
            (not (in-vehicle ?pkg ?truck))
            (package-at ?pkg ?loc)
        )
    )

    (:action load-airplane
        :parameters (?pkg - package ?airplane - airplane ?loc - location)
        :precondition (and
            (package-at ?pkg ?loc)
            (airplane-at ?airplane ?loc)
        )
        :effect (and
            (not (package-at ?pkg ?loc))
            (in-vehicle ?pkg ?airplane)
        )
    )

    (:action unload-airplane
        :parameters (?pkg - package ?airplane - airplane ?loc - location)
        :precondition (and
            (in-vehicle ?pkg ?airplane)
            (airplane-at ?airplane ?loc)
        )
        :effect (and
            (not (in-vehicle ?pkg ?airplane))
            (package-at ?pkg ?loc)
        )
    )

    (:action drive-truck
        :parameters (?truck - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (truck-at ?truck ?from)
            (in-city ?from ?c)
            (in-city ?to ?c)
            (not (= ?from ?to)) ; Must move to a different location
        )
        :effect (and
            (not (truck-at ?truck ?from))
            (truck-at ?truck ?to)
        )
    )

    (:action fly-airplane
        :parameters (?airplane - airplane ?from - location ?to - location ?from_c - city ?to_c - city)
        :precondition (and
            (airplane-at ?airplane ?from)
            (is-airport ?from)
            (is-airport ?to)
            (in-city ?from ?from_c)
            (in-city ?to ?to_c)
            (not (= ?from_c ?to_c)) ; Must fly between different cities
        )
        :effect (and
            (not (airplane-at ?airplane ?from))
            (airplane-at ?airplane ?to)
        )
    )