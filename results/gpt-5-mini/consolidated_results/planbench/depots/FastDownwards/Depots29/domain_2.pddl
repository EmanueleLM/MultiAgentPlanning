(define (domain depots-hoist)
  :requirements :strips :typing :negative-preconditions
  :types
    place truck hoist pallet crate stage
  :predicates
    (at ?x - (either truck hoist pallet crate) ?p - place)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in-truck ?c - crate ?t - truck)
    (on ?c - crate ?s - (either pallet crate))
    (clear ?s - (either pallet crate))
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
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?pl - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?pl)
      (at ?s ?pl)
      (on ?c ?s)
      (at ?c ?pl)
      (clear ?c)
      (available ?h)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      (not (at ?c ?pl))
      (not (on ?c ?s))
      (not (available ?h))
      (lifting ?h ?c)
      (clear ?s)
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?srf - (either pallet crate) ?pl - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?pl)
      (at ?srf ?pl)
      (clear ?srf)
      (lifting ?h ?c)
      (stage ?c ?st1)
      (next ?st1 ?st2)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (on ?c ?srf)
      (at ?c ?pl)
      (not (clear ?srf))
      (clear ?c)
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

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
      (in-truck ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

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
      (not (in-truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )

  (:action hoist-place-on-target-pallet
    :parameters (?h - hoist ?c - crate ?pallet - pallet ?pl - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at ?h ?pl)
      (at ?pallet ?pl)
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
      (at ?c ?pl)
      (not (clear ?pallet))
      (clear ?c)
      (not (stage ?c ?st1))
      (stage ?c ?st2)
    )
  )
)