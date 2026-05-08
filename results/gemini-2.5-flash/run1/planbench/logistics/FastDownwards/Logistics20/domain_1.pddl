(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package truck airplane - vehicle
        location city - object
    )
    (:predicates
        (at-pkg ?p - package ?l - location)
        (at-truck ?t - truck ?l - location)
        (at-airplane ?a - airplane ?l - location)
        (in-truck ?p - package ?t - truck)
        (in-airplane ?p - package ?a - airplane)
        (in-city ?l - location ?c - city)
        (airport ?l - location)
    )

    (:action load-package-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at-pkg ?p ?l)
            (at-truck ?t ?l)
        )
        :effect (and
            (in-truck ?p ?t)
            (not (at-pkg ?p ?l))
        )
    )

    (:action unload-package-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in-truck ?p ?t)
            (at-truck ?t ?l)
        )
        :effect (and
            (at-pkg ?p ?l)
            (not (in-truck ?p ?t))
        )
    )

    (:action load-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at-pkg ?p ?l)
            (at-airplane ?a ?l)
        )
        :effect (and
            (in-airplane ?p ?a)
            (not (at-pkg ?p ?l))
        )
    )

    (:action unload-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in-airplane ?p ?a)
            (at-airplane ?a ?l)
        )
        :effect (and
            (at-pkg ?p ?l)
            (not (in-airplane ?p ?a))
        )
    )

    (:action drive-truck
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and
            (at-truck ?t ?l1)
            (in-city ?l1 ?c)
            (in-city ?l2 ?c)
        )
        :effect (and
            (at-truck ?t ?l2)
            (not (at-truck ?t ?l1))
        )
    )

    (:action fly-airplane
        :parameters (?a - airplane ?l1 - location ?l2 - location ?c1 - city ?c2 - city)
        :precondition (and
            (at-airplane ?a ?l1)
            (airport ?l1)
            (airport ?l2)
            (in-city ?l1 ?c1)
            (in-city ?l2 ?c2)
            (not (= ?c1 ?c2))
        )
        :effect (and
            (at-airplane ?a ?l2)
            (not (at-airplane ?a ?l1))
        )
    )
)