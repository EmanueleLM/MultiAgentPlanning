(define (domain depots27)
  (:requirements :strips :typing :negative-preconditions)
  (:types place surface pallet crate hoist truck stage)
  (:predicates
    ;; location predicates
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at ?s - surface ?p - place)               ; surface (pallet or crate) located at place

    ;; spatial relations among surfaces/crates
    (on ?c - crate ?s - surface)               ; crate c is directly on surface s

    ;; top-of-surface clearance
    (clear ?s - surface)                       ; surface/ crate has nothing on top

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; crate in truck
    (in-truck ?c - crate ?tr - truck)

    ;; discrete-stage control
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
      ;; crate is no longer on the surface or at the place; hoist lifts it and becomes unavailable
      (not (on ?c ?surf))
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      ;; the surface becomes clear after removing the crate
      (clear ?surf)
      ;; advance stage
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
      ;; hoist becomes available and no longer lifting; crate is placed on surface and at place
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?surf))
      (clear ?c)
      (on ?c ?surf)
      ;; advance stage
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  ;; Hoist loads a crate into a truck at a place (crate is being loaded while lifted)
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
      ;; crate ends up in the truck, hoist becomes available, and stops lifting it
      (in-truck ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      ;; crate is not at the place anymore while inside truck
      (not (at ?c ?p))
      ;; advance stage
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  ;; Hoist unloads a crate from a truck at a place (hoist will start lifting the crate)
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
      ;; crate removed from truck and hoist starts lifting it and becomes unavailable
      (not (in-truck ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
      ;; advance stage
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )
)