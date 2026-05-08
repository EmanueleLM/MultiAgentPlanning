(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        item ; Anything that can be 'at' a location
        package - item
        vehicle - item ; Anything that can transport packages and be 'at' a location
        truck - vehicle
        airplane - vehicle
        location
        city
    )
    (:predicates
        (at ?obj - item ?loc - location)
        (loaded ?pkg - package ?veh - vehicle) ; Packages are loaded into vehicles
        (in-city ?loc - location ?c - city)
        (connected ?loc1 - location ?loc2 - location)
        (is-airport ?loc - location)
    )
    (:functions
        (total-cost)
    )

    ;; Action: Drive Truck
    (:action drive-truck
        :parameters (?truck - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?truck ?from)
            (connected ?from ?to)
            (in-city ?from ?c)
            (in-city ?to ?c)
        )
        :effect (and
            (not (at ?truck ?from))
            (at ?truck ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Load Package onto Truck
    (:action load-truck
        :parameters (?pkg - package ?truck - truck ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?truck ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (loaded ?pkg ?truck)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Unload Package from Truck
    (:action unload-truck
        :parameters (?pkg - package ?truck - truck ?loc - location)
        :precondition (and
            (loaded ?pkg ?truck)
            (at ?truck ?loc)
        )
        :effect (and
            (not (loaded ?pkg ?truck))
            (at ?pkg ?loc)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Fly Airplane
    (:action fly-airplane
        :parameters (?airplane - airplane ?from - location ?to - location ?from_c - city ?to_c - city)
        :precondition (and
            (at ?airplane ?from)
            (is-airport ?from)
            (is-airport ?to)
            (in-city ?from ?from_c)
            (in-city ?to ?to_c)
            (not (= ?from_c ?to_c)) ; Inter-city flight
        )
        :effect (and
            (not (at ?airplane ?from))
            (at ?airplane ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Load Package onto Airplane
    (:action load-airplane
        :parameters (?pkg - package ?airplane - airplane ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?airplane ?loc)
            (is-airport ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (loaded ?pkg ?airplane)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Unload Package from Airplane
    (:action unload-airplane
        :parameters (?pkg - package ?airplane - airplane ?loc - location)
        :precondition (and
            (loaded ?pkg ?airplane)
            (at ?airplane ?loc)
            (is-airport ?loc)
        )
        :effect (and
            (not (loaded ?pkg ?airplane))
            (at ?pkg ?loc)
            (increase (total-cost) 1)
        )
    )
)