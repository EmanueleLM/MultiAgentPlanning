(define (domain logistics2)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package
        vehicle
            truck - vehicle
            airplane - vehicle
        city
        location
            airport_location - location
    )

    (:predicates
        (at ?obj - (or package truck airplane) ?loc - location)
        (in ?p - package ?v - vehicle)
        (in-city ?loc - location ?c - city)
    )

    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?t)
        )
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (not (in ?p ?t))
            (at ?p ?l)
        )
    )

    (:action drive-truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?t ?from)
            (in-city ?from ?c)
            (in-city ?to ?c)
            (not (= ?from ?to)) ; Truck must move to a different location
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - airport_location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
        )
    )

    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - airport_location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
        )
    )

    (:action fly-airplane
        :parameters (?a - airplane ?from - airport_location ?to - airport_location)
        :precondition (and
            (at ?a ?from)
            (not (= ?from ?to)) ; Airplane must fly to a different airport
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
        )
    )
)