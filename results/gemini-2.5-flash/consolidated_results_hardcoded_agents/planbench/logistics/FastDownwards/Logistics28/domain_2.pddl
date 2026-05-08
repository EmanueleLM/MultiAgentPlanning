(define (domain logistics-transport)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        package
        vehicle
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?x - (either package truck airplane) ?l - location)
        (in ?p - package ?v - (either truck airplane))
        (in-city ?l - location ?c - city)
        (airport ?l - location)
    )

    (:action load-package-truck
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

    (:action unload-package-truck
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
        :parameters (?t - truck ?lfrom - location ?lto - location ?c - city)
        :precondition (and
            (at ?t ?lfrom)
            (in-city ?lfrom ?c)
            (in-city ?lto ?c)
        )
        :effect (and
            (not (at ?t ?lfrom))
            (at ?t ?lto)
        )
    )

    (:action load-package-airplane
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

    (:action unload-package-airplane
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

    (:action fly-airplane
        :parameters (?a - airplane ?lfrom - location ?lto - location ?cfrom - city ?cto - city)
        :precondition (and
            (at ?a ?lfrom)
            (airport ?lfrom)
            (airport ?lto)
            (in-city ?lfrom ?cfrom)
            (in-city ?lto ?cto)
            (not (= ?cfrom ?cto))
        )
        :effect (and
            (not (at ?a ?lfrom))
            (at ?a ?lto)
        )
    )
)