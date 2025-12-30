(define (domain unified_logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        locatable
        truck hoist - locatable
        surface
        pallet - surface locatable
        crate - surface
    )

    (:predicates
        ;; Location and Movement
        (road ?from - place ?to - place)
        (at ?o - locatable ?p - place)   ; Location for Trucks, Hoists, and Pallets
        (is-at ?s - crate ?p - place)    ; Location for grounded Crates (part of a stack)

        ;; Stacking and Hoisting
        (on ?c - crate ?s - surface)     ; Crate on Surface (Pallet or Crate)
        (clear ?s - surface)             ; Nothing resting on Surface
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)       ; Crate inside Truck
    )

    ;; 1. Drive Action: Truck movement
    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
          (at ?t ?from)
          (road ?from ?to)
        )
        :effect (and
          (not (at ?t ?from))
          (at ?t ?to)
        )
    )

    ;; 2a. Lift Action: Lifts a crate from a Pallet (Base surface)
    (:action lift_from_pallet
        :parameters (?c - crate ?p - pallet ?h - hoist ?l - place)
        :precondition (and (available ?h) (at ?h ?l)
                           (on ?c ?p) (clear ?c)
                           (at ?p ?l)         ; Pallet location
                           (is-at ?c ?l)      ; Crate location tracking
                      )
        :effect (and (not (on ?c ?p)) (not (available ?h))
                     (lifting ?h ?c) (clear ?p)
                     (not (is-at ?c ?l))
                )
    )
    
    ;; 2b. Lift Action: Lifts a crate from another Crate (Mid-stack surface)
    (:action lift_from_crate
        :parameters (?c - crate ?s - crate ?h - hoist ?l - place)
        :precondition (and (available ?h) (at ?h ?l)
                           (on ?c ?s) (clear ?c)
                           (is-at ?s ?l)      ; Supporting crate S must be grounded at L
                           (is-at ?c ?l)      ; Crate C location tracking
                      )
        :effect (and (not (on ?c ?s)) (not (available ?h))
                     (lifting ?h ?c) (clear ?s)
                     (not (is-at ?c ?l))
                )
    )

    ;; 3a. Drop Action: Drops a lifted crate onto a Pallet
    (:action drop_onto_pallet
        :parameters (?c - crate ?p - pallet ?h - hoist ?l - place)
        :precondition (and (lifting ?h ?c) (clear ?p) (at ?h ?l)
                           (at ?p ?l)
                      )
        :effect (and (not (lifting ?h ?c)) (available ?h)
                     (on ?c ?p) (clear ?c) (not (clear ?p))
                     (is-at ?c ?l)
                )
    )
    
    ;; 3b. Drop Action: Drops a lifted crate onto another Crate
    (:action drop_onto_crate
        :parameters (?c - crate ?s - crate ?h - hoist ?l - place)
        :precondition (and (lifting ?h ?c) (clear ?s) (at ?h ?l)
                           (is-at ?s ?l) ; Supporting crate S must be grounded at L
                      )
        :effect (and (not (lifting ?h ?c)) (available ?h)
                     (on ?c ?s) (clear ?c) (not (clear ?s))
                     (is-at ?c ?l)
                )
    )

    ;; 4. Load Action: Loads a lifted crate into a truck
    (:action load
        :parameters (?c - crate ?t - truck ?h - hoist ?p - place)
        :precondition (and (lifting ?h ?c)
                           (at ?h ?p)
                           (at ?t ?p)
                      )
        :effect (and (not (lifting ?h ?c))
                     (available ?h)
                     (in ?c ?t)
                )
    )

    ;; 5. Unload Action: Unloads a crate from a truck, picking it up with the hoist
    (:action unload
        :parameters (?c - crate ?t - truck ?h - hoist ?p - place)
        :precondition (and (available ?h)
                           (in ?c ?t)
                           (at ?h ?p)
                           (at ?t ?p)
                      )
        :effect (and (not (in ?c ?t))
                     (not (available ?h))
                     (lifting ?h ?c)
                )
    )