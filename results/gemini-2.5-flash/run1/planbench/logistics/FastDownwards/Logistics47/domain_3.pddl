(define (domain logistics47)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package truck airplane location city
    )
    (:predicates
        (at_package ?p - package ?l - location)
        (at_truck ?t - truck ?l - location)
        (at_airplane ?a - airplane ?l - location)
        (in_truck ?p - package ?t - truck)
        (in_airplane ?p - package ?a - airplane)
        (is_airport ?l - location)
        (loc_in_city ?l - location ?c - city)
    )

    (:action load_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at_package ?p ?l)
            (at_truck ?t ?l)
        )
        :effect (and
            (not (at_package ?p ?l))
            (in_truck ?p ?t)
        )
    )

    (:action load_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at_package ?p ?l)
            (at_airplane ?a ?l)
        )
        :effect (and
            (not (at_package ?p ?l))
            (in_airplane ?p ?a)
        )
    )

    (:action unload_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in_truck ?p ?t)
            (at_truck ?t ?l)
        )
        :effect (and
            (not (in_truck ?p ?t))
            (at_package ?p ?l)
        )
    )

    (:action unload_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in_airplane ?p ?a)
            (at_airplane ?a ?l)
        )
        :effect (and
            (not (in_airplane ?p ?a))
            (at_package ?p ?l)
        )
    )

    (:action drive_truck
        :parameters (?t - truck ?l_from - location ?l_to - location ?c - city)
        :precondition (and
            (at_truck ?t ?l_from)
            (loc_in_city ?l_from ?c)
            (loc_in_city ?l_to ?c)
            (not (= ?l_from ?l_to))
        )
        :effect (and
            (not (at_truck ?t ?l_from))
            (at_truck ?t ?l_to)
        )
    )

    (:action fly_airplane
        :parameters (?a - airplane ?l_from - location ?l_to - location ?c_from - city ?c_to - city)
        :precondition (and
            (at_airplane ?a ?l_from)
            (is_airport ?l_from)
            (is_airport ?l_to)
            (loc_in_city ?l_from ?c_from)
            (loc_in_city ?l_to ?c_to)
            (not (= ?l_from ?l_to))
            (not (= ?c_from ?c_to))
        )
        :effect (and
            (not (at_airplane ?a ?l_from))
            (at_airplane ?a ?l_to)
        )
    )
)