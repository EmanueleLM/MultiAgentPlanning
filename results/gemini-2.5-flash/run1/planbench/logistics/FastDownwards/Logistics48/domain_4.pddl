(define (domain logistics48)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package
        truck
        airplane
        location
        city
    )

    (:predicates
        (at ?obj - (either package truck airplane) ?loc - location)
        (in ?pkg - package ?veh - (either truck airplane))
        (is_airport ?loc - location)
        (in_city ?loc - location ?cty - city)
    )

    (:action load_package_truck
        :parameters (?pkg - package ?trk - truck ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?trk ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?trk)
        )
    )

    (:action load_package_airplane
        :parameters (?pkg - package ?apn - airplane ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?apn ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?apn)
        )
    )

    (:action unload_package_truck
        :parameters (?pkg - package ?trk - truck ?loc - location)
        :precondition (and
            (in ?pkg ?trk)
            (at ?trk ?loc)
        )
        :effect (and
            (not (in ?pkg ?trk))
            (at ?pkg ?loc)
        )
    )

    (:action unload_package_airplane
        :parameters (?pkg - package ?apn - airplane ?loc - location)
        :precondition (and
            (in ?pkg ?apn)
            (at ?apn ?loc)
        )
        :effect (and
            (not (in ?pkg ?apn))
            (at ?pkg ?loc)
        )
    )

    (:action drive_truck
        :parameters (?trk - truck ?from - location ?to - location ?cty - city)
        :precondition (and
            (at ?trk ?from)
            (in_city ?from ?cty)
            (in_city ?to ?cty)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?trk ?from))
            (at ?trk ?to)
        )
    )

    (:action fly_airplane
        :parameters (?apn - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
        :precondition (and
            (at ?apn ?from)
            (is_airport ?from)
            (is_airport ?to)
            (in_city ?from ?from_city)
            (in_city ?to ?to_city)
            (not (= ?from_city ?to_city))
        )
        :effect (and
            (not (at ?apn ?from))
            (at ?apn ?to)
        )
    )
)