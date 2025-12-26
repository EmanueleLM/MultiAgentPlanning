(define (domain logistics)
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
        (in-city ?l - location ?c - city)
        (airport ?l - location)
        (at ?v - vehicle ?l - location)
        (at-pkg ?p - package ?l - location)
        (in-truck ?p - package ?t - truck)
        (in-airplane ?p - package ?a - airplane)
    )

    ;; Load a package into a truck.
    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and 
            (at-pkg ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (not (at-pkg ?p ?l))
            (in-truck ?p ?t)
        )
    )

    ;; Unload a package from a truck.
    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in-truck ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (not (in-truck ?p ?t))
            (at-pkg ?p ?l)
        )
    )

    ;; Load a package into an airplane.
    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at-pkg ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (not (at-pkg ?p ?l))
            (in-airplane ?p ?a)
        )
    )

    ;; Unload a package from an airplane.
    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in-airplane ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (not (in-airplane ?p ?a))
            (at-pkg ?p ?l)
        )
    )

    ;; Drive a truck from one location to another location within the same city.
    (:action drive-truck
        :parameters (?t - truck ?l-from - location ?l-to - location ?c - city)
        :precondition (and
            (at ?t ?l-from)
            (in-city ?l-from ?c)
            (in-city ?l-to ?c)
            (not (= ?l-from ?l-to))
        )
        :effect (and
            (not (at ?t ?l-from))
            (at ?t ?l-to)
        )
    )

    ;; Fly an airplane between two airports in different cities.
    (:action fly-airplane
        :parameters (?a - airplane ?l-from - location ?l-to - location ?c-from - city ?c-to - city)
        :precondition (and
            (at ?a ?l-from)
            (airport ?l-from)
            (airport ?l-to)
            (in-city ?l-from ?c-from)
            (in-city ?l-to ?c-to)
            (not (= ?c-from ?c-to))
        )
        :effect (and
            (not (at ?a ?l-from))
            (at ?a ?l-to)
        )
    )
)