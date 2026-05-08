(define (domain hoist_truck_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist crate pallet stage)

  (:predicates
    ;; generic location for trucks, hoists, crates, pallets
    (at ?o - (either truck hoist crate pallet) ?p - place)

    ;; stacking: crate on a surface (surface is crate or pallet)
    (on ?c - crate ?s - (either crate pallet))

    ;; crate inside a truck
    (in ?c - crate ?t - truck)

    ;; hoist availability and what it is lifting
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; top-of-surface / top-of-crate clearance (true iff nothing sits on top)
    (clear ?x - (either crate pallet))

    ;; explicit connectivity among places
    (connected ?p1 - place ?p2 - place)

    ;; stage progression predicates
    (succ ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  ;; ACTION: hoist lifts a crate off a surface at a place and advances stage
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      (hoist_lifting ?h ?c)
      (clear ?s)
      (not (on ?c ?s))
      (not (at ?c ?p))
      (not (hoist_available ?h))
    )
  )

  ;; ACTION: hoist drops a lifting crate onto a clear surface at the same place and advances stage
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; ACTION: hoist places a lifting crate into a co-located truck and advances stage
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at ?h ?p)
      (at ?tr ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      (in ?c ?tr)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; ACTION: hoist unloads a crate from a co-located truck and starts lifting it, advancing stage
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-stage ?st)
      (succ ?st ?st2)

      (at ?h ?p)
      (at ?tr ?p)
      (hoist_available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (not (at-stage ?st))
      (at-stage ?st2)

      (hoist_lifting ?h ?c)
      (not (in ?c ?tr))
      (not (hoist_available ?h))
    )
  )

  ;; ACTION: drive a truck from one place to another and advance stage
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