(define (domain logistics-depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place
        surface
        pallet crate - surface
        truck hoist
    )
    
    (:predicates
        (at ?o - (or truck hoist surface) ?p - place)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (clear ?s - surface) ; Applicable to pallets or crates
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
    )

    ;; 1. Drive a truck
    ;; Restriction: A truck can be driven from one place to another place only if the truck is at the origin place.
    ;; Effect: Once a truck has been driven from one place to another, it is not at the origin place and is at the destination place.
    (:action drive-truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (at ?t ?from)
        :effect (and 
            (at ?t ?to)
            (not (at ?t ?from))
        )
    )

    ;; 2. Use a hoist to lift a crate from a surface 
    ;; Restriction: Hoist and crate at same place, hoist available, crate clear.
    ;; Effect: Crate not at place, Hoist lifting crate, Hoist not available, Surface clear, Crate not on surface.
    (:action lift-crate-from-surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p) ; Crate must be at the place
            (on ?c ?s) ; Crate must be on the surface
            (clear ?c)
            (available ?h)
        )
        :effect (and
            (lifting ?h ?c)
            (clear ?s) ; Surface becomes clear
            (not (available ?h)) 
            (not (at ?c ?p)) ; Crate is now lifted, not at place
            (not (on ?c ?s)) 
        )
    )

    ;; 3. Use a hoist to drop a crate to a surface
    ;; Restriction: Hoist and surface at place, surface clear, hoist lifting crate.
    ;; Effect: Hoist available, Not lifting crate, Crate at place, Surface not clear, Crate clear, Crate on surface.
    (:action drop-crate-to-surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s) 
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c)) 
            (at ?c ?p) ; Crate lands at place
            (not (clear ?s)) ; Surface is now covered
            (clear ?c) ; Crate is now accessible
            (on ?c ?s)
        )
    )

    ;; 4. Use a hoist to load a crate into a truck
    ;; Restriction: Hoist at same place, truck at same place, hoist lifting crate.
    ;; Effect: Crate is in truck, Hoist available, Not lifting crate. (Based on common logistics pattern following incomplete specification snippet)
    (:action load-crate-to-truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
            ;; Loading implies the crate is no longer (at ?p) if it was lifted from elsewhere, 
            ;; but since lifting removes (at ?p), we only need to ensure the truck is ready.
        )
    )
    
    ;; 5. Use a hoist to unload a crate from a truck
    ;; Restriction: Hoist at same place as truck, hoist available, crate in truck.
    ;; Effect: Crate not in truck, Hoist not available, Hoist lifting crate.
    (:action unload-crate-from-truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
            ;; Crate is now lifted, location status (at ?p) remains NOT set until dropped.
        )
    )
)