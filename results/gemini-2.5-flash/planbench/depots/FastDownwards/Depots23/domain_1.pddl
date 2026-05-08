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
    (at ?x - (object mover) ?p - place)
    (on ?c - crate ?s - (crate pallet))
    (clear ?s - (crate pallet))
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
  )

  (:functions
    (total-cost)
  )

  ;; 1. Drive (truck, origin, destination)
  (:action drive
    :parameters (?t - truck ?from ?to - place)
    :precondition (at ?t ?from)
    :effect (and (not (at ?t ?from))
                 (at ?t ?to)
                 (increase (total-cost) 1)
            )
  )

  ;; 2. Lift (hoist, crate, surface, place)
  ;; Preconditions: hoist at place, crate at place, hoist available, crate clear, crate on surface.
  ;; Effects: crate not at place, hoist lifting crate, hoist not available, surface clear, crate not on surface.
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - (crate pallet) ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?c ?p)
                       (available ?h)
                       (clear ?c)
                       (on ?c ?s)
                  )
    :effect (and (not (at ?c ?p)) ; crate is no longer at the place
                 (lifting ?h ?c)
                 (not (available ?h))
                 (clear ?s) ; the surface ?c was on becomes clear
                 (not (on ?c ?s))
                 (increase (total-cost) 1)
            )
  )

  ;; 3. Drop (hoist, crate, surface, place)
  ;; Preconditions: hoist at place, surface at place, surface clear, hoist lifting crate.
  ;; Effects: hoist available, hoist not lifting crate, crate at place, surface not clear, crate clear, crate on surface.
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - (crate pallet) ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?s ?p) ; surface must be at the place to drop on it
                       (clear ?s)
                       (lifting ?h ?c)
                  )
    :effect (and (available ?h)
                 (not (lifting ?h ?c))
                 (at ?c ?p) ; crate is now at the place
                 (not (clear ?s)) ; surface is no longer clear
                 (clear ?c) ; the dropped crate is clear on top
                 (on ?c ?s)
                 (increase (total-cost) 1)
            )
  )

  ;; 4. Load (hoist, crate, truck, place)
  ;; Preconditions: hoist at place, truck at place, hoist lifting crate.
  ;; Effects: crate in truck, hoist available, hoist not lifting crate, crate is NOT at place (implied by lift action).
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

  ;; 5. Unload (hoist, crate, truck, place)
  ;; Preconditions: hoist at place, truck at place, hoist available, crate in truck.
  ;; Effects: crate not in truck, hoist not available, hoist lifting crate.
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?t ?p)
                       (available ?h)
                       (in ?c ?t)
                  )
    :effect (and (not (in ?c ?t))
                 (not (available ?h))
                 (lifting ?h ?c)
                 (increase (total-cost) 1)
            )
  )
)