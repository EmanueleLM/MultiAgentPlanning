(define (domain logistics_domain)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        vehicle
        truck - vehicle
        airplane - vehicle
        package
    )

    (:predicates
        (at ?obj - (either package vehicle) ?loc - location)
        (in ?p - package ?v - vehicle)
        (in_city ?loc - location ?city - city)
        (is_airport ?loc - location)
    )

    ;; Load a package into a truck
    (:action load_truck
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
    (:action unload_truck
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

    ;; Load a package into an airplane
    (:action load_airplane
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

    ;; Unload a package from an airplane
    (:action unload_airplane
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

    ;; Drive a truck from one location to another within the same city
    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?t ?from)
            (in_city ?from ?c)
            (in_city ?to ?c)
            (not (= ?from ?to)) ; Must move to a different location
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    ;; Fly an airplane from one airport to another airport in a different city
    (:action fly_airplane
        :parameters (?a - airplane ?from_loc - location ?to_loc - location ?from_city - city ?to_city - city)
        :precondition (and
            (at ?a ?from_loc)
            (is_airport ?from_loc)
            (is_airport ?to_loc)
            (in_city ?from_loc ?from_city)
            (in_city ?to_loc ?to_city)
            (not (= ?from_city ?to_city)) ; Must fly between different cities
        )
        :effect (and
            (not (at ?a ?from_loc))
            (at ?a ?to_loc)
        )
    )
)