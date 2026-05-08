(define (domain logistics-23)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package vehicle - object
        truck airplane - vehicle
        location city - object
    )
    (:predicates
        (at ?obj - (package vehicle) ?loc - location)
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
            (not (in ?pkg ?trk))
            (at ?pkg ?loc)
        )
    )

    (:action drive_truck
        :parameters (?trk - truck ?from - location ?to - location ?cit - city)
        :precondition (and
            (at ?trk ?from)
            (in_city ?from ?cit)
            (in_city ?to ?cit)
            (not (= ?from ?to)) ; Truck must move to a different location
        )
        :effect (and
            (not (at ?trk ?from))
            (at ?trk ?to)
        )
    )

    (:action load_package_airplane
        :parameters (?pkg - package ?air - airplane ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?air ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?air)
        )
    )

    (:action unload_package_airplane
        :parameters (?pkg - package ?air - airplane ?loc - location)
        :precondition (and
            (in ?pkg ?air)
            (at ?air ?loc)
        )
        :effect (and
            (not (in ?pkg ?air))
            (at ?pkg ?loc)
        )
    )

    (:action fly_airplane
        :parameters (?air - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
        :precondition (and
            (at ?air ?from)
            (is_airport ?from)
            (is_airport ?to)
            (in_city ?from ?from_city)
            (in_city ?to ?to_city)
            (not (= ?from_city ?to_city)) ; Airplane must fly between different cities
            (not (= ?from ?to)) ; Airplane must move to a different location
        )
        :effect (and
            (not (at ?air ?from))
            (at ?air ?to)
        )
    )
)