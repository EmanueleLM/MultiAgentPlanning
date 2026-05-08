(define (domain logistics27)
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
        (in-city ?loc - location ?c - city)
        (is-airport ?loc - location)
        (in-truck ?p - package ?t - truck)
        (in-airplane ?p - package ?a - airplane)
    )

    ;; Load a package into a truck
    (:action load-package-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in-truck ?p ?t)
        )
    )

    ;; Unload a package from a truck
    (:action unload-package-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in-truck ?p ?t)
            (at ?t ?l) ; Package is unloaded at the truck's current location
        )
        :effect (and
            (at ?p ?l)
            (not (in-truck ?p ?t))
        )
    )

    ;; Load a package into an airplane
    (:action load-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in-airplane ?p ?a)
        )
    )

    ;; Unload a package from an airplane
    (:action unload-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in-airplane ?p ?a)
            (at ?a ?l) ; Package is unloaded at the airplane's current location
        )
        :effect (and
            (at ?p ?l)
            (not (in-airplane ?p ?a))
        )
    )

    ;; Drive a truck from one location to another within the same city
    (:action drive-truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?t ?from)
            (in-city ?from ?c)
            (in-city ?to ?c)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    ;; Fly an airplane from an airport in one city to an airport in another city
    (:action fly-airplane
        :parameters (?a - airplane ?from - location ?to - location ?from_c - city ?to_c - city)
        :precondition (and
            (at ?a ?from)
            (is-airport ?from)
            (is-airport ?to)
            (in-city ?from ?from_c)
            (in-city ?to ?to_c)
            (not (= ?from_c ?to_c)) ; Ensure inter-city travel
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
        )
    )
)