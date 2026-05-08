(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location city vehicle - object
        truck airplane - vehicle
        package - object
    )
    (:predicates
        (at ?obj - (truck airplane package) ?loc - location)
        (in_city ?loc - location ?city - city)
        (is_airport ?loc - location)
        (in ?pkg - package ?veh - (truck airplane))
    )
    (:action load-package-into-truck
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
    (:action unload-package-from-truck
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
    (:action load-package-into-airplane
        :parameters (?pkg - package ?apl - airplane ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?apl ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?apl)
        )
    )
    (:action unload-package-from-airplane
        :parameters (?pkg - package ?apl - airplane ?loc - location)
        :precondition (and
            (in ?pkg ?apl)
            (at ?apl ?loc)
        )
        :effect (and
            (not (in ?pkg ?apl))
            (at ?pkg ?loc)
        )
    )
    (:action drive-truck
        :parameters (?trk - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?trk ?from)
            (in_city ?from ?c)
            (in_city ?to ?c)
        )
        :effect (and
            (not (at ?trk ?from))
            (at ?trk ?to)
        )
    )
    (:action fly-airplane
        :parameters (?apl - airplane ?from - location ?to - location ?city_from - city ?city_to - city)
        :precondition (and
            (at ?apl ?from)
            (is_airport ?from)
            (is_airport ?to)
            (in_city ?from ?city_from)
            (in_city ?to ?city_to)
        )
        :effect (and
            (not (at ?apl ?from))
            (at ?apl ?to)
        )
    )
)