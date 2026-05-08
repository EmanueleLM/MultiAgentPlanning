(define (domain logistics20)
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
        (at ?obj - (or package truck airplane) ?loc - location)
        (in ?pkg - package ?veh - vehicle)
        (in-city ?loc - location ?city - city)
        (is-airport ?loc - location)
    )

    (:action load_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (in ?p ?t)
            (not (at ?p ?l))
        )
    )

    (:action unload_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?t))
        )
    )

    (:action drive_truck
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and
            (at ?t ?l1)
            (in-city ?l1 ?c)
            (in-city ?l2 ?c)
        )
        :effect (and
            (at ?t ?l2)
            (not (at ?t ?l1))
        )
    )

    (:action load_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (in ?p ?a)
            (not (at ?p ?l))
        )
    )

    (:action unload_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?a))
        )
    )

    (:action fly_airplane
        :parameters (?a - airplane ?l1 - location ?l2 - location)
        :precondition (and
            (at ?a ?l1)
            (is-airport ?l1)
            (is-airport ?l2)
        )
        :effect (and
            (at ?a ?l2)
            (not (at ?a ?l1))
        )
    )
)