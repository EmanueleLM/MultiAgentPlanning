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
    
    ;; Drive Truck
    (:action drive
        :parameters (?t - truck ?l1 ?l2 - place)
        :precondition (and (at ?t ?l1) (not (at ?t ?l2)))
        :effect (and (at ?t ?l2)
                     (not (at ?t ?l1))
                     (increase (total-cost) 1)
                )
    )

    ;; Lift Crate from Surface (Pallet or Crate)
    (:action lift-from-surface
        :parameters (?c - crate ?s - surface ?h - hoist ?l - place)
        :precondition (and (located ?s ?l)
                           (at ?h ?l)
                           (available ?h)
                           (on ?c ?s)
                           (clear ?c)
                      )
        :effect (and (lifting ?h ?c)
                     (not (on ?c ?s))
                     (not (available ?h))
                     (not (clear ?c))
                     (clear ?s)
                     (increase (total-cost) 1)
                )
    )

    ;; Drop Crate onto Surface (Pallet or Crate)
    (:action drop-onto-surface
        :parameters (?c - crate ?s - surface ?h - hoist ?l - place)
        :precondition (and (located ?s ?l)
                           (at ?h ?l)
                           (lifting ?h ?c)
                           (clear ?s)
                      )
        :effect (and (on ?c ?s)
                     (available ?h)
                     (clear ?c)
                     (not (lifting ?h ?c))
                     (not (clear ?s))
                     (increase (total-cost) 1)
                )
    )
    
    ;; Load Crate into Truck (requires hoist to be lifting the crate)
    (:action load
        :parameters (?c - crate ?t - truck ?h - hoist ?l - place)
        :precondition (and (at ?t ?l)
                           (at ?h ?l)
                           (lifting ?h ?c)
                      )
        :effect (and (in ?c ?t)
                     (available ?h)
                     (not (lifting ?h ?c))
                     (increase (total-cost) 1)
                )
    )

    ;; Unload Crate from Truck (hoist takes ownership)
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
                     (increase (total-cost) 1)
                )
    )

)