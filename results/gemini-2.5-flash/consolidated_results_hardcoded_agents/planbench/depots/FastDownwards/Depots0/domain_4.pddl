(define (domain logistics-depots-optimized)
    (:requirements :strips :typing :negative-preconditions)

    (:types
        locatable
        place
        depot distributor - place
        
        truck - locatable ; Mobile
        hoist - locatable ; Fixed resource
        
        item - locatable
        surface - item ; Abstract type for things that can be stacked upon
        pallet - surface ; Fixed resource surface
        crate - surface ; Mobile item surface
    )

    (:predicates
        ;; Location tracking: split into fixed link and mobile movement
        (mobile-at ?o - (either truck crate) ?p - place)
        (infrastructure ?p - place ?h - hoist ?pl - pallet) ; Links P, H, and PL

        ;; Connectivity 
        (connected ?p1 - place ?p2 - place) 

        ;; Stacking
        (on ?c - crate ?s - surface)
        (clear ?s - surface) 

        ;; Containment
        (in ?c - crate ?t - truck)

        ;; Hoist Status
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
    )

    ;; 1. DRIVE: Move a truck from one place to another place.
    (:action drive-truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (mobile-at ?t ?from)
            (connected ?from ?to)
        )
        :effect (and
            (not (mobile-at ?t ?from))
            (mobile-at ?t ?to)
        )
    )

    ;; 2a. LIFT-FROM-CRATE: Lift crate C from surface crate S at P.
    (:action lift-from-crate
        :parameters (?h - hoist ?c - crate ?s - crate ?p - place ?pl - pallet)
        :precondition (and
            (available ?h)
            (mobile-at ?c ?p)
            (mobile-at ?s ?p)
            (on ?c ?s)
            (clear ?c)
            (infrastructure ?p ?h ?pl) ; Ensures H is at P (and provides dummy PL link)
        )
        :effect (and
            (not (available ?h))
            (not (clear ?c))        
            (not (mobile-at ?c ?p))        
            (not (on ?c ?s))        
            (lifting ?h ?c)
            (clear ?s)              
        )
    )

    ;; 2b. LIFT-FROM-PALLET: Lift crate C from surface pallet PL at P.
    (:action lift-from-pallet
        :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place)
        :precondition (and
            (available ?h)
            (mobile-at ?c ?p)
            (on ?c ?pl)
            (clear ?c)
            (infrastructure ?p ?h ?pl) ; Ensures H and PL are at P
        )
        :effect (and
            (not (available ?h))
            (not (clear ?c))        
            (not (mobile-at ?c ?p))        
            (not (on ?c ?pl))        
            (lifting ?h ?c)
            (clear ?pl)              
        )
    )

    ;; 3a. DROP-TO-CRATE: Drop crate C onto surface crate S at P.
    (:action drop-to-crate
        :parameters (?h - hoist ?c - crate ?s - crate ?p - place ?pl - pallet)
        :precondition (and
            (lifting ?h ?c)
            (mobile-at ?s ?p)
            (clear ?s)
            (infrastructure ?p ?h ?pl) ; Ensures H is at P
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (mobile-at ?c ?p)          
            (not (clear ?s))    
            (clear ?c)          
            (on ?c ?s)
        )
    )
    
    ;; 3b. DROP-TO-PALLET: Drop crate C onto surface pallet PL at P.
    (:action drop-to-pallet
        :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place)
        :precondition (and
            (lifting ?h ?c)
            (clear ?pl)
            (infrastructure ?p ?h ?pl) ; Ensures H and PL are at P
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (mobile-at ?c ?p)          
            (not (clear ?pl))    
            (clear ?c)          
            (on ?c ?pl)
        )
    )
    
    ;; 4. LOAD: Load crate C into truck T at P.
    (:action load-crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?pl - pallet)
        :precondition (and
            (mobile-at ?t ?p)
            (lifting ?h ?c)
            (infrastructure ?p ?h ?pl) ; Ensures H is at P
        )
        :effect (and
            (available ?h)
            (in ?c ?t)
            (not (lifting ?h ?c))
        )
    )

    ;; 5. UNLOAD: Unload crate C from truck T at P.
    (:action unload-crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?pl - pallet)
        :precondition (and
            (mobile-at ?t ?p)
            (available ?h)
            (in ?c ?t)
            (infrastructure ?p ?h ?pl) ; Ensures H is at P
        )
        :effect (and
            (not (available ?h))
            (lifting ?h ?c)
            (not (in ?c ?t))
        )
    )
)