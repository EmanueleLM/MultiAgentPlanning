(define (domain hoist_truck_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types crate pallet - surface place truck hoist stage)

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - surface)
    (in ?c - crate ?tr - truck)

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; top clearance for surfaces (crate or pallet)
    (clear ?s - surface)

    ;; connectivity
    (connected ?p1 - place ?p2 - place)

    ;; discrete stage progression
    (succ ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  ;; Hoist lifts a crate off a surface at the same place and advances stage.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (at-surface ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))

      ;; crate removed from surface and place
      (not (on ?c ?s))
      (not (at-surface ?c ?p))

      ;; surface becomes clear
      (clear ?s)
    )
  )

  ;; Hoist drops the lifting crate onto a clear surface at the same place and advances stage.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (clear ?s)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      ;; place crate on surface at the place
      (on ?c ?s)
      (at-surface ?c ?p)

      ;; surface now occupied, crate top is clear
      (not (clear ?s))
      (clear ?c)

      ;; hoist becomes free
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
    )
  )

  ;; Hoist loads a lifting crate into a co-located truck and advances stage.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      (in ?c ?tr)

      ;; crate no longer at the place/surface
      (not (at-surface ?c ?p))

      ;; hoist freed
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
    )
  )

  ;; Hoist unloads a crate from a co-located truck and starts lifting it, advancing stage.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (hoist-available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      (hoist-lifting ?h ?c)
      (not (in ?c ?tr))
      (not (hoist-available ?h))

      ;; crate is lifted (not placed on any surface / not at place)
      (not (at-surface ?c ?p))
    )
  )

  ;; Drive a truck from one place to another and advance stage.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at-truck ?tr ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      (at-truck ?tr ?to)
      (not (at-truck ?tr ?from))
    )
  )
)