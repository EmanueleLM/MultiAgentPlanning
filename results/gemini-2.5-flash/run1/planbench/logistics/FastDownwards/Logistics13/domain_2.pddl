(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package
        location
        city
        truck
        airplane
    )

    (:predicates
        (at_package ?p - package ?l - location)
        (at_truck ?t - truck ?l - location)
        (at_airplane ?a - airplane ?l - location)
        (in_truck ?p - package ?t - truck)
        (in_airplane ?p - package ?a - airplane)
        (in_city ?l - location ?c - city)
        (is_airport ?l - location)
    )

    ;; Load a package into a truck
    (:action load_truck
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

    ;; Unload a package from a truck
    (:action unload_truck
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

    ;; Load a package into an airplane
    (:action load_airplane
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

    ;; Unload a package from an airplane
    (:action unload_airplane
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

    ;; Drive a truck from one location to another within the same city
    (:action drive_truck
        :parameters (?t - truck ?from_l - location ?to_l - location ?c - city)
        :precondition (and
            (at_truck ?t ?from_l)
            (in_city ?from_l ?c)
            (in_city ?to_l ?c)
            (not (= ?from_l ?to_l))
        )
        :effect (and
            (not (at_truck ?t ?from_l))
            (at_truck ?t ?to_l)
        )
    )

    ;; Fly an airplane from one airport to another airport
    (:action fly_airplane
        :parameters (?a - airplane ?from_l - location ?to_l - location)
        :precondition (and
            (at_airplane ?a ?from_l)
            (is_airport ?from_l)
            (is_airport ?to_l)
            (not (= ?from_l ?to_l))
        )
        :effect (and
            (not (at_airplane ?a ?from_l))
            (at_airplane ?a ?to_l)
        )
    )
)