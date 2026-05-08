(define (domain depots27)
  (:requirements :strips :typing :negative-preconditions)
  (:types place surface pallet crate hoist truck stage)

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at ?s - surface ?p - place)

    ;; stacking
    (on ?c - crate ?s - surface)

    ;; top-of-surface clearance
    (clear ?s - surface)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; crate in truck
    (in-truck ?c - crate ?tr - truck)

    ;; discrete-stage control for strict ordering
    (succ ?s1 - stage ?s2 - stage)
    (current-stage ?s - stage)
  )

  ;; Drive a truck from one place to another: consumes one stage step
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-truck ?tr ?from)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  ;; Hoist lifts a crate from a surface at a place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?surf - surface ?p - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-hoist ?h ?p)
      (at ?surf ?p)
      (on ?c ?surf)
      (available ?h)
      (clear ?c)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (on ?c ?surf))
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?surf)
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  ;; Hoist drops a crate to a surface at a place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?surf - surface ?p - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-hoist ?h ?p)
      (at ?surf ?p)
      (clear ?surf)
      (lifting ?h ?c)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?surf))
      (clear ?c)
      (on ?c ?surf)
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  ;; Hoist loads a crate into a truck at a place
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (lifting ?h ?c)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (in-truck ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  ;; Hoist unloads a crate from a truck at a place
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (available ?h)
      (in-truck ?c ?tr)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )
)