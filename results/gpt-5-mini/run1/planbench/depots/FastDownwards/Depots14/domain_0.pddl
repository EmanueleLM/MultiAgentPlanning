(define (domain hoist-truck-domain)
  (:requirements :strips :typing)
  (:types place truck hoist surface)

  (:predicates
    ;; object classifications (surfaces include both pallets and crates)
    (crate ?s - surface)
    (pallet ?s - surface)

    ;; locations
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)  ;; a pallet or crate is located at a place

    ;; stacking / containment
    (on ?c - surface ?s - surface)        ;; c (crate) is directly on surface s (crate or pallet)
    (in-truck ?c - surface ?t - truck)   ;; crate is inside a truck

    ;; surface and resource state
    (clear ?s - surface)                 ;; nothing is on the surface
    (available ?h - hoist)               ;; hoist is free
    (lifting ?h - hoist ?c - surface)    ;; hoist is currently lifting crate c
  )

  ;; drive: truck movement (does not change crate containment)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at-truck ?tr ?from)
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; hoist_lift: hoist lifts a crate from a surface at the same place
  (:action hoist_lift
    :parameters (?h - hoist ?c - surface ?surf - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?surf ?p)
      (on ?c ?surf)
      (available ?h)
      (clear ?c)                         ;; crate must be clear (nothing on it)
    )
    :effect (and
      (not (on ?c ?surf))
      (not (at-surface ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?surf)
    )
  )

  ;; hoist_load: hoist places the lifted crate into a co-located truck (frees hoist)
  (:action hoist_load
    :parameters (?h - hoist ?c - surface ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (lifting ?h ?c))
      (available ?h)
    )
  )

  ;; hoist_unload: hoist picks a crate out of a truck at the hoist's place (consumes available)
  (:action hoist_unload
    :parameters (?h - hoist ?c - surface ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (available ?h)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
    )
  )

  ;; hoist_drop: hoist places currently-lifted crate onto a surface at same place (frees hoist)
  (:action hoist_drop
    :parameters (?h - hoist ?c - surface ?surf - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?surf ?p)
      (lifting ?h ?c)
      (clear ?surf)
    )
    :effect (and
      (on ?c ?surf)
      (at-surface ?c ?p)
      (clear ?c)
      (not (lifting ?h ?c))
      (available ?h)
      (not (clear ?surf))
    )
  )
)