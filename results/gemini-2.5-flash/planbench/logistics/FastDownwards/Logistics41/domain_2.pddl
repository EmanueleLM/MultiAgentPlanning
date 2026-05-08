(define (domain logistics41)
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
        (at ?obj - (either package vehicle) ?loc - location)
        (in-truck ?p - package ?t - truck)
        (in-airplane ?p - package ?a - airplane)
        (in-city ?loc - location ?c - city)
        (is-airport ?loc - location)
    )

    (:action load_truck
        :parameters (?p - package ?t - truck ?l - location)
        :preconditions (and (at ?p ?l)
                            (at ?t ?l))
        :effects (and (not (at ?p ?l))
                      (in-truck ?p ?t)))

    (:action unload_truck
        :parameters (?p - package ?t - truck ?l - location)
        :preconditions (and (in-truck ?p ?t)
                            (at ?t ?l))
        :effects (and (not (in-truck ?p ?t))
                      (at ?p ?l)))

    (:action load_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :preconditions (and (at ?p ?l)
                            (at ?a ?l))
        :effects (and (not (at ?p ?l))
                      (in-airplane ?p ?a)))

    (:action unload_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :preconditions (and (in-airplane ?p ?a)
                            (at ?a ?l))
        :effects (and (not (in-airplane ?p ?a))
                      (at ?p ?l)))

    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :preconditions (and (at ?t ?from)
                            (in-city ?from ?c)
                            (in-city ?to ?c))
        :effects (and (not (at ?t ?from))
                      (at ?t ?to)))

    (:action fly_airplane
        :parameters (?a - airplane ?from_l - location ?to_l - location ?from_c - city ?to_c - city)
        :preconditions (and (at ?a ?from_l)
                            (is-airport ?from_l)
                            (is-airport ?to_l)
                            (in-city ?from_l ?from_c)
                            (in-city ?to_l ?to_c)
                            (not (= ?from_c ?to_c)))
        :effects (and (not (at ?a ?from_l))
                      (at ?a ?to_l)))
)