(define (domain logistics6)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package vehicle location city - object
        truck - vehicle
        airplane - vehicle
    )
    (:predicates
        (at ?o - object ?l - location)
        (in ?p - package ?v - vehicle)
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)
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
            (in ?p ?t)
        )
    )

    ;; Unload a package from a truck
    (:action unload-package-truck
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

    ;; Drive a truck from one location to another within the same city
    (:action drive-truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?t ?from)
            (in-city ?from ?c)
            (in-city ?to ?c)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    ;; Load a package into an airplane
    (:action load-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
        )
    )

    ;; Unload a package from an airplane
    (:action unload-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?a))
        )
    )

    ;; Fly an airplane from one airport to another airport in different cities
    (:action fly-airplane
        :parameters (?a - airplane ?from - location ?to - location ?from_c - city ?to_c - city)
        :precondition (and
            (at ?a ?from)
            (is-airport ?from)
            (is-airport ?to)
            (in-city ?from ?from_c)
            (in-city ?to ?to_c)
            (not (= ?from ?to))
            (not (= ?from_c ?to_c))
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
        )
    )
)