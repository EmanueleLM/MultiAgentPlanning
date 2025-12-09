(define (domain crate-hoist-orchestration)
  (:requirements :strips :typing :negative-preconditions)

  ;; types
  (:types
    pallet crate - surface
    surface place truck hoist step - object
  )

  (:predicates
    ;; Locations
    (at-truck ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; occupancy / stacking
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?tr - truck)

    ;; hoist state and surface clearance
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
    (clear ?s - surface)

    ;; explicit discrete stage progression
    (current-stage ?t - step)
    (succ ?t1 - step ?t2 - step)
  )

  ;; Drive a truck from one place to another; advances one stage.
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

  ;; Hoist lifts a crate from a surface at a place; advances one stage.
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
      (not (on ?c ?surf))
      (not (surface-at ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (clear ?surf)
      (not (current-stage ?t1))
      (current-stage ?t2)
    )
  )

  ;; Hoist drops a lifted crate onto a surface at the same place; advances one stage.
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
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (on ?c ?surf)
      (surface-at ?c ?p)
      (clear ?c)
      (not (clear ?surf))
      (not (current-stage ?t1))
      (current-stage ?t2)
    )
  )

  ;; Hoist loads a lifted crate into a truck at the same place; advances one stage.
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
      (in-truck ?c ?tr)
      (not (surface-at ?c ?p))
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (not (current-stage ?t1))
      (current-stage ?t2)
    )
  )

  ;; Hoist unloads a crate from a truck (hoist begins lifting the crate); advances one stage.
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
      (not (in-truck ?c ?tr))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
      (not (current-stage ?t1))
      (current-stage ?t2)
    )
  )
)