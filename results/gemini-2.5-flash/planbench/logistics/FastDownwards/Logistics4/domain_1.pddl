(define (domain logistics4)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        package
        vehicle
        truck airplane - vehicle
    )

    (:predicates
        (at ?obj - (or package vehicle) ?loc - location)
        (in ?pkg - package ?veh - vehicle)
        (in_city ?loc - location ?cit - city)
        (is_airport ?loc - location)
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

    (:action unload_package_truck
        :parameters (?pkg - package ?trk - truck ?loc - location)
        :precondition (and
            (in ?pkg ?trk)
            (at ?trk ?loc)
        )
        :effect (and
            (at ?pkg ?loc)
            (not (in ?pkg ?trk))
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

    (:action unload_package_airplane
        :parameters (?pkg - package ?apn - airplane ?loc - location)
        :precondition (and
            (in ?pkg ?apn)
            (at ?apn ?loc)
        )
        :effect (and
            (at ?pkg ?loc)
            (not (in ?pkg ?apn))
        )
    )

    (:action drive_truck
        :parameters (?trk - truck ?from - location ?to - location ?cit - city)
        :precondition (and
            (at ?trk ?from)
            (in_city ?from ?cit)
            (in_city ?to ?cit)
        )
        :effect (and
            (not (at ?trk ?from))
            (at ?trk ?to)
        )
    )

    (:action fly_airplane
        :parameters (?apn - airplane ?from - location ?to - location)
        :precondition (and
            (at ?apn ?from)
            (is_airport ?from)
            (is_airport ?to)
        )
        :effect (and
            (not (at ?apn ?from))
            (at ?apn ?to)
        )
    )
)