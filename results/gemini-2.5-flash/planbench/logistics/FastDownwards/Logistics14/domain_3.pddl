(define (domain logistics-domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        package
        truck
        airplane
        location
        city - object
    )
    (:predicates
        (at ?obj - object ?loc - location) ; Fixed: Changed (either ...) to object for broader compatibility
        (in-truck ?pkg - package ?trk - truck)
        (in-airplane ?pkg - package ?plane - airplane)
        (in-city ?loc - location ?city - city)
        (is-airport ?loc - location)
    )
    (:functions
        (total-cost)
    )

    ;; Restrictions: 1. Load package into truck: package and truck must be in the same location. Result: package is in truck, not at location.
    (:action load-package-truck
        :parameters (?pkg - package ?trk - truck ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?trk ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in-truck ?pkg ?trk)
            (increase (total-cost) 1)
        )
    )

    ;; Restrictions: 3. Unload package from truck: package must be in truck. Result: package is at the truck's location, not in truck.
    (:action unload-package-truck
        :parameters (?pkg - package ?trk - truck ?loc - location)
        :precondition (and
            (in-truck ?pkg ?trk)
            (at ?trk ?loc)
        )
        :effect (and
            (at ?pkg ?loc)
            (not (in-truck ?pkg ?trk))
            (increase (total-cost) 1)
        )
    )

    ;; Restrictions: 5. Drive truck: truck must be at from-location. Both locations must be in the same city. Result: truck moves to to-location.
    (:action drive-truck
        :parameters (?trk - truck ?from ?to - location ?city - city)
        :precondition (and
            (at ?trk ?from)
            (in-city ?from ?city)
            (in-city ?to ?city)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?trk ?from))
            (at ?trk ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Restrictions: 2. Load package into airplane: package and airplane must be in the same location. Result: package is in airplane, not at location.
    ;; Implied: Package transfers to/from airplane happen at airports.
    (:action load-package-airplane
        :parameters (?pkg - package ?plane - airplane ?loc - location)
        :precondition (and
            (at ?pkg ?loc)
            (at ?plane ?loc)
            (is-airport ?loc)
        )
        :effect (and
            (not (at ?pkg ?loc))
            (in-airplane ?pkg ?plane)
            (increase (total-cost) 1)
        )
    )

    ;; Restrictions: 4. Unload package from airplane: package must be in airplane. Result: package is at the airplane's location, not in airplane.
    ;; Implied: Package transfers to/from airplane happen at airports.
    (:action unload-package-airplane
        :parameters (?pkg - package ?plane - airplane ?loc - location)
        :precondition (and
            (in-airplane ?pkg ?plane)
            (at ?plane ?loc)
            (is-airport ?loc)
        )
        :effect (and
            (at ?pkg ?loc)
            (not (in-airplane ?pkg ?plane))
            (increase (total-cost) 1)
        )
    )

    ;; Restrictions: 6. Fly airplane: from-location and to-location must be airports. Airplane must be at from-location. Result: airplane moves to to-location.
    (:action fly-airplane
        :parameters (?plane - airplane ?from ?to - location)
        :precondition (and
            (at ?plane ?from)
            (is-airport ?from)
            (is-airport ?to)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?plane ?from))
            (at ?plane ?to)
            (increase (total-cost) 1)
        )
    )
)