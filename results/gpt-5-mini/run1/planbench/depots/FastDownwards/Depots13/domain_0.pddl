(define (domain multiagent-warehousing)
  ; Multi-agent warehousing domain for Fast-Downward (STRIPS + typing + negative-preconditions)
  ; Types:
  ;  - depot and distributor are subtypes of place (locations)
  ;  - surface: physical surfaces (pallets, docks) that are located at places
  ;  - crate, truck, hoist
  (:requirements :strips :typing :negative-preconditions)

  (:types depot distributor - place
          place
          surface crate truck hoist)

  ; Predicates:
  ; - connectivity and locations
  ;   (connected ?from ?to)   : explicit allowed moves between places (solver must not reorder moves)
  ;   (at ?truck ?place)      : truck is at a place
  ;   (at-hoist ?hoist ?place) : hoist is at a place
  ;   (surface-at ?s ?place)  : surface s is at place
  ; - crate placement
  ;   (on-surface ?crate ?surface) : crate sits directly on a surface
  ;   (on-crate ?crate ?under)     : crate sits directly on another crate (stack)
  ; - truck contents and availability
  ;   (in-truck ?crate ?truck)
  ;   (truck-empty ?truck) ; truck carries no crate (we model single-crate capacity)
  ; - hoist status and manipulation
  ;   (hoist-free ?hoist)          ; hoist is not holding anything
  ;   (holding ?hoist ?crate)      ; hoist holds a crate
  ; - clear/empty predicates (required by auditors to avoid implicit assumptions)
  ;   (surface-empty ?surface) ; no crate currently on the surface
  ;   (clear-crate ?crate)     ; no crate on top of this crate
  (:predicates
    (connected ?from - place ?to - place)

    (at ?truck - truck ?place - place)
    (at-hoist ?hoist - hoist ?place - place)
    (surface-at ?s - surface ?p - place)

    (on-surface ?c - crate ?s - surface)
    (on-crate ?c - crate ?under - crate)

    (in-truck ?c - crate ?t - truck)
    (truck-empty ?t - truck)

    (hoist-free ?h - hoist)
    (holding ?h - hoist ?c - crate)

    (surface-empty ?s - surface)
    (clear-crate ?c - crate)
  )

  ; Domain comments (explicit required preconditions added):
  ; - Actions require explicit (truck-empty), (hoist-free), (surface-empty), (clear-crate) where relevant.
  ;   These were introduced as required preconditions because the agent descriptions implied physical exclusivity
  ;   (truck carries at most one crate; hoist holds at most one crate; surfaces accept only crates when empty;
  ;   crates must have no crate on top to be lifted).
  ; - Connectivity is explicit via (connected ...) facts in the problem; no implicit global travel allowed.
  ; - When stacking on a crate, we require the supporting crate to currently sit on a surface (no multi-level support
  ;   beyond one crate above a surface is modeled), and that surface is at the same place as the hoist/truck.
  ;   If a scenario required deeper nesting, corresponding predicates and rules must be added.

  ; Agent-aware action names (truck_driver-*, hoist_operator-*)

  ; Truck driving action: move a truck between adjacent places.
  (:action truck_driver-drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from) (connected ?from ?to))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  ; Truck loads a crate from a surface into the truck (single-crate capacity).
  ; Preconditions:
  ;  - truck and surface are co-located
  ;  - crate is on the surface and has no crate on top (clear)
  ;  - truck is empty
  (:action truck_driver-load-from-surface
    :parameters (?t - truck ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?t ?p)
                    (surface-at ?s ?p)
                    (on-surface ?c ?s)
                    (clear-crate ?c)
                    (truck-empty ?t)
                  )
    :effect (and
              (in-truck ?c ?t)
              (not (on-surface ?c ?s))
              (not (truck-empty ?t))
              ; surface becomes empty if this crate was the only one on that surface
              (surface-empty ?s)
            )
  )

  ; Truck unloads a crate from the truck onto an empty surface at same place.
  (:action truck_driver-unload-to-surface
    :parameters (?t - truck ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?t ?p)
                    (surface-at ?s ?p)
                    (in-truck ?c ?t)
                    (surface-empty ?s)
                  )
    :effect (and
              (on-surface ?c ?s)
              (not (in-truck ?c ?t))
              (truck-empty ?t)
              (not (surface-empty ?s))
              (clear-crate ?c) ; newly placed crate has no crate on top
            )
  )

  ; Hoist lifts a crate from a surface (hoist at same place, hoist must be free, crate must be clear)
  (:action hoist_operator-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (surface-at ?s ?p)
                    (on-surface ?c ?s)
                    (hoist-free ?h)
                    (clear-crate ?c)
                  )
    :effect (and
              (holding ?h ?c)
              (not (on-surface ?c ?s))
              (not (hoist-free ?h))
              (surface-empty ?s) ; surface no longer has this crate
              (not (clear-crate ?c)) ; while held, treat as not clear for consistency (no crate on top but it's being manipulated)
            )
  )

  ; Hoist lifts a top crate from a crate that sits on a surface (we require the supporting crate to be on a surface).
  ; Preconditions ensure place alignment via surface.
  (:action hoist_operator-lift-from-crate
    :parameters (?h - hoist ?c - crate ?under - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (on-crate ?c ?under)
                    (on-surface ?under ?s)
                    (surface-at ?s ?p)
                    (hoist-free ?h)
                    (clear-crate ?c)
                  )
    :effect (and
              (holding ?h ?c)
              (not (on-crate ?c ?under))
              (not (hoist-free ?h))
              (clear-crate ?under) ; underlying crate becomes clear after removing top
              (not (clear-crate ?c))
            )
  )

  ; Hoist drops a held crate onto an empty surface (surface must be empty).
  (:action hoist_operator-drop-on-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (surface-at ?s ?p)
                    (holding ?h ?c)
                    (surface-empty ?s)
                  )
    :effect (and
              (on-surface ?c ?s)
              (not (holding ?h ?c))
              (hoist-free ?h)
              (not (surface-empty ?s))
              (clear-crate ?c)
            )
  )

  ; Hoist drops a held crate onto a crate that currently sits on a surface (support crate must be clear).
  (:action hoist_operator-drop-on-crate
    :parameters (?h - hoist ?c - crate ?under - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (holding ?h ?c)
                    (on-surface ?under ?s)
                    (surface-at ?s ?p)
                    (clear-crate ?under)
                  )
    :effect (and
              (on-crate ?c ?under)
              (not (holding ?h ?c))
              (hoist-free ?h)
              (not (clear-crate ?under))
              (clear-crate ?c)
            )
  )

  ; Note: There are no generic penalty or bookkeeping actions. All constraints (single capacity, surface emptiness,
  ; hoist exclusivity, required place alignment) are enforced by action preconditions and effects.
)