(define (domain logistics2)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        object ; common supertype for all movable entities
        package - object
        vehicle - object
        truck - vehicle
        airplane - vehicle
        location ; base type for all locations
        airport_loc - location ; subtype for locations that are airports
        city
    )
    (:predicates
        (at ?obj - object ?loc - location) ; uses 'object' supertype and generic 'location'
        (in ?pkg - package ?veh - vehicle)
        (loc-in-city ?loc - location ?city - city)
        ; (is-airport ?loc - location) is removed, as airport_loc type now signifies this
    )

    (:action load-truck
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

    (:action unload-truck
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

    (:action load-airplane
        :parameters (?pkg - package ?plane - airplane ?loc - airport_loc) ; Only at airport_loc
        :precondition (and
            (at ?pkg ?loc)
            (at ?plane ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?plane)
        )
    )

    (:action unload-airplane
        :parameters (?pkg - package ?plane - airplane ?loc - airport_loc) ; Only at airport_loc
        :precondition (and
            (in ?pkg ?plane)
            (at ?plane ?loc)
        )
        :effect (and
            (not (in ?pkg ?plane))
            (at ?pkg ?loc)
        )
    )

    (:action drive-truck
        :parameters (?trk - truck ?from - location ?to - location ?city - city)
        :precondition (and
            (at ?trk ?from)
            (loc-in-city ?from ?city)
            (loc-in-city ?to ?city)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?trk ?from))
            (at ?trk ?to)
        )
    )

    (:action fly-airplane
        :parameters (?plane - airplane ?from - airport_loc ?to - airport_loc) ; From and to must be airport_loc
        :precondition (and
            (at ?plane ?from)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?plane ?from))
            (at ?plane ?to)
        )
    )
)