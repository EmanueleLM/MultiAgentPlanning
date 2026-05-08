(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        package
        vehicle
        truck airplane - vehicle
    )

    (:predicates
        (at-package ?p - package ?loc - location)
        (at-vehicle ?v - vehicle ?loc - location)
        (in-truck ?p - package ?t - truck)
        (in-airplane ?p - package ?a - airplane)
        (in-city ?loc - location ?c - city)
        (is-airport ?loc - location)
    )

    ;; Action for loading a package onto a truck
    ;; Preconditions: The package and the truck must be at the same location.
    ;; Effects: The package is no longer at the location and is now in the truck.
    (:action load-package-to-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at-package ?p ?l)
            (at-vehicle ?t ?l)
        )
        :effect (and
            (not (at-package ?p ?l))
            (in-truck ?p ?t)
        )
    )

    ;; Action for unloading a package from a truck
    ;; Preconditions: The package must be in the truck, and the truck must be at a specific location.
    ;; Effects: The package is no longer in the truck and is now at the location.
    (:action unload-package-from-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in-truck ?p ?t)
            (at-vehicle ?t ?l)
        )
        :effect (and
            (not (in-truck ?p ?t))
            (at-package ?p ?l)
        )
    )

    ;; Action for a truck to drive between locations within the same city.
    ;; Preconditions: The truck must be at the starting location, and both the starting and
    ;;               destination locations must belong to the same city.
    ;; Effects: The truck moves from the starting location to the destination location.
    (:action drive-truck
        :parameters (?t - truck ?l_from - location ?l_to - location ?c - city)
        :precondition (and
            (at-vehicle ?t ?l_from)
            (in-city ?l_from ?c)
            (in-city ?l_to ?c)
        )
        :effect (and
            (not (at-vehicle ?t ?l_from))
            (at-vehicle ?t ?l_to)
        )
    )

    ;; Action to load a package onto an airplane.
    ;; Both the package and the airplane must be at the same airport location.
    (:action load-package-airplane
        :parameters (?p - package ?a - airplane ?loc - location)
        :precondition (and
            (at-package ?p ?loc)
            (at-vehicle ?a ?loc)
            (is-airport ?loc)
        )
        :effect (and
            (not (at-package ?p ?loc))
            (in-airplane ?p ?a)
        )
    )

    ;; Action to unload a package from an airplane.
    ;; The package must be loaded onto the airplane, and the airplane must be at an airport location.
    (:action unload-package-airplane
        :parameters (?p - package ?a - airplane ?loc - location)
        :precondition (and
            (in-airplane ?p ?a)
            (at-vehicle ?a ?loc)
            (is-airport ?loc)
        )
        :effect (and
            (not (in-airplane ?p ?a))
            (at-package ?p ?loc)
        )
    )

    ;; Action for an airplane to fly between two distinct airport locations.
    ;; This action specifically models inter-city transport.
    ;; Any packages loaded onto the airplane implicitly travel with it.
    (:action fly-airplane
        :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city)
        :precondition (and
            (at-vehicle ?a ?from)
            (is-airport ?from)
            (is-airport ?to)
            (in-city ?from ?c_from)
            (in-city ?to ?c_to)
            (not (= ?from ?to))    ; Must fly between different locations
            (not (= ?c_from ?c_to)) ; Must be inter-city transport
        )
        :effect (and
            (not (at-vehicle ?a ?from))
            (at-vehicle ?a ?to)
        )
    )
)