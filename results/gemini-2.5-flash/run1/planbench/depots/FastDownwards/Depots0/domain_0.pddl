(define (domain logistics-depot)
    (:requirements :strips :typing :adl)

    (:types
        location - object   ; Unified from 'place' and 'location'
        crate - object
        carrier - object
        truck - carrier     ; 'truck' is a specific type of 'carrier'
        hoist - object
    )

    (:predicates
        (at-hoist ?h - hoist ?l - location)           ; Hoist ?h is positioned at location ?l
        (at-crate ?c - crate ?l - location)           ; Crate ?c is on the floor at location ?l (or its general location if loaded)
        (at-carrier ?v - carrier ?l - location)       ; Carrier ?v is present at location ?l
        (hoist-empty ?h - hoist)                      ; Hoist ?h is not currently carrying any crate
        (has-crate ?h - hoist ?c - crate)             ; Hoist ?h is currently carrying crate ?c
        (loaded ?c - crate ?v - carrier)              ; Crate ?c is loaded inside carrier ?v (Unified from 'in' and 'loaded')
    )

    ;; Action: Drive a truck between locations. Implicitly moves all loaded crates.
    (:action drive
        :parameters (?t - truck ?from - location ?to - location)
        :precondition (and
                        (at-carrier ?t ?from)         ; The truck must be at the starting location (using new predicate).
                        (not (= ?from ?to))           ; The truck cannot drive to the same location.
                       )
        :effect (and
                    (not (at-carrier ?t ?from))       ; The truck is no longer at the 'from' place.
                    (at-carrier ?t ?to)               ; The truck is now at the 'to' place.

                    ; Conditional effect: All crates currently loaded in this truck also move.
                    (forall (?c - crate)
                        (when (loaded ?c ?t)          ; If a crate is loaded in this truck (using new predicate)...
                            (and
                                (not (at-crate ?c ?from)) ; ...it is no longer at the 'from' place (using new predicate)...
                                (at-crate ?c ?to)         ; ...and it is now at the 'to' place (using new predicate).
                            )
                        )
                    )
                )
    )

    ;; Action: Lift a crate from the floor using a hoist
    (:action lift
        :parameters (?h - hoist ?c - crate ?l - location)
        :precondition (and
            (at-hoist ?h ?l)
            (at-crate ?c ?l) ; Crate must be on the floor at this location to be lifted
            (hoist-empty ?h)
        )
        :effect (and
            (not (hoist-empty ?h))
            (has-crate ?h ?c)
            (not (at-crate ?c ?l))
        )
    )

    ;; Action: Drop a crate from a hoist onto the floor
    (:action drop
        :parameters (?h - hoist ?c - crate ?l - location)
        :precondition (and
            (at-hoist ?h ?l)
            (has-crate ?h ?c)
        )
        :effect (and
            (hoist-empty ?h)
            (not (has-crate ?h ?c))
            (at-crate ?c ?l)
        )
    )

    ;; Action: Load a crate from a hoist into a carrier (e.g., a truck)
    (:action load
        :parameters (?h - hoist ?c - crate ?v - carrier ?l - location)
        :precondition (and
            (at-hoist ?h ?l)
            (at-carrier ?v ?l) ; Using harmonized 'at-carrier' predicate
            (has-crate ?h ?c)
            (not (loaded ?c ?v))
        )
        :effect (and
            (hoist-empty ?h)
            (not (has-crate ?h ?c))
            (loaded ?c ?v)
        )
    )

    ;; Action: Unload a crate from a carrier onto a hoist
    (:action unload
        :parameters (?h - hoist ?c - crate ?v - carrier ?l - location)
        :precondition (and
            (at-hoist ?h ?l)
            (at-carrier ?v ?l) ; Using harmonized 'at-carrier' predicate
            (hoist-empty ?h)
            (loaded ?c ?v)
        )
        :effect (and
            (not (hoist-empty ?h))
            (has-crate ?h ?c)
            (not (loaded ?c ?v))
        )
    )
)