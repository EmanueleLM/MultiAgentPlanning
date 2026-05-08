```pddl
(define (domain logistics-depot-combined)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location - object     ; General place, unifying 'place' and 'location'
        vehicle - object      ; General mobile transport unit
        truck - vehicle       ; Specific type of vehicle
        item - object         ; General object to be moved
        crate - item          ; Specific type of item
        hoist - object        ; Equipment for lifting/moving items within a location
    )

    (:predicates
        ;; Predicates for item and vehicle locations
        (at ?i - item ?l - location)          ; Item ?i is physically located at location ?l (on the ground)
        (located-at ?v - vehicle ?l - location); Vehicle ?v is positioned at location ?l (e.g., a loading bay, or depot)

        ;; Predicates for connections and space
        (connected ?from ?to - location)      ; Indicates a direct road connection exists between two locations.
        (location-clear ?l - location)        ; Location ?l's ground is clear and available to receive an item
        (vehicle-has-space ?v - vehicle)      ; Vehicle ?v has available capacity to load at least one more item

        ;; Predicates for hoist and item handling
        (hoist-free ?h - hoist)               ; Hoist ?h is not currently holding any item
        (holding ?h - hoist ?i - item)        ; Hoist ?h is currently holding item ?i
        (in-vehicle ?i - item ?v - vehicle)   ; Item ?i is currently loaded inside vehicle ?v
    )

    ;; Action: Drive (Modified from Logistics Planner)
    ;; This action models a truck driving from a starting location to a destination location.
    ;; It only moves the truck, explicit load/unload actions are required for items.
    (:action drive
        :parameters (?t - truck ?from ?to - location)
        :precondition (and
            (located-at ?t ?from)         ; The truck must be present at the starting location.
            (connected ?from ?to)         ; A valid road connection must exist.
        )
        :effect (and
            (not (located-at ?t ?from))   ; The truck is no longer at the starting location.
            (located-at ?t ?to)           ; The truck is now at the destination location.
        )
    )

    ;; Action: Lift (from Depot Manager)
    ;; Lifts an item from a ground location using a hoist.
    (:action lift
        :parameters (?h - hoist ?i - item ?l - location)
        :precondition (and
            (at ?i ?l)
            (hoist-free ?h)
        )
        :effect (and
            (not (at ?i ?l))
            (not (hoist-free ?h))
            (holding ?h ?i)
            (location-clear ?l)
        )
    )

    ;; Action: Drop (from Depot Manager)
    ;; Drops an item from a hoist to a ground location.
    (:action drop
        :parameters (?h - hoist ?i - item ?l - location)
        :precondition (and
            (holding ?h ?i)
            (location-clear ?l)
        )
        :effect (and
            (not (holding ?h ?i))
            (hoist-free ?h)
            (at ?i ?l)
            (not (location-clear ?l))
        )
    )

    ;; Action: Load (from Depot Manager)
    ;; Loads an item from a hoist into a vehicle.
    (:action load
        :parameters (?h - hoist ?i - item ?v - vehicle ?l - location) ; ?l is the location where the vehicle is
        :precondition (and
            (holding ?h ?i)
            (located-at ?v ?l) ; Vehicle must be at the loading bay
            (vehicle-has-space ?v)
        )
        :effect (and
            (not (holding ?h ?i))
            (hoist-free ?h)
            (in-vehicle ?i ?v)
            (not (vehicle-has-space ?v))
        )
    )

    ;; Action: Unload (from Depot Manager)
    ;; Unloads an item from a vehicle using a hoist.
    (:action unload
        :parameters (?h - hoist ?i - item ?v - vehicle ?l - location) ; ?l is the location where the vehicle is
        :precondition (and
            (hoist-free ?h)
            (in-vehicle ?i ?v)
            (located-at ?v ?l) ; Vehicle must be at the unloading bay
        )
        :effect (and
            (not (in-vehicle ?i ?v))
            (holding ?h ?i)
            (not (hoist-free ?h))
            (vehicle-has-space ?v)
        )
    )
)
```