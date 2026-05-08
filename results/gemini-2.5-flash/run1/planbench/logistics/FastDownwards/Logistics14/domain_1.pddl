(define (domain logistics14)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package
        truck
        airplane
        location
        city
    )

    (:predicates
        (at ?obj - (package truck airplane) ?loc - location)
        (in ?pkg - package ?veh - (truck airplane))
        (loc_in_city ?loc - location ?city - city)
        (is_airport ?loc - location)
    )

    (:action load_package_truck
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

    (:action unload_package_truck
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

    (:action drive_truck
        :parameters (?tru - truck ?from - location ?to - location ?city - city)
        :precondition (and
            (at ?tru ?from)
            (loc_in_city ?from ?city)
            (loc_in_city ?to ?city)
            (not (= ?from ?to)) ; Truck must actually move
        )
        :effect (and
            (not (at ?tru ?from))
            (at ?tru ?to)
        )
    )

    (:action fly_airplane
        :parameters (?air - airplane ?from_loc - location ?to_loc - location ?from_city - city ?to_city - city)
        :precondition (and
            (at ?air ?from_loc)
            (is_airport ?from_loc)
            (is_airport ?to_loc)
            (loc_in_city ?from_loc ?from_city)
            (loc_in_city ?to_loc ?to_city)
            (not (= ?from_city ?to_city)) ; Airplane flies between cities
        )
        :effect (and
            (not (at ?air ?from_loc))
            (at ?air ?to_loc)
        )
    )
)