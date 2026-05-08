(define (domain logistics45)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        object
        city - object
        location - object
        package - object
        vehicle - object
        truck - vehicle
        airplane - vehicle
    )
    (:predicates
        (at ?obj - object ?l - location)
        (in ?p - package ?v - vehicle)
        (is_airport ?l - location)
        (in_city ?l - location ?c - city)
    )
    (:functions (total-cost))

    ;; Load a package into a truck
    (define (action load_package_truck)
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?t)
            (increase (total-cost) 1)
        )
    )

    ;; Load a package into an airplane
    (define (action load_package_airplane)
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
            (increase (total-cost) 1)
        )
    )

    ;; Unload a package from a truck
    (define (action unload_package_truck)
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (not (in ?p ?t))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; Unload a package from an airplane
    (define (action unload_package_airplane)
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; Drive a truck from one location to another within the same city
    (define (action drive_truck)
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and
            (at ?t ?l1)
            (in_city ?l1 ?c)
            (in_city ?l2 ?c)
            (not (= ?l1 ?l2))
        )
        :effect (and
            (not (at ?t ?l1))
            (at ?t ?l2)
            (increase (total-cost) 1)
        )
    )

    ;; Fly an airplane from one city to another city (between airports)
    (define (action fly_airplane)
        :parameters (?a - airplane ?l1 - location ?l2 - location ?c1 - city ?c2 - city)
        :precondition (and
            (at ?a ?l1)
            (is_airport ?l1)
            (is_airport ?l2)
            (in_city ?l1 ?c1)
            (in_city ?l2 ?c2)
            (not (= ?c1 ?c2))
        )
        :effect (and
            (not (at ?a ?l1))
            (at ?a ?l2)
            (increase (total-cost) 1)
        )
    )
)