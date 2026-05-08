(define (domain hoist-operations-conservative)
  (:requirements :strips :typing)
  (:types
    place
    hoist
    truck
    surface
    crate  - surface
    pallet - surface
  )

  (:predicates
    ;; locations
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-surface ?s - surface ?p - place) ;; any surface (pallet or crate) located at a place

    ;; stacking / containment
    (on ?c - crate ?s - surface)    ;; crate directly on a surface (pallet or crate)
    (in ?c - crate ?t - truck)      ;; crate inside truck

    ;; hoist state / resources
    (holding ?h - hoist ?c - crate) ;; hoist holds crate
    (hoist_available ?h - hoist)    ;; hoist is free (resource token)

    ;; surface and crate top availability
    (surface_clear ?s - surface)    ;; surface (pallet or crate) has no crate on top (can receive crate)
    (crate_clear ?c - crate)        ;; no crate stacked on top of this crate
  )

  ;; HOIST: lift crate from a pallet surface
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (at-surface ?c ?p)
      (on ?c ?s)
      (crate_clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      ;; hoist becomes occupied, crate is held and removed from place/surface
      (not (hoist_available ?h))
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (at-surface ?c ?p))

      ;; supporting surface (pallet) becomes clear (no crate on it)
      (surface_clear ?s)
    )
  )

  ;; HOIST: lift crate from another crate (stacked crate)
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (at-surface ?c ?p)
      (on ?c ?s)
      (crate_clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      (not (hoist_available ?h))
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (at-surface ?c ?p))

      ;; the supporting crate becomes clear (no crate on top)
      (crate_clear ?s)
      (surface_clear ?s)
    )
  )

  ;; HOIST: drop crate onto a pallet
  (:action hoist-drop-onto-pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (holding ?h ?c)
      (surface_clear ?s)
    )
    :effect (and
      ;; place crate onto pallet and record its place
      (on ?c ?s)
      (at-surface ?c ?p)

      ;; crate has free top
      (crate_clear ?c)

      ;; pallet now not clear
      (not (surface_clear ?s))

      ;; hoist becomes free
      (hoist_available ?h)
      (not (holding ?h ?c))
    )
  )

  ;; HOIST: drop crate onto another crate (stack onto crate)
  (:action hoist-drop-onto-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (holding ?h ?c)
      (surface_clear ?s)
      (crate_clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (at-surface ?c ?p)

      ;; crate becomes clear on top
      (crate_clear ?c)

      ;; the supporting crate no longer clear (has something on top)
      (not (crate_clear ?s))
      (not (surface_clear ?s))

      ;; hoist freed
      (hoist_available ?h)
      (not (holding ?h ?c))
    )
  )

  ;; HOIST: load held crate into truck
  (:action hoist-load-onto-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (holding ?h ?c)
    )
    :effect (and
      ;; crate moved into truck
      (in ?c ?t)

      ;; crate no longer at this place (held then moved into truck)
      (not (at-surface ?c ?p))

      ;; hoist freed
      (hoist_available ?h)
      (not (holding ?h ?c))
    )
  )

  ;; HOIST: unload a crate from a truck (hoist takes it and becomes occupied)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (hoist_available ?h)
      (in ?c ?t)
    )
    :effect (and
      ;; crate removed from truck and hoist grabs it
      (not (in ?c ?t))
      (not (at-surface ?c ?p))
      (not (hoist_available ?h))
      (holding ?h ?c)
    )
  )

  ;; DRIVE: move a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )
)