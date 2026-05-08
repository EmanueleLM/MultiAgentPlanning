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
        (at ?x - (package vehicle) ?l - location)
        (in ?p - package ?v - vehicle)
        (loc-in-city ?l - location ?c - city)
        (airport ?l - location)
    )

    ;; Move a package into a vehicle
    (:action load
        :parameters (?p - package ?v - vehicle ?l - location)
        :precondition (and (at ?p ?l)
                           (at ?v ?l))
        :effect (and (in ?p ?v)
                     (not (at ?p ?l)))
    )

    ;; Move a package out of a vehicle
    (:action unload
        :parameters (?p - package ?v - vehicle ?l - location)
        :precondition (and (in ?p ?v)
                           (at ?v ?l))
        :effect (and (at ?p ?l)
                     (not (in ?p ?v)))
    )

    ;; Drive a truck within the same city
    (:action drive
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and (at ?t ?l1)
                           (loc-in-city ?l1 ?c)
                           (loc-in-city ?l2 ?c))
        :effect (and (at ?t ?l2)
                     (not (at ?t ?l1)))
    )

    ;; Fly an airplane between airports
    (:action fly
        :parameters (?a - airplane ?l1 - location ?l2 - location)
        :precondition (and (at ?a ?l1)
                           (airport ?l1)
                           (airport ?l2))
        :effect (and (at ?a ?l2)
                     (not (at ?a ?l1)))
    )
)