(define (domain hoist-truck-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    depot distributor - place
    pallet crate - surface
    place surface truck hoist - object
  )

  (:predicates
    ;; location: any movable object (trucks, hoists, surfaces, crates) at a place
    (at ?obj - object ?p - place)

    ;; direct support: crate is directly on a surface (pallet or another crate)
    (on ?c - crate ?s - surface)

    ;; crate is loaded into truck
    (in ?c - crate ?t - truck)

    ;; hoist holds a crate (explicit "held by" predicate)
    (holding ?h - hoist ?c - crate)

    ;; hoist is available (not holding any crate)
    (available ?h - hoist)

    ;; surface or crate has no object directly on top of it
    (clear ?s - surface)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions belonging to hoist agents: prefix "hoist-"
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (available ?h))
      (not (on ?c ?s))
      (clear ?s)
      (not (at ?c ?p))
      ;; crate remains clear while held (no change necessary but made explicit)
      (clear ?c)
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (on ?c ?s)
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?p)
      (at ?t ?p)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (in ?c ?t)
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (available ?h)
      (at ?h ?p)
      (at ?t ?p)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (holding ?h ?c)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions belonging to truck dispatcher: prefix "truck-"
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      ;; enforce origin != destination by requiring truck not already at destination
      (not (at ?tr ?to))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )
)