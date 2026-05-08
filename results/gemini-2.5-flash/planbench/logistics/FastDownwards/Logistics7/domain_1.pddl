(define (domain logistics7)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package truck airplane - object
        location city - object
    )

    (:predicates
        (at ?obj - (or package truck airplane) ?loc - location)
        (in ?pkg - package ?veh - (or truck airplane))
        (in-city ?loc - location ?c - city)
        (is-airport ?loc - location)
    )

    (:action load-package-truck
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

    (:action unload-package-truck
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

    (:action load-package-airplane
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

    (:action unload-package-airplane
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

    (:action drive-truck
        :parameters (?tru - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?tru ?from)
            (in-city ?from ?c)
            (in-city ?to ?c)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?tru ?from))
            (at ?tru ?to)
        )
    )

    (:action fly-airplane
        :parameters (?air - airplane ?from - location ?to - location)
        :precondition (and
            (at ?air ?from)
            (is-airport ?from)
            (is-airport ?to)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?air ?from))
            (at ?air ?to)
        )
    )
)