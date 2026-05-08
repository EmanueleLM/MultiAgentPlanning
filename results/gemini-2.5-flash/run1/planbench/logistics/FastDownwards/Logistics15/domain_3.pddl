(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        airport - location
        package
        vehicle
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?obj - (either package vehicle) ?loc - location)
        (in ?pkg - package ?veh - vehicle)
        (in_city ?loc - location ?city - city)
    )

    (:action load_truck
        :parameters (?pkg - package ?tru - truck ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?tru ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?tru)
        )
    )

    (:action unload_truck
        :parameters (?pkg - package ?tru - truck ?loc - location)
        :precondition (and
            (in ?pkg ?tru)
            (at ?tru ?loc)
        )
        :effect (and
            (not (in ?pkg ?tru))
            (at ?pkg ?loc)
        )
    )

    (:action load_airplane
        :parameters (?pkg - package ?air - airplane ?loc - airport)
        :precondition (and
            (at ?pkg ?loc)
            (at ?air ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?air)
        )
    )

    (:action unload_airplane
        :parameters (?pkg - package ?air - airplane ?loc - airport)
        :precondition (and
            (in ?pkg ?air)
            (at ?air ?loc)
        )
        :effect (and
            (not (in ?pkg ?air))
            (at ?pkg ?loc)
        )
    )

    (:action drive_truck
        :parameters (?tru - truck ?from - location ?to - location ?city - city)
        :precondition (and
            (at ?tru ?from)
            (in_city ?from ?city)
            (in_city ?to ?city)
        )
        :effect (and
            (not (at ?tru ?from))
            (at ?tru ?to)
        )
    )

    (:action fly_airplane
        :parameters (?air - airplane ?from - airport ?to - airport)
        :precondition (and
            (at ?air ?from)
        )
        :effect (and
            (not (at ?air ?from))
            (at ?air ?to)
        )
    )
)