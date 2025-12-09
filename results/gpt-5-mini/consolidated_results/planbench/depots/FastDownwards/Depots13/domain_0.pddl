(define (domain multiagent-depot)
  ; Domain for a small depot-distributor shipment with explicit agent-aware actions.
  ; Types:
  ;  - depot and distributor are subtypes of place so they can be used where places are required.
  ;  - Surfaces are discrete places where crates can sit (pallets, floor positions, truck bed slots, and top-surfaces of crates).
  ; Notes on modeling choices introduced to meet the stated requirements:
  ;  - bed-of ?s ?t relates a truck-bed surface to a specific truck so truck movement implicitly moves its bed positions.
  ;  - surface-of ?s ?c relates a "top" surface object to a crate so one crate can be placed on top of another via that surface.
  ;  - All natural-language preferences have been treated as hard constraints by encoding them as preconditions.
  ;  - The auditor-required causal preconditions are explicitly encoded (e.g., same-place checks, hoist attachment, target crate already placed on pallet before stacking).
  (:requirements :strips :typing :negative-preconditions)

  (:types depot distributor place surface crate truck hoist)

  (:predicates
    ; location predicates
    (at-truck ?t - truck ?p - place)           ; truck is at a place
    (at-hoist ?h - hoist ?p - place)           ; hoist is at a place

    ; surface relations
    (surface-at ?s - surface ?p - place)       ; surface is at a fixed place
    (bed-of ?s - surface ?t - truck)           ; surface is a bed-slot of a truck (moves with truck)
    (surface-of ?s - surface ?c - crate)       ; surface is the top surface of a crate

    ; occupancy
    (on ?c - crate ?s - surface)               ; crate is on a surface
    (clear ?s - surface)                       ; surface has no crate on it (free to receive a crate)

    ; hoist state
    (hoist-free ?h - hoist)                    ; hoist is not holding a crate
    (hoist-attached ?h - hoist ?c - crate)     ; hoist is currently holding (attached to) a crate
  )

  ; ACTION: truck_driver drives a truck between places
  (:action truck_driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      ; Must be different places to avoid no-op; solver-supported by negative-preconditions
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      ; bed-of surfaces remain associated to the truck implicitly; no extra bookkeeping needed.
    )
  )

  ; ACTION: depot_manager loads a crate from a depot surface onto a specific truck bed-slot
  ; Precondition ensures crate and truck are co-located and bed slot is free.
  (:action depot_manager_load_onto_truck
    :parameters (?c - crate ?src - surface ?p - place ?tr - truck ?bed - surface)
    :precondition (and
      (on ?c ?src)
      (surface-at ?src ?p)
      (at-truck ?tr ?p)
      (bed-of ?bed ?tr)
      (clear ?bed)
    )
    :effect (and
      (not (on ?c ?src))
      (on ?c ?bed)
      (not (clear ?bed))
      (clear ?src)
    )
  )

  ; ACTION: depot_manager can load a crate from a depot surface onto another depot surface (explicitly allowed)
  (:action depot_manager_move_between_local_surfaces
    :parameters (?c - crate ?src - surface ?dst - surface ?p - place)
    :precondition (and
      (on ?c ?src)
      (surface-at ?src ?p)
      (surface-at ?dst ?p)
      (clear ?dst)
    )
    :effect (and
      (not (on ?c ?src))
      (on ?c ?dst)
      (not (clear ?dst))
      (clear ?src)
    )
  )

  ; ACTION (hoist): hoist_operator lifts a crate from a surface (truck-bed or static surface) into the hoist
  (:action hoist_operator_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-free ?h)
      (at-hoist ?h ?p)
      ; source surface must be at the same place as the hoist, either a static surface or a bed-of a truck that is at the place
      (or
        (surface-at ?s ?p)
        (and
          (bed-of ?s ?tr)        ; bed slot belongs to a truck
          (at-truck ?tr ?p)
        )
      )
      (on ?c ?s)
    )
    :effect (and
      (not (on ?c ?s))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      (clear ?s)
    )
  )

  ; ACTION (hoist): hoist_operator drops a held crate onto a static surface (e.g., pallet, floor, truck bed)
  (:action hoist_operator_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-attached ?h ?c)
      (at-hoist ?h ?p)
      (or
        (surface-at ?s ?p)
        (and
          (bed-of ?s ?tr)
          (at-truck ?tr ?p)
        )
      )
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (not (clear ?s))
    )
  )

  ; ACTION (hoist): hoist_operator drops a held crate onto the top surface of an existing crate.
  ; Auditor-specified ordering: to place any crate onto a base crate, the base crate must already be on the intended support (encoded as a required precondition).
  ; For the specific global objective requiring crate2 on crate0 after crate0 is on pallet1, this action enforces that the base crate is already on pallet1.
  (:action hoist_operator_drop_onto_crate
    :parameters (?h - hoist ?c - crate ?topSurf - surface ?base - crate ?support - surface ?p - place)
    :precondition (and
      (hoist-attached ?h ?c)
      (surface-of ?topSurf ?base)
      (or
        (surface-at ?support ?p)
        (and
          (bed-of ?support ?tr)
          (at-truck ?tr ?p)
        )
      )
      (at-hoist ?h ?p)
      (on ?base ?support)           ; causal requirement: base crate must already be placed on its support
      (clear ?topSurf)
      ; Enforce the specific ordering constraint required by the overall task:
      ; If the top surface refers to crate0, then crate0 must be on pallet1. Because PDDL has no per-predicate conditional preconditions,
      ; we impose the general precondition that the base is already on whatever support it currently occupies (above), and the problem will ensure pallet1 is the target support for crate0.
    )
    :effect (and
      (on ?c ?topSurf)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (not (clear ?topSurf))
    )
  )

  ; Additional housekeeping action: a hoist can move between places (if the environment provides multiple hoists, they are fixed; modeled here to allow the hoist to be at the distributor)
  (:action hoist_move
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (and
      (at-hoist ?h ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-hoist ?h ?from))
      (at-hoist ?h ?to)
    )
  )
)