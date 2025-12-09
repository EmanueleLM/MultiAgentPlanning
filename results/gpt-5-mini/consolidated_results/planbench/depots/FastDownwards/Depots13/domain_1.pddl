(define (domain depots13)
  (:requirements :strips :typing :negative-preconditions)
  (:types depot distributor - place
          place - object
          surface crate truck hoist)

  (:predicates
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)

    (surface-at ?s - surface ?p - place)    ; static surfaces (pallets etc.) located at places
    (bed-of ?s - surface ?tr - truck)       ; bed surface belonging to a truck (moves with truck)
    (surface-of ?s - surface ?c - crate)    ; top surface associated with a crate

    (on ?c - crate ?s - surface)            ; crate is on a surface
    (clear ?s - surface)                    ; surface has no crate on it (free to receive a crate)

    (hoist-free ?h - hoist)                 ; hoist is available (not holding)
    (hoist-attached ?h - hoist ?c - crate)  ; hoist is holding crate

    (in-truck ?c - crate ?tr - truck)       ; crate is inside/on the truck (loaded)
  )

  ; Drive a truck between two different places
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ; Lift from a static surface (e.g., pallet)
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?top - surface ?p - place)
    :precondition (and
      (hoist-free ?h)
      (at-hoist ?h ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (surface-of ?top ?c)
      (clear ?top)
    )
    :effect (and
      (not (on ?c ?s))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      (clear ?s)
    )
  )

  ; Lift from a truck bed surface
  (:action hoist_lift_from_bed
    :parameters (?h - hoist ?c - crate ?s - surface ?top - surface ?tr - truck ?p - place)
    :precondition (and
      (hoist-free ?h)
      (at-hoist ?h ?p)
      (bed-of ?s ?tr)
      (at-truck ?tr ?p)
      (on ?c ?s)
      (surface-of ?top ?c)
      (clear ?top)
    )
    :effect (and
      (not (on ?c ?s))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      (clear ?s)
    )
  )

  ; Drop to a static surface (pallet or other static surface)
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?top - surface ?p - place)
    :precondition (and
      (hoist-attached ?h ?c)
      (at-hoist ?h ?p)
      (surface-at ?s ?p)
      (clear ?s)
      (surface-of ?top ?c)
    )
    :effect (and
      (on ?c ?s)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (not (clear ?s))
      (clear ?top)
    )
  )

  ; Drop to a truck bed surface
  (:action hoist_drop_to_bed
    :parameters (?h - hoist ?c - crate ?s - surface ?top - surface ?tr - truck ?p - place)
    :precondition (and
      (hoist-attached ?h ?c)
      (at-hoist ?h ?p)
      (bed-of ?s ?tr)
      (at-truck ?tr ?p)
      (clear ?s)
      (surface-of ?top ?c)
    )
    :effect (and
      (on ?c ?s)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (not (clear ?s))
      (clear ?top)
    )
  )

  ; Drop onto the top surface of a base crate that is on a static support
  (:action hoist_drop_onto_base_on_static
    :parameters (?h - hoist ?c - crate ?topC - surface ?base - crate ?topB - surface ?support - surface ?p - place)
    :precondition (and
      (hoist-attached ?h ?c)
      (surface-of ?topC ?c)
      (surface-of ?topB ?base)
      (on ?base ?support)
      (surface-at ?support ?p)
      (at-hoist ?h ?p)
      (clear ?topB)
    )
    :effect (and
      (on ?c ?topB)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (not (clear ?topB))
      (clear ?topC)
    )
  )

  ; Drop onto the top surface of a base crate that is on a truck bed
  (:action hoist_drop_onto_base_on_bed
    :parameters (?h - hoist ?c - crate ?topC - surface ?base - crate ?topB - surface ?support - surface ?tr - truck ?p - place)
    :precondition (and
      (hoist-attached ?h ?c)
      (surface-of ?topC ?c)
      (surface-of ?topB ?base)
      (on ?base ?support)
      (bed-of ?support ?tr)
      (at-truck ?tr ?p)
      (at-hoist ?h ?p)
      (clear ?topB)
    )
    :effect (and
      (on ?c ?topB)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (not (clear ?topB))
      (clear ?topC)
    )
  )

  ; Load a crate (held by hoist) into a truck (crate becomes in-truck)
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?top - surface ?tr - truck ?bed - surface ?p - place)
    :precondition (and
      (hoist-attached ?h ?c)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (bed-of ?bed ?tr)
      (surface-of ?top ?c)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (clear ?top)
    )
  )

  ; Unload a crate from a truck into the hoist (hoist becomes attached to crate)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-free ?h)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
    )
  )
)