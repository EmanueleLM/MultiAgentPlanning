(define (domain orchestrator-crate-transport)
  (:requirements :strips :typing :negative-preconditions :equality :fluents)
  (:types place truck hoist crate pallet)
  (:predicates
    (at ?x - (either truck hoist pallet))
    (on ?c - crate ?s - (either pallet crate))
    (clear ?x - (either crate pallet))
    (in-truck ?c - crate ?t - truck)
    (holding ?h - hoist ?c - crate)
    (available ?h - hoist)
  )

  (:functions
    (current-load ?t - truck) ; numeric current load of truck
    (load-limit ?t - truck)   ; numeric load limit
    (weight ?c - crate)       ; numeric crate weight (constant)
    (fuel-cost)               ; numeric objective to minimize (total-time surrogate)
  )

  ; Truck actions: annotated with truck.* name prefix to indicate agent
  (:action truck.drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from))
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to)
              (increase (fuel-cost) 10)
            )
  )

  ; Hoist actions: annotated with hoist.* name prefix
  ; Hoist lifts a crate from a surface into its gripper (holding). This consumes the hoist availability until put-down/unload completes.
  (:action hoist.lift
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place)
    :precondition (and
                    (at ?h ?p)
                    ; crate must be on the surface and co-located at same place (surface is at the place)
                    (on ?c ?s)
                    (clear ?c)
                    (available ?h)
                    (at ?s ?p)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (clear ?c))
              (holding ?h ?c)
              (not (available ?h))
              (clear ?s)
              (increase (fuel-cost) 1)
            )
  )

  ; Hoist puts down a held crate onto a surface (pallet or crate). This re-enables hoist availability.
  (:action hoist.put-down
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (holding ?h ?c)
                    (clear ?s)
                    (at ?s ?p)
                    (not (available ?h)) ; hoist currently in use (was holding)
                  )
    :effect (and
              (on ?c ?s)
              (not (holding ?h ?c))
              (available ?h)
              (not (clear ?s))
              (clear ?c)
              (increase (fuel-cost) 1)
            )
  )

  ; Hoist loads a held crate into a co-located truck. Enforce capacity guard.
  (:action hoist.load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (holding ?h ?c)
                    (not (available ?h)) ; in the lifting/handling phase
                    ; capacity guard: current-load(t) + weight(c) <= load-limit(t)
                    (<= (+ (current-load ?t) (weight ?c)) (load-limit ?t))
                  )
    :effect (and
              (in-truck ?c ?t)
              (not (holding ?h ?c))
              (available ?h)
              (increase (current-load ?t) (weight ?c))
              (increase (fuel-cost) 1)
            )
  )

  ; Hoist grabs a crate from inside a co-located truck (unload), removing it from the truck into its gripper (holding).
  (:action hoist.unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (in-truck ?c ?t)
                    (available ?h)
                  )
    :effect (and
              (not (in-truck ?c ?t))
              (holding ?h ?c)
              (not (available ?h))
              (decrease (current-load ?t) (weight ?c))
              (increase (fuel-cost) 1)
            )
  )
)