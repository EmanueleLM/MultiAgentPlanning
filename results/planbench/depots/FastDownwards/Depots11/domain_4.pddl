(define (domain Depots11)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        place
        surface
        hoist
        truck
        crate - surface
        pallet - surface
    )

    (:predicates
        (at ?x - (either truck hoist) ?l - place)
        (located ?s - surface ?l - place)
        (in ?c - crate ?t - truck)
        (on ?c - crate ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (available ?h - hoist)
        (clear ?s - surface)
    )
    
    (:functions
        (total-cost) - number
    )
    
    ;; Drive a truck from one place to another place.
    (:action drive
        :parameters (?t - truck ?l1 ?l2 - place)
        :precondition (and (at ?t ?l1) (not (at ?t ?l2)))
        :effect (and (at ?t ?l2)
                     (not (at ?t ?l1))
                     (increase (total-cost) 1)
                )
    )

    ;; Use a hoist to lift a crate from a surface at a place.
    (:action lift-from-surface
        :parameters (?c - crate ?s - surface ?h - hoist ?l - place)
        :precondition (and (located ?c ?l) ; Crate must be at L
                           (at ?h ?l)      ; Hoist must be at L
                           (available ?h)
                           (on ?c ?s)
                           (clear ?c)      ; Crate must be clear (on top of stack)
                      )
        :effect (and (lifting ?h ?c)
                     (not (on ?c ?s))
                     (not (available ?h))
                     (not (clear ?c))      ; Crate C is no longer clear
                     (clear ?s)            ; Surface S is now clear
                     (not (located ?c ?l)) ; Crate C is now lifted, not located at L
                     (increase (total-cost) 1)
                )
    )

    ;; Use a hoist to drop a crate to a surface at a place.
    (:action drop-onto-surface
        :parameters (?c - crate ?s - surface ?h - hoist ?l - place)
        :precondition (and (located ?s ?l) ; Surface S must be at L
                           (at ?h ?l)      ; Hoist H must be at L
                           (lifting ?h ?c) ; Hoist H must be lifting C
                           (clear ?s)      ; Surface S must be clear to receive C
                      )
        :effect (and (on ?c ?s)
                     (located ?c ?l)       ; Crate C is now resting at L
                     (available ?h)
                     (clear ?c)            ; Crate C is now clear (on top)
                     (not (lifting ?h ?c))
                     (not (clear ?s))      ; Surface S is no longer clear
                     (increase (total-cost) 1)
                )
    )
    
    ;; Use a hoist to load a crate into a truck at a place.
    (:action load
        :parameters (?c - crate ?t - truck ?h - hoist ?l - place)
        :precondition (and (at ?t ?l)
                           (at ?h ?l)
                           (lifting ?h ?c)
                      )
        :effect (and (in ?c ?t)
                     (available ?h)
                     (not (lifting ?h ?c))
                     ; Crate was already (not (located ?c ?l)) and (not (clear ?c)) from the lift operation.
                     (increase (total-cost) 1)
                )
    )

    ;; Use a hoist to unload a crate from a truck at a place.
    (:action unload
        :parameters (?c - crate ?t - truck ?h - hoist ?l - place)
        :precondition (and (at ?t ?l)
                           (at ?h ?l)
                           (available ?h)
                           (in ?c ?t)
                      )
        :effect (and (lifting ?h ?c)
                     (not (in ?c ?t))
                     (not (available ?h))
                     ; Crate is now (not (located ?c ?l)) and (not (clear ?c)) implicitly while lifted.
                     (increase (total-cost) 1)
                )
    )
)