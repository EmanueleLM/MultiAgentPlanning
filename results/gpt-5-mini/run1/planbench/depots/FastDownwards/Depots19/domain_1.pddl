(define (domain hoist-truck-domain)
  (:requirements :typing :strips)
  (:types place hoist truck crate pallet)

  (:predicates
    ;; locations
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-pallet ?pa - pallet ?p - place)
    (at-crate ?c - crate ?p - place)

    ;; stacking / containment
    (on-pallet ?c - crate ?pa - pallet)
    (on-crate ?c - crate ?s - crate)

    ;; free/occupancy flags (capacity-1 model)
    (clear-pallet ?pa - pallet)
    (clear-crate ?c - crate)

    ;; hoist and truck container state
    (hoist-available ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)
    (in-truck ?c - crate ?t - truck)
  )

  ;; drive a truck from a place to another place
  (:action truck-drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at-truck ?t ?from)
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; hoist: lift a crate from a pallet at a place
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-pallet ?pa ?p)
      (on-pallet ?c ?pa)
      (clear-crate ?c)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (on-pallet ?c ?pa))
      (not (hoist-available ?h))
      (clear-pallet ?pa)
      (not (at-crate ?c ?p))
    )
  )

  ;; hoist: lift a crate from another crate (stack) at a place
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-crate ?s ?p)
      (on-crate ?c ?s)
      (clear-crate ?c)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (on-crate ?c ?s))
      (not (hoist-available ?h))
      (clear-crate ?s)
      (not (at-crate ?c ?p))
    )
  )

  ;; hoist: drop a held crate onto a pallet at a place
  (:action hoist-drop-to-pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-holding ?h ?c)
      (at-pallet ?pa ?p)
      (clear-pallet ?pa)
    )
    :effect (and
      (on-pallet ?c ?pa)
      (not (hoist-holding ?h ?c))
      (hoist-available ?h)
      (not (clear-pallet ?pa))
      (at-crate ?c ?p)
      (clear-crate ?c)
    )
  )

  ;; hoist: drop a held crate onto another crate at a place
  (:action hoist-drop-to-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-holding ?h ?c)
      (at-crate ?s ?p)
      (clear-crate ?s)
    )
    :effect (and
      (on-crate ?c ?s)
      (not (hoist-holding ?h ?c))
      (hoist-available ?h)
      (not (clear-crate ?s))
      (at-crate ?c ?p)
      (clear-crate ?c)
    )
  )

  ;; hoist: load a held crate into a truck at a place
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (not (hoist-holding ?h ?c))
      (hoist-available ?h)
      (not (at-crate ?c ?p))
    )
  )

  ;; hoist: unload a crate from a truck and hold it at a place
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (in-truck ?c ?t)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (in-truck ?c ?t))
      (not (hoist-available ?h))
      (at-crate ?c ?p)
    )
  )
)