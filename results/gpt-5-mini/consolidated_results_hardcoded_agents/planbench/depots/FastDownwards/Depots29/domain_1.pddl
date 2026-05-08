(define (domain depots-hoist)
  :requirements :strips :typing :negative-preconditions
  :types
    place thing truck hoist surface crate pallet stage
  :predicates
    (at ?x - thing ?p - place)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in-truck ?c - crate ?t - truck)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (stage ?c - crate ?st - stage)
    (next ?st1 - stage ?st2 - stage)
    (target-pallet ?c - crate ?p - pallet)
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from))
    :effect (and (not (at ?tr ?from)) (at ?tr ?to))
  )

  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (at ?c ?p)
      (clear ?c)
      (available ?h)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (not (available ?h))
      (lifting ?h ?c)
      (clear ?s)
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

  (:action hoist-drop-to-surface_from_lifted
    :parameters (?h - hoist ?c - crate ?srf - surface ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?p)
      (at ?srf ?p)
      (clear ?srf)
      (lifting ?h ?c)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (on ?c ?srf)
      (at ?c ?p)
      (not (clear ?srf))
      (clear ?c)
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

  (:action hoist-load-into-truck
    :parameters (?h - hoist ?t - truck ?c - crate ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      (in-truck ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?t - truck ?c - crate ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in-truck ?c ?t)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

  (:action hoist-place-on-target-pallet_from_lifted
    :parameters (?h - hoist ?c - crate ?pallet - pallet ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?p)
      (at ?pallet ?p)
      (lifting ?h ?c)
      (clear ?pallet)
      (target-pallet ?c ?pallet)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (on ?c ?pallet)
      (at ?c ?p)
      (not (clear ?pallet))
      (clear ?c)
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

  (:action hoist-place-on-target-pallet_from_lifted_from_truck
    :parameters (?h - hoist ?c - crate ?pallet - pallet ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?p)
      (at ?pallet ?p)
      (lifting ?h ?c)
      (clear ?pallet)
      (target-pallet ?c ?pallet)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (on ?c ?pallet)
      (at ?c ?p)
      (not (clear ?pallet))
      (clear ?c)
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )
)