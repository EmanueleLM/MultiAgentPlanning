(define (domain logistics-25)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package truck airplane vehicle - object
        location city - object
    )
    (:predicates
        (at ?obj - (or package truck airplane) ?loc - location)
        (in ?pkg - package ?veh - (or truck airplane))
        (in-city ?loc - location ?c - city)
        (is-airport ?loc - location)
    )

    (:action load-package-truck
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

    (:action unload-package-truck
        :parameters (?pkg - package ?truck - truck ?loc - location)
        :precondition (and
            (in ?pkg ?truck)
            (at ?truck ?loc)
        )
        :effect (and
            (not (in ?pkg ?truck))
            (at ?pkg ?loc)
        )
    )

    (:action load-package-airplane
        :parameters (?pkg - package ?plane - airplane ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?plane ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?plane)
        )
    )

    (:action unload-package-airplane
        :parameters (?pkg - package ?plane - airplane ?loc - location)
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
        :parameters (?truck - truck ?from - location ?to - location ?city - city)
        :precondition (and
            (at ?truck ?from)
            (in-city ?from ?city)
            (in-city ?to ?city)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?truck ?from))
            (at ?truck ?to)
        )
    )

    (:action fly-airplane
        :parameters (?plane - airplane ?from - location ?to - location)
        :precondition (and
            (at ?plane ?from)
            (is-airport ?from)
            (is-airport ?to)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?plane ?from))
            (at ?plane ?to)
        )
    )
)