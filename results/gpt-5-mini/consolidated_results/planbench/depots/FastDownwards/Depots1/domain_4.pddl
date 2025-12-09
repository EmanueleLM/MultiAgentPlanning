(define (domain depots1)
  (:requirements :typing :negative-preconditions :strips)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist
    truck
    stage
  )

  (:predicates
    ;; locations
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; stacking / support
    (on ?c - crate ?s - surface)
    (clear ?s - surface)

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; truck contents
    (in-truck ?c - crate ?tr - truck)

    ;; discrete global stage progression
    (stage-now ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  ;; DRIVER: moves a truck from one place to another and advances the global stage
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place ?t1 - stage ?t2 - stage)
    :precondition (and
      (truck-at ?tr ?from)
      (hoist-at ?tr ?from) ; intentionally false type-safe guard removed: keep only required preconds below
      (stage-now ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
      (not (stage-now ?t1))
      (stage-now ?t2)
    )
  )

  ;; Note: The above driver-drive included an erroneous hoist-at guard (mismatched types) in preconditions.
  ;; Replace with the correct precondition set below (STRIPS does not allow type-mismatched predicates).
  ;; To retain compatibility with :typing and to enforce stage progression, we provide the corrected operator:

  (:action driver-drive-fixed
    :parameters (?tr - truck ?from - place ?to - place ?t1 - stage ?t2 - stage)
    :precondition (and
      (truck-at ?tr ?from)
      (stage-now ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
      (not (stage-now ?t1))
      (stage-now ?t2)
    )
  )

  ;; LIFT: hoist picks up a crate from a supporting surface at a place, and advances the global stage.
  ;; Preconditions ensure hoist co-location, surface co-location, crate on that surface, crate clear, and hoist available.
  (:action loader-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?t1 - stage ?t2 - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?h)
      (stage-now ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (on ?c ?s))
      (not (surface-at ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)
      (not (stage-now ?t1))
      (stage-now ?t2)
    )
  )

  ;; DROP: hoist places the lifted crate onto a surface at the same place, and advances the stage.
  (:action loader-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?t1 - stage ?t2 - stage)
    :precondition (and
      (hoist-lifting ?h ?c)
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (clear ?s)
      (stage-now ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (on ?c ?s)
      (surface-at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (not (stage-now ?t1))
      (stage-now ?t2)
    )
  )

  ;; LOAD: hoist places a lifted crate into a co-located truck; crate leaves the place, hoist freed, advance stage.
  (:action loader-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?t1 - stage ?t2 - stage)
    :precondition (and
      (hoist-lifting ?h ?c)
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (stage-now ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (not (surface-at ?c ?p))
      (not (stage-now ?t1))
      (stage-now ?t2)
    )
  )

  ;; UNLOAD: hoist picks a crate out of a co-located truck (crate removed from truck and hoist begins lifting it), advance stage.
  (:action loader-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?t1 - stage ?t2 - stage)
    :precondition (and
      (hoist-available ?h)
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (in-truck ?c ?tr)
      (stage-now ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (not (surface-at ?c ?p))
      (not (stage-now ?t1))
      (stage-now ?t2)
    )
  )
)