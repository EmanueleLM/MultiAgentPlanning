(define (domain hoist_truck_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    crate pallet - surface
    surface
    place truck hoist stage
  )

  (:predicates
    ;; generic location for trucks, hoists, pallets, crates (crates and pallets are surfaces)
    (at ?obj - (either truck hoist surface) ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - surface)
    (in ?c - crate ?tr - truck)

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; top clearance for surfaces (applies to pallets and crates)
    (clear ?s - surface)

    ;; connectivity between places
    (connected ?p1 - place ?p2 - place)

    ;; discrete stage progression (ordered)
    (succ ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  ;; Hoist lifts a top crate off a surface at the same place and advances stage.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      ;; hoist begins lifting that specific crate
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))

      ;; crate removed from surface and place
      (not (on ?c ?s))
      (not (at ?c ?p))

      ;; the surface from which the crate was removed becomes clear on its top
      (clear ?s)
    )
  )

  ;; Hoist drops the lifting crate onto a clear surface at the same place and advances stage.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      ;; place crate on surface at the place
      (on ?c ?s)
      (at ?c ?p)

      ;; surface now occupied (top not clear), crate's top is clear
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

      (at ?h ?p)
      (at ?tr ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      ;; crate moved into truck
      (in ?c ?tr)

      ;; crate no longer at the place/surface
      (not (at ?c ?p))

      ;; hoist freed and no longer lifting
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

      (at ?h ?p)
      (at ?tr ?p)
      (hoist-available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      ;; hoist begins lifting the crate removed from truck
      (hoist-lifting ?h ?c)
      (not (in ?c ?tr))
      (not (hoist-available ?h))

      ;; crate is lifted (not placed on any surface / not at place)
      (not (at ?c ?p))
    )
  )

  ;; Drive a truck from one place to another and advance stage.
  ;; Requires truck at origin and an explicit connectivity relation.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at ?tr ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      (at ?tr ?to)
      (not (at ?tr ?from))
    )
  )
)