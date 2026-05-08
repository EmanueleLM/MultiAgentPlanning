(define (domain logistics2)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        object ; common supertype for all movable entities
        package - object
        vehicle - object
        truck - vehicle
        airplane - vehicle
        location
        city
    )
    (:predicates
        (at ?obj - object ?loc - location)
        (in ?pkg - package ?veh - vehicle)
        (loc-in-city ?loc - location ?city - city)
        (is-airport ?loc - location) ; Re-introduced predicate to mark airport locations
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
        :parameters (?pkg - package ?plane - airplane ?loc - location) ; Parameter type changed to generic location
        :precondition (and
            (at ?pkg ?loc)
            (at ?plane ?loc)
            (is-airport ?loc) ; Added precondition to enforce airport location
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?plane)
        )
    )

    (:action unload-airplane
        :parameters (?pkg - package ?plane - airplane ?loc - location) ; Parameter type changed to generic location
        :precondition (and
            (in ?pkg ?plane)
            (at ?plane ?loc)
            (is-airport ?loc) ; Added precondition to enforce airport location
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
        :parameters (?plane - airplane ?from - location ?to - location) ; Parameters type changed to generic location
        :precondition (and
            (at ?plane ?from)
            (is-airport ?from) ; Added precondition for from-location being an airport
            (is-airport ?to)   ; Added precondition for to-location being an airport
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?plane ?from))
            (at ?plane ?to)
        )
    )