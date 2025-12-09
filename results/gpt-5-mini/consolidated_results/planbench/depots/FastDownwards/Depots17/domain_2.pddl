(define (domain depots17)
  :requirements :strips :typing :negative-preconditions :equality
  :types
    place
      depot distributor - place
    surface
      pallet crate - surface
    hoist
    truck
    stage

  :predicates
    ;; spatial / containment (global state, not time-indexed)
    (at-truck ?tr - truck ?pl - place)
    (at-hoist ?h - hoist ?pl - place)
    (at-surface ?s - surface ?pl - place)
    (on ?c - crate ?s - surface)         ; crate c is directly on surface s (global)
    (clear ?s - surface)                 ; top of surface s is clear (global)
    (in-truck ?c - crate ?tr - truck)

    ;; explicit ordered stages and resource occupancy (time-indexed)
    (next ?t1 - stage ?t2 - stage)       ; successor relation among stages
    (free-hoist ?h - hoist ?t - stage)   ; hoist h is available at stage t
    (hoist-holding ?h - hoist ?c - crate ?t - stage) ; hoist h holds crate c at stage t
    (free-truck ?tr - truck ?t - stage)  ; truck tr is idle/available at stage t

  ;; Drive a truck between places; consumes a truck availability at a stage and produces
  ;; truck availability at the successor stage. Truck location (at-truck) is global.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-truck ?tr ?from)
      (free-truck ?tr ?t)
      (next ?t ?t2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (free-truck ?tr ?t))
      (free-truck ?tr ?t2)
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at a given place; consumes hoist availability at t
  ;; and produces a hoist-holding fact at successor stage t2. Removes crate-from-surface (global).
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-surface ?s ?pl)
      (on ?c ?s)
      (free-hoist ?h ?t)
      (clear ?c)
      (next ?t ?t2)
    )
    :effect (and
      ;; consume hoist at time t
      (not (free-hoist ?h ?t))
      ;; hoist holds crate starting at t2
      (hoist-holding ?h ?c ?t2)
      ;; crate no longer on the surface (global)
      (not (on ?c ?s))
      ;; crate not at the surface's place (global)
      (not (at-surface ?c ?pl))
      ;; surface becomes clear (global)
      (clear ?s)
    )
  )

  ;; Hoist drops a held crate to a surface; consumes the hoist-holding fact at t and
  ;; makes the hoist available at successor stage t2. Updates global stacking relations.
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-surface ?s ?pl)
      (clear ?s)
      (hoist-holding ?h ?c ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; consume the holding fact at t (no longer holds at t after action)
      (not (hoist-holding ?h ?c ?t))
      ;; hoist becomes available at t2
      (free-hoist ?h ?t2)
      ;; update global stacking/location
      (on ?c ?s)
      (at-surface ?c ?pl)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Hoist loads a held crate into a truck; consumes hoist-holding at t, produces hoist free at t2,
  ;; and updates global in-truck relation. Also consumes truck availability at t and produces it at t2.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-truck ?tr ?pl)
      (hoist-holding ?h ?c ?t)
      (free-truck ?tr ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; consume the hoist-holding at t
      (not (hoist-holding ?h ?c ?t))
      ;; hoist becomes available at t2
      (free-hoist ?h ?t2)
      ;; crate is now in the truck (global)
      (in-truck ?c ?tr)
      ;; update truck availability across stages
      (not (free-truck ?tr ?t))
      (free-truck ?tr ?t2)
      ;; crate no longer at any surface (global)
      (not (at-surface ?c ?pl))
    )
  )

  ;; Hoist unloads a crate from a truck; requires hoist available at t, consumes that availability,
  ;; and produces a hoist-holding fact at successor stage t2. Removes crate-from-truck (global).
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-truck ?tr ?pl)
      (free-hoist ?h ?t)
      (in-truck ?c ?tr)
      (next ?t ?t2)
    )
    :effect (and
      ;; crate removed from truck (global)
      (not (in-truck ?c ?tr))
      ;; consume hoist availability at t
      (not (free-hoist ?h ?t))
      ;; hoist holds crate starting at t2
      (hoist-holding ?h ?c ?t2)
    )
  )
)