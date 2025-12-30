(define (domain logistics-temporal-consistent)
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
        ; Geographic facts
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)

        ; Vehicle location
        (at ?v - vehicle ?l - location)

        ; Package location
        (at-loc ?p - package ?l - location)

        ; Containment
        (in ?p - package ?v - vehicle)
    )

    ;; -------------------- TRUCK ACTIONS (Intra-City Movement) --------------------

    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (at-loc ?p ?l) (at ?t ?l))
        :effect (and (in ?p ?t) (not (at-loc ?p ?l)))
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (in ?p ?t) (at ?t ?l))
        :effect (and (at-loc ?p ?l) (not (in ?p ?t)))
    )

    (:action drive-truck
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and (at ?t ?l1)
                           (in-city ?l1 ?c)
                           (in-city ?l2 ?c)
                           (not (= ?l1 ?l2)))
        :effect (and (at ?t ?l2) (not (at ?t ?l1)))
    )

    ;; -------------------- AIRPLANE ACTIONS (Inter-City Movement) --------------------

    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (at-loc ?p ?l) (at ?a ?l))
        :effect (and (in ?p ?a) (not (at-loc ?p ?l)))
    )

    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (in ?p ?a) (at ?a ?l))
        :effect (and (at-loc ?p ?l) (not (in ?p ?a)))
    )

    (:action fly-airplane
        :parameters (?a - airplane ?l1 - location ?l2 - location)
        :precondition (and (at ?a ?l1)
                           (is-airport ?l1)
                           (is-airport ?l2)
                           (not (= ?l1 ?l2)))
        :effect (and (at ?a ?l2) (not (at ?a ?l1)))
    )
)