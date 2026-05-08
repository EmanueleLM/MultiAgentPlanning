(define (domain depots-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    place
      depot
      distributor
    object
      crate
      pallet
    mover
      truck
      hoist
  )

  (:predicates
    (at ?x - (either object mover) ?p - place)
    (on ?c - crate ?s - (either crate pallet))
    (clear ?s - (either crate pallet))
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
  )

  (:functions
    (total-cost)
  )

  ;; 1. Drive a truck from one place to another place.
  (:action drive
    :parameters (?t - truck ?from ?to - place)
    :precondition (at ?t ?from)
    :effect (and (not (at ?t ?from))
                 (at ?t ?to)
                 (increase (total-cost) 1)
            )
  )

  ;; 2. Use a hoist to lift a crate from a surface at a place.
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?c ?p)
                       (available ?h)
                       (clear ?c) ; The crate itself must be clear on top to be lifted
                       (on ?c ?s)
                  )
    :effect (and (not (at ?c ?p)) ; Crate is now "in the air", no longer at the place
                 (lifting ?h ?c)
                 (not (available ?h))
                 (clear ?s) ; The surface the crate was on becomes clear
                 (not (on ?c ?s))
                 (increase (total-cost) 1)
            )
  )

  ;; 3. Use a hoist to drop a crate to a surface at a place.
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?s ?p) ; Surface must be at the same place as the hoist
                       (clear ?s) ; Target surface must be clear
                       (lifting ?h ?c)
                  )
    :effect (and (available ?h)
                 (not (lifting ?h ?c))
                 (at ?c ?p) ; Crate is now at the place
                 (not (clear ?s)) ; Surface is no longer clear as crate is on it
                 (clear ?c) ; The dropped crate is clear on top
                 (on ?c ?s)
                 (increase (total-cost) 1)
            )
  )

  ;; 4. Use a hoist to load a crate into a truck at a place.
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?t ?p)
                       (lifting ?h ?c)
                  )
    :effect (and (in ?c ?t)
                 (available ?h)
                 (not (lifting ?h ?c))
                 (increase (total-cost) 1)
            )
  )

  ;; 5. Use a hoist to unload a crate from a truck at a place.
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?t ?p)
                       (available ?h)
                       (in ?c ?t)
                  )
    :effect (and (not (in ?c ?t))
                 (not (available ?h))
                 (lifting ?h ?c) ; Crate is now being lifted by the hoist
                 (increase (total-cost) 1)
            )
  )
)