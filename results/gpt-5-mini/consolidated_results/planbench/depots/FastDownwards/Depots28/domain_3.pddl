(define (domain crate-hoist-orchestration)
  (:requirements :strips :typing :negative-preconditions)

  ;; types: pallets and crates are surfaces; all types are objects
  (:types
    pallet crate - surface
    surface place truck hoist step - object
  )

  (:predicates
    ;; Locations
    (at-truck ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)   ;; surfaces (pallet or crate) are located at places

    ;; occupancy / stacking
    (on ?c - crate ?s - surface)            ;; crate c is on surface s (surface may be pallet or crate)
    (in-truck ?c - crate ?tr - truck)      ;; crate c is loaded in truck tr

    ;; hoist state and surface clearance
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
    (clear ?s - surface)                   ;; surface s (pallet or crate) has no crate on top

    ;; explicit discrete stage progression
    (current-stage ?t - step)
    (succ ?t1 - step ?t2 - step)
  )

  ;; Drive a truck from one place to another; consumes one stage (must follow successor).
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place ?t1 - step ?t2 - step)
    :precondition (and
      (at-truck ?tr ?from)
      (current-stage ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (current-stage ?t1))
      (current-stage ?t2)
    )
  )

  ;; Hoist lifts a crate from a surface at a place; consumes one stage.
  ;; Requires hoist at place, available, crate clear (nothing on top), crate on surface, and both surface and crate recorded at the place.
  (:action hoist-operator-lift
    :parameters (?h - hoist ?c - crate ?surf - surface ?p - place ?t1 - step ?t2 - step)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-available ?h)
      (on ?c ?surf)
      (surface-at ?surf ?p)
      (surface-at ?c ?p)
      (clear ?c)
      (current-stage ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      ;; crate removed from its supporting surface and from place while being lifted
      (not (on ?c ?surf))
      (not (surface-at ?c ?p))
      ;; hoist captures crate and becomes busy
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      ;; supporting surface becomes clear
      (clear ?surf)
      (not (current-stage ?t1))
      (current-stage ?t2)
    )
  )

  ;; Hoist drops a lifted crate onto a surface at the same place; consumes one stage.
  ;; Requires hoist at place, target surface at place and clear, and hoist currently lifting that crate.
  (:action hoist-operator-drop
    :parameters (?h - hoist ?c - crate ?surf - surface ?p - place ?t1 - step ?t2 - step)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?surf ?p)
      (clear ?surf)
      (hoist-lifting ?h ?c)
      (current-stage ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      ;; hoist releases crate and becomes available
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      ;; crate is placed on surface and recorded at place
      (on ?c ?surf)
      (surface-at ?c ?p)
      ;; crate now clear (nothing on top), surface no longer clear
      (clear ?c)
      (not (clear ?surf))
      (not (current-stage ?t1))
      (current-stage ?t2)
    )
  )

  ;; Hoist loads a lifted crate into a truck at the same place; consumes one stage.
  ;; Requires hoist at place, truck at place, and hoist currently lifting that crate.
  (:action hoist-operator-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?t1 - step ?t2 - step)
    :precondition (and
      (hoist-at ?h ?p)
      (at-truck ?tr ?p)
      (hoist-lifting ?h ?c)
      (current-stage ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      ;; crate moved into truck
      (in-truck ?c ?tr)
      ;; crate no longer recorded at the place (not on any surface)
      (not (surface-at ?c ?p))
      ;; hoist releases crate and becomes available
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (not (current-stage ?t1))
      (current-stage ?t2)
    )
  )

  ;; Hoist unloads a crate from a truck (hoist begins lifting the crate); consumes one stage.
  ;; Requires hoist at place, hoist available, crate in truck and truck at place.
  (:action hoist-operator-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?t1 - step ?t2 - step)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-available ?h)
      (in-truck ?c ?tr)
      (at-truck ?tr ?p)
      (current-stage ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      ;; crate removed from truck (lifted), hoist becomes busy lifting the crate
      (not (in-truck ?c ?tr))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
      (not (current-stage ?t1))
      (current-stage ?t2)
    )
  )
)