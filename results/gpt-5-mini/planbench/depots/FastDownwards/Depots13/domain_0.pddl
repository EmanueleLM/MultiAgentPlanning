(define (domain depot-operations)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface crate truck hoist depot distributor
  )

  ; Comments / design notes:
  ; - This domain models explicit surfaces separate from crates: surfaces include pallets,
  ;   ground surfaces, truck beds, and a dedicated top-surface object for each crate.
  ;   Each crate has a top surface (top-of ...). This makes stacking and "clear top"
  ;   conditions explicit and checkable by the planner.
  ; - We introduce explicit predicates for surface locations (surface-at), truck
  ;   positions (truck-at), and hoist positions (hoist-at). Truck beds are surfaces
  ;   tied to trucks via (bed-of bed truck). Driving a truck moves its bed surface.
  ; - Hoists use an explicit (hoist-free ?h) flag to allow checking that a hoist is
  ;   not already holding a crate; this avoids implicit or existential negative checks.
  ; - The auditor required that all causal preconditions be explicit. The domain
  ;   therefore requires the following preconditions wherever relevant:
  ;     * The actor (truck/hoist) must be at the same place as the source and target surfaces.
  ;     * The target surface must be clear before placing a crate on it.
  ;     * A crate's top surface must be clear before lifting that crate.
  ;     * A truck bed is modeled as a surface; its ownership (bed-of) is explicitly required,
  ;       and the bed's surface-at location is moved whenever the truck drives.
  ; - No bookkeeping shortcuts or penalty constructs are included. All constraints are
  ;   enforced by preconditions and effects. Preferences in the natural-language
  ;   specification are encoded as hard constraints (e.g., "avoid" or "would rather")
  ;   would be represented in the problem as required preconditions or absent edges;
  ;   because no such extra resources were provided, none were invented here.
  ; - If additional domain-level constraints were necessary but not provided by the
  ;   agents' descriptions, they were introduced as explicit preconditions and are
  ;   documented in the comments above.

  (:predicates
    (truck-at ?t - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)
    (on ?c - crate ?s - surface)            ; crate ?c is resting on surface ?s
    (clear ?s - surface)                    ; surface ?s has no crate on it
    (top-of ?s - surface ?c - crate)        ; surface ?s is the top surface of crate ?c
    (bed-of ?s - surface ?t - truck)        ; surface ?s is the bed surface of truck ?t
    (held ?h - hoist ?c - crate)            ; hoist ?h is holding crate ?c
    (hoist-free ?h - hoist)                 ; hoist ?h is not holding anything
  )

  ; DRIVER: drive - move a truck (and its bed surface) from one place to another
  (:action driver-drive
    :parameters (?truck - truck ?from - place ?to - place ?bed - surface)
    :precondition (and
      (truck-at ?truck ?from)
      (bed-of ?bed ?truck)
      (surface-at ?bed ?from)
    )
    :effect (and
      (not (truck-at ?truck ?from))
      (truck-at ?truck ?to)
      (not (surface-at ?bed ?from))
      (surface-at ?bed ?to)
    )
  )

  ; DRIVER: load - move a crate from a surface at a place onto the truck bed at that place
  ; Preconditions ensure truck and source surface are colocated, crate top is clear, and bed is clear.
  (:action driver-load
    :parameters (?truck - truck ?bed - surface ?place - place ?crate - crate ?src - surface ?top - surface)
    :precondition (and
      (truck-at ?truck ?place)
      (bed-of ?bed ?truck)
      (surface-at ?bed ?place)
      (surface-at ?src ?place)
      (on ?crate ?src)
      (top-of ?top ?crate)
      (clear ?top)            ; crate has no crate on top
      (clear ?bed)            ; truck bed must be empty / clear to load
    )
    :effect (and
      (not (on ?crate ?src))
      (on ?crate ?bed)
      (clear ?src)
      (not (clear ?bed))
    )
  )

  ; DRIVER: unload - move a crate from the truck bed at a place onto a target surface at that place
  (:action driver-unload
    :parameters (?truck - truck ?bed - surface ?place - place ?crate - crate ?target - surface)
    :precondition (and
      (truck-at ?truck ?place)
      (bed-of ?bed ?truck)
      (surface-at ?bed ?place)
      (surface-at ?target ?place)
      (on ?crate ?bed)
      (clear ?target)         ; target surface must be clear
    )
    :effect (and
      (not (on ?crate ?bed))
      (on ?crate ?target)
      (clear ?bed)
      (not (clear ?target))
    )
  )

  ; HOIST: lift - hoist lifts a crate from a surface to the hoist hook (held)
  (:action hoist-lift
    :parameters (?hoist - hoist ?place - place ?crate - crate ?src - surface ?top - surface)
    :precondition (and
      (hoist-at ?hoist ?place)
      (surface-at ?src ?place)
      (on ?crate ?src)
      (top-of ?top ?crate)
      (clear ?top)            ; nothing on top of the crate to be lifted
      (hoist-free ?hoist)     ; hoist must be free to pick up something
    )
    :effect (and
      (not (on ?crate ?src))
      (held ?hoist ?crate)
      (not (hoist-free ?hoist))
      (clear ?src)
    )
  )

  ; HOIST: drop - hoist places a held crate onto a target surface at the same place
  (:action hoist-drop
    :parameters (?hoist - hoist ?place - place ?crate - crate ?target - surface)
    :precondition (and
      (hoist-at ?hoist ?place)
      (surface-at ?target ?place)
      (held ?hoist ?crate)
      (clear ?target)
    )
    :effect (and
      (not (held ?hoist ?crate))
      (hoist-free ?hoist)
      (on ?crate ?target)
      (not (clear ?target))
    )
  )
)