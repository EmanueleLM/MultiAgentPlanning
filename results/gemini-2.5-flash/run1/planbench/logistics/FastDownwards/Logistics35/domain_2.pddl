(define (domain logistics35)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package
        city
        location
        truck
        airplane
    )
    (:predicates
        (at ?obj - (or package truck airplane) ?loc - location)
        (in ?p - package ?v - (or truck airplane))
        (in_city ?loc - location ?c - city)
        (is_airport ?loc - location)
    )

    (:action load_package_truck
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

    (:action unload_package_truck
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

    (:action load_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
        )
    )

    (:action unload_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
        )
    )

    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?t ?from)
            (in_city ?from ?c)
            (in_city ?to ?c)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from - location ?to - location ?from_c - city ?to_c - city)
        :precondition (and
            (at ?a ?from)
            (is_airport ?from)
            (is_airport ?to)
            (in_city ?from ?from_c)
            (in_city ?to ?to_c)
            (not (= ?from_c ?to_c))
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
        )
    )
)