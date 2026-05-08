(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        location
        package
        truck
        airplane
    )
    (:predicates
        (at ?obj - (package truck airplane) ?loc - location)
        (in ?pkg - package ?veh - (truck airplane))
        (is-airport ?loc - location)
        (in-city ?loc - location ?city - city)
    )
    (:functions (total-cost))

    ;; Load a package into a truck
    (:action load-truck
        :parameters (?pkg - package ?trk - truck ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?trk ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?trk)
            (increase (total-cost) 1)
        )
    )

    ;; Load a package into an airplane
    (:action load-airplane
        :parameters (?pkg - package ?air - airplane ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?air ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in ?pkg ?air)
            (increase (total-cost) 1)
        )
    )

    ;; Unload a package from a truck
    (:action unload-truck
        :parameters (?pkg - package ?trk - truck ?loc - location)
        :precondition (and
            (in ?pkg ?trk)
            (at ?trk ?loc)
        )
        :effect (and
            (not (in ?pkg ?trk))
            (at ?pkg ?loc)
            (increase (total-cost) 1)
        )
    )

    ;; Unload a package from an airplane
    (:action unload-airplane
        :parameters (?pkg - package ?air - airplane ?loc - location)
        :precondition (and
            (in ?pkg ?air)
            (at ?air ?loc)
        )
        :effect (and
            (not (in ?pkg ?air))
            (at ?pkg ?loc)
            (increase (total-cost) 1)
        )
    )

    ;; Drive a truck from one location to another within the same city
    (:action drive-truck
        :parameters (?trk - truck ?from - location ?to - location ?city - city)
        :precondition (and
            (at ?trk ?from)
            (in-city ?from ?city)
            (in-city ?to ?city)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?trk ?from))
            (at ?trk ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Fly an airplane from one airport to another airport (implicitly between cities)
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
            (increase (total-cost) 1)
        )
    )
)