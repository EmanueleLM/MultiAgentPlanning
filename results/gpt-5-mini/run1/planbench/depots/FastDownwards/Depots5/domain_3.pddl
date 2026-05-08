(define (domain hoist-truck-multiagent)
  (:requirements :strips :typing)
  (:types
    obj place truck hoist crate pallet - obj
  )

  (:predicates
    (at ?o - obj ?p - place)        ; trucks, hoists, crates, pallets can be at places
    (road ?p - place ?q - place)
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
    (on ?c - crate ?s - obj)       ; crate on pallet or on another crate
    (clear ?x - obj)               ; true when there is nothing on the object
  )

  ;; Drive a truck from one place to another (truck must be at origin)
  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Lift a crate from a surface (pallet or crate) at a place with a hoist
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (on ?c ?s)
      (at ?s ?p)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (available ?h))
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (at ?c ?p))
      (clear ?s)
    )
  )

  ;; Lift a crate that is directly on the ground/place (not on another surface)
  (:action hoist-lift-from-place
    :parameters (?h - hoist ?c - crate ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (available ?h))
      (holding ?h ?c)
      (not (at ?c ?p))
    )
  )

  ;; Load a held crate into a truck at the same place
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (holding ?h ?c)
    )
    :effect (and
      (in ?c ?t)
      (not (holding ?h ?c))
      (available ?h)
    )
  )

  ;; Unload a crate from a truck into the hoist (hoist becomes busy and holds the crate)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (holding ?h ?c)
      (not (available ?h))
    )
  )

  ;; Drop a held crate onto a surface at the same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )
)