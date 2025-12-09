(define (domain depots-hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place truck hoist stage
    surface pallet crate - surface
  )

  (:predicates
    ;; location: trucks, hoists, surfaces and crates can be located at places
    (at ?x - (either truck hoist surface crate) ?p - place)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; crate in truck
    (in-truck ?c - crate ?t - truck)

    ;; stacking/on relation: crates and pallets are surfaces
    (on ?c - crate ?s - surface)

    ;; clear means nothing is on that surface
    (clear ?s - surface)

    ;; discrete stage attached to each crate and successor relation
    (stage ?c - crate ?st - stage)
    (next ?st1 - stage ?st2 - stage)

    ;; goal assignment: which pallet is the intended final pallet for a crate
    (target-pallet ?c - crate ?p - pallet)
  )

  ;; drive: move a truck between places (crates in-truck remain in-truck)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?srf - surface ?pl - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?pl)
      (at ?srf ?pl)
      (on ?c ?srf)
      (at ?c ?pl)
      (clear ?c)
      (available ?h)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      ;; crate is removed from surface and from place; hoist becomes busy and lifts crate
      (not (on ?c ?srf))
      (not (at ?c ?pl))
      (not (available ?h))
      (lifting ?h ?c)

      ;; surface becomes clear after lift
      (clear ?srf)

      ;; stage advances for the crate
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?srf - surface ?pl - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?pl)
      (at ?srf ?pl)
      (clear ?srf)
      (lifting ?h ?c)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      ;; hoist becomes available and no longer lifts the crate
      (available ?h)
      (not (lifting ?h ?c))

      ;; crate placed on surface and located at place
      (on ?c ?srf)
      (at ?c ?pl)

      ;; surface now occupied; the crate is clear (nothing on it)
      (not (clear ?srf))
      (clear ?c)

      ;; stage advances
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

  ;; hoist loads a lifted crate into a co-located truck
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?t - truck ?c - crate ?pl - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?pl)
      (at ?t ?pl)
      (lifting ?h ?c)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      ;; crate becomes inside the truck; hoist released
      (in-truck ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))

      ;; crate is not at the place while inside truck
      (not (at ?c ?pl))

      ;; stage advances
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

  ;; hoist unloads a crate from a truck (hoist must be available and co-located with truck)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?t - truck ?c - crate ?pl - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?pl)
      (at ?t ?pl)
      (available ?h)
      (in-truck ?c ?t)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      ;; crate removed from truck and hoist becomes busy lifting it
      (not (in-truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)

      ;; crate is not yet at the place while being lifted
      (not (at ?c ?pl))

      ;; stage advances
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

  ;; hoist places a lifted crate onto its designated target pallet (used to satisfy goal)
  (:action hoist-place-on-target-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?pl)
      (at ?p ?pl)
      (lifting ?h ?c)
      (clear ?p)
      (target-pallet ?c ?p)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      ;; put crate on the target pallet and release hoist
      (available ?h)
      (not (lifting ?h ?c))
      (on ?c ?p)
      (at ?c ?pl)
      (not (clear ?p))
      (clear ?c)

      ;; stage advances
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )
)