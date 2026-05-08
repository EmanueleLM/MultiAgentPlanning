(define (domain depots_orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor - place
    truck hoist - object
    pallet crate - object
    stage
  )

  (:predicates
    ;; locations
    (truck-at ?t - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (pallet-at ?p - pallet ?pl - place)
    (crate-at ?c - crate ?pl - place)

    ;; stacking relations (explicit for pallets and crates)
    (on-pallet ?c - crate ?p - pallet)
    (on-crate ?c - crate ?c2 - crate)

    ;; clearance of surfaces
    (clear-pallet ?p - pallet)
    (clear-crate ?c - crate)

    ;; hoist and truck load state
    (hoist-free ?h - hoist)
    (hoist-attached ?h - hoist ?c - crate)
    (in-truck ?c - crate ?t - truck)

    ;; global discrete stage token and successor relation (linear time)
    (stage-ready ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; DRIVER: drive a truck from one place to another, consuming a stage token
  (:action driver_drive
    :parameters (?driver - object ?t - truck ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (truck-at ?t ?from)
      (stage-ready ?s)
      (succ ?s ?s2)
      ;; forbid no-op drive (requires that truck is not already asserted at destination)
      (not (truck-at ?t ?to))
    )
    :effect (and
      (not (truck-at ?t ?from))
      (truck-at ?t ?to)
      ;; advance global stage token
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST: move hoist between places (can move whether free or attached)
  (:action hoist_move
    :parameters (?h - hoist ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-at ?h ?from)
      (stage-ready ?s)
      (succ ?s ?s2)
      (not (hoist-at ?h ?to))
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST LIFT from a pallet
  (:action hoist_lift_from_pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-at ?h ?loc)
      (pallet-at ?p ?loc)
      (on-pallet ?c ?p)
      (clear-crate ?c)
      (hoist-free ?h)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; crate is removed from the surface and from place while hoist holds it
      (not (on-pallet ?c ?p))
      (not (crate-at ?c ?loc))
      ;; hoist now attached and not free
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      ;; the pallet becomes clear
      (clear-pallet ?p)
      ;; crate remains clear (precondition asserted it is)
      (clear-crate ?c)
      ;; advance stage
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST LIFT from a crate (stacked on another crate)
  (:action hoist_lift_from_crate
    :parameters (?h - hoist ?c - crate ?below - crate ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-at ?h ?loc)
      (on-crate ?c ?below)
      (clear-crate ?c)
      (hoist-free ?h)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-crate ?c ?below))
      (not (crate-at ?c ?loc))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      ;; the below crate becomes clear
      (clear-crate ?below)
      (clear-crate ?c)
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST DROP to a pallet
  (:action hoist_drop_to_pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (hoist-at ?h ?loc)
      (pallet-at ?p ?loc)
      (clear-pallet ?p)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (on-pallet ?c ?p)
      (crate-at ?c ?loc)
      (not (clear-pallet ?p))
      ;; after drop crate is clear (nothing on top)
      (clear-crate ?c)
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST DROP to a crate
  (:action hoist_drop_to_crate
    :parameters (?h - hoist ?c - crate ?below - crate ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (hoist-at ?h ?loc)
      (crate-at ?below ?loc)
      (clear-crate ?below)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (on-crate ?c ?below)
      (crate-at ?c ?loc)
      ;; new top crate is clear
      (clear-crate ?c)
      ;; below crate no longer clear
      (not (clear-crate ?below))
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST LOAD into truck: hoist currently holding crate places crate into truck
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (hoist-at ?h ?loc)
      (truck-at ?t ?loc)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; crate becomes in truck; remove any place assertions (crate is in truck, not at place)
      (not (hoist-attached ?h ?c))
      (in-truck ?c ?t)
      (not (crate-at ?c ?loc))
      (hoist-free ?h)
      ;; ensure crate is not on any surface (clear of surface relations)
      (not (on-pallet ?c ?p)) ;; safe negative effect (will be ignored if not present)
      (not (on-crate ?c ?c2))
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST UNLOAD from truck: hoist not free and picks crate from truck (crate remains not at place until possibly dropped)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-at ?h ?loc)
      (truck-at ?t ?loc)
      (hoist-free ?h)
      (in-truck ?c ?t)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      ;; crate is no longer asserted at the place until dropped by hoist
      (not (crate-at ?c ?loc))
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )
)