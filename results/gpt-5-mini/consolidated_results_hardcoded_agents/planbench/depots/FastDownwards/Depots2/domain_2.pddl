(define (domain depots_orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor - place
    truck hoist - object
    pallet crate - object
    stage
  )

  (:predicates
    ;; locations
    (truck-at ?t - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (pallet-at ?p - pallet ?pl - place)
    (crate-at ?c - crate ?pl - place)

    ;; stacking relations
    (on-pallet ?c - crate ?p - pallet)
    (on-crate ?c - crate ?c2 - crate)

    ;; clearance of surfaces
    (clear-pallet ?p - pallet)
    (clear-crate ?c - crate)

    ;; hoist and truck load state
    (hoist-free ?h - hoist)
    (hoist-attached ?h - hoist ?c - crate)
    (in-truck ?c - crate ?t - truck)

    ;; discrete linear stage token and successor relation
    (stage-ready ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; DRIVER: move a truck from one place to another, advancing stage
  (:action driver_drive
    :parameters (?t - truck ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (truck-at ?t ?from)
      (stage-ready ?s)
      (succ ?s ?s2)
      (not (truck-at ?t ?to))
    )
    :effect (and
      (not (truck-at ?t ?from))
      (truck-at ?t ?to)
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST: move hoist between places; can carry attachment state unchanged
  (:action hoist_move
    :parameters (?h - hoist ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-at ?h ?from)
      (stage-ready ?s)
      (succ ?s ?s2)
      (not (hoist-at ?h ?to))
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST LIFT from a pallet: hoist at same place, pallet at place, crate on that pallet, crate clear, hoist free
  (:action hoist_lift_from_pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-at ?h ?loc)
      (pallet-at ?p ?loc)
      (on-pallet ?c ?p)
      (clear-crate ?c)
      (hoist-free ?h)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-pallet ?c ?p))
      (not (crate-at ?c ?loc))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      (clear-pallet ?p)
      (clear-crate ?c)
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST LIFT from a crate: require that the supporting crate is at the same place
  (:action hoist_lift_from_crate
    :parameters (?h - hoist ?c - crate ?below - crate ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-at ?h ?loc)
      (on-crate ?c ?below)
      (crate-at ?below ?loc)
      (clear-crate ?c)
      (hoist-free ?h)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-crate ?c ?below))
      (not (crate-at ?c ?loc))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      (clear-crate ?below)
      (clear-crate ?c)
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST DROP to a pallet: hoist at same place, pallet at place, pallet clear, hoist attached to crate
  (:action hoist_drop_to_pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (hoist-at ?h ?loc)
      (pallet-at ?p ?loc)
      (clear-pallet ?p)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (on-pallet ?c ?p)
      (crate-at ?c ?loc)
      (not (clear-pallet ?p))
      (clear-crate ?c)
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST DROP to a crate: hoist attached and colocated, below crate must be at same place and clear
  (:action hoist_drop_to_crate
    :parameters (?h - hoist ?c - crate ?below - crate ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (hoist-at ?h ?loc)
      (crate-at ?below ?loc)
      (clear-crate ?below)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (on-crate ?c ?below)
      (crate-at ?c ?loc)
      (clear-crate ?c)
      (not (clear-crate ?below))
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST LOAD into truck: hoist attached and co-located with truck; crate moves into truck and hoist becomes free
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (hoist-at ?h ?loc)
      (truck-at ?t ?loc)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (hoist-attached ?h ?c))
      (in-truck ?c ?t)
      (not (crate-at ?c ?loc))
      (hoist-free ?h)
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )

  ;; HOIST UNLOAD from truck: hoist free and co-located with truck; crate removed from truck and hoist becomes attached to it
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
      (hoist-at ?h ?loc)
      (truck-at ?t ?loc)
      (hoist-free ?h)
      (in-truck ?c ?t)
      (stage-ready ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      (not (crate-at ?c ?loc))
      (not (stage-ready ?s))
      (stage-ready ?s2)
    )
  )
)