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
        (at ?obj - (either package truck airplane) ?loc - location)
        (in ?p - package ?v - (either truck airplane))
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
            (at ?t ?l) ; Package is unloaded at the truck's current location
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
            (at ?a ?l) ; Package is unloaded at the airplane's current location
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
            (not (= ?from ?to)) ; Prevent no-op move
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from - location ?to - location) ; Removed city parameters as they can be derived from locations
        :precondition (and
            (at ?a ?from)
            (is_airport ?from)
            (is_airport ?to)
            (exists (?from_c - city ?to_c - city) (and
                (in_city ?from ?from_c)
                (in_city ?to ?to_c)
                (not (= ?from_c ?to_c)) ; Must fly between different cities
            ))
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
        )
    )
)