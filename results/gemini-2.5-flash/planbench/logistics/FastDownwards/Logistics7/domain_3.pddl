(define (domain logistics7)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package truck airplane - object
        location city - object
    )

    (:predicates
        (at-package ?pkg - package ?loc - location)
        (at-truck ?tru - truck ?loc - location)
        (at-airplane ?air - airplane ?loc - location)
        (in-truck ?pkg - package ?tru - truck) ; package is in a truck
        (in-airplane ?pkg - package ?air - airplane) ; package is in an airplane
        (in-city ?loc - location ?c - city)
        (is-airport ?loc - location)
    )

    (:action load-package-truck
        :parameters (?pkg - package ?tru - truck ?loc - location)
        :precondition (and
            (at-package ?pkg ?loc)
            (at-truck ?tru ?loc)
        )
        :effect (and
            (not (at-package ?pkg ?loc))
            (in-truck ?pkg ?tru)
        )
    )

    (:action unload-package-truck
        :parameters (?pkg - package ?tru - truck ?loc - location)
        :precondition (and
            (in-truck ?pkg ?tru)
            (at-truck ?tru ?loc)
        )
        :effect (and
            (not (in-truck ?pkg ?tru))
            (at-package ?pkg ?loc)
        )
    )

    (:action load-package-airplane
        :parameters (?pkg - package ?air - airplane ?loc - location)
        :precondition (and
            (at-package ?pkg ?loc)
            (at-airplane ?air ?loc)
        )
        :effect (and
            (not (at-package ?pkg ?loc))
            (in-airplane ?pkg ?air)
        )
    )

    (:action unload-package-airplane
        :parameters (?pkg - package ?air - airplane ?loc - location)
        :precondition (and
            (in-airplane ?pkg ?air)
            (at-airplane ?air ?loc)
        )
        :effect (and
            (not (in-airplane ?pkg ?air))
            (at-package ?pkg ?loc)
        )
    )

    (:action drive-truck
        :parameters (?tru - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at-truck ?tru ?from)
            (in-city ?from ?c)
            (in-city ?to ?c)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at-truck ?tru ?from))
            (at-truck ?tru ?to)
        )
    )

    (:action fly-airplane
        :parameters (?air - airplane ?from - location ?to - location)
        :precondition (and
            (at-airplane ?air ?from)
            (is-airport ?from)
            (is-airport ?to)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at-airplane ?air ?from))
            (at-airplane ?air ?to)
        )
    )
)