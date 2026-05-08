(define (domain logistics31)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package location city truck airplane - object
    )
    (:predicates
        (at ?obj - (or package truck airplane) ?loc - location)
        (in ?pkg - package ?veh - (or truck airplane))
        (in_city ?loc - location ?city - city)
        (is_airport ?loc - location)
        (truck_owner ?truck - truck ?city - city)
    )

    (:action load_truck
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

    (:action unload_truck
        :parameters (?pkg - package ?truck - truck ?loc - location)
        :precondition (and
            (in ?pkg ?truck)
            (at ?truck ?loc)
        )
        :effect (and
            (at ?pkg ?loc)
            (not (in ?pkg ?truck))
        )
    )

    (:action load_airplane
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

    (:action unload_airplane
        :parameters (?pkg - package ?airplane - airplane ?loc - location)
        :precondition (and
            (in ?pkg ?airplane)
            (at ?airplane ?loc)
        )
        :effect (and
            (at ?pkg ?loc)
            (not (in ?pkg ?airplane))
        )
    )

    (:action drive_truck
        :parameters (?truck - truck ?from_loc - location ?to_loc - location ?city - city)
        :precondition (and
            (at ?truck ?from_loc)
            (in_city ?from_loc ?city)
            (in_city ?to_loc ?city)
            (truck_owner ?truck ?city)
            (not (= ?from_loc ?to_loc))
        )
        :effect (and
            (not (at ?truck ?from_loc))
            (at ?truck ?to_loc)
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
            (not (= ?from_city ?to_city))
        )
        :effect (and
            (not (at ?airplane ?from_loc))
            (at ?airplane ?to_loc)
        )
    )
)