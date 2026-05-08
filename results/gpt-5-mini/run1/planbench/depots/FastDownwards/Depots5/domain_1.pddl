(define (domain hoist-truck-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types
    obj place
    truck hoist crate pallet - obj
  )
  (:predicates
    ;; Location of any entity (trucks, hoists, crates, pallets)
    (at ?o - obj ?p - place)

    ;; Road connectivity (bidirectional edges will be instantiated in problem)
    (road ?p - place ?q - place)

    ;; Hoist state
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)

    ;; Crate inside truck
    (in ?c - crate ?t - truck)

    ;; Support relationships: crate on pallet or crate on crate (s can be crate or pallet)
    (on ?c - crate ?s - obj)

    ;; Clear surface or top-of-stack marker (applies to pallets and crates)
    (clear ?x - obj)

    ;; Reservation lock on a crate while it is being manipulated (prevents concurrent lifts)
    (reserved ?c - crate)

    ;; Helper flag: true when any hoist that is located at a place is currently holding some crate
    ;; (Used to prevent trucks departing while a co-located hoist is mid-hold)
    (hoist-holding-at ?p - place)

    ;; Allowed place marker (drives only allowed between places marked allowed)
    (place-allowed ?p - place)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Truck driver action namespace: truck-drive
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (place-allowed ?from)
      (place-allowed ?to)
      (road ?from ?to)
      (not (hoist-holding-at ?from))    ;; do not depart while a hoist at 'from' is holding a crate
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Hoist operator action namespace: lift/load/unload/drop
  ;; Two lift variants: from a supporting surface, and from direct place
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Lift a crate that is sitting on some supporting object (another crate or a pallet).
  ;; Removes the on relation and marks the support clear.
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (on ?c ?s)
      (at ?s ?p)
      (available ?h)
      (clear ?c)
      (not (reserved ?c))
    )
    :effect (and
      (not (available ?h))
      (holding ?h ?c)
      (reserved ?c)
      (not (on ?c ?s))
      (clear ?s)
      (not (at ?c ?p))
      (hoist-holding-at ?p)
    )
  )

  ;; Lift a crate that is directly on the place (no explicit support surface)
  (:action hoist-lift-from-place
    :parameters (?h - hoist ?c - crate ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (available ?h)
      (clear ?c)
      (not (reserved ?c))
    )
    :effect (and
      (not (available ?h))
      (holding ?h ?c)
      (reserved ?c)
      (not (at ?c ?p))
      (hoist-holding-at ?p)
    )
  )

  ;; Load: hoist that is holding a crate places it into a truck co-located at the same place.
  ;; After load, hoist becomes available, holding ends, crate is in truck, and reservation cleared.
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
      (not (hoist-holding-at ?p))
      (not (reserved ?c))
    )
  )

  ;; Unload: hoist (available) removes a crate from a truck and begins holding it.
  ;; Hoist becomes not available and crate is reserved while being held.
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
      (reserved ?c)
      (hoist-holding-at ?p)
    )
  )

  ;; Drop: hoist that is holding a crate places it onto a clear surface (pallet or crate) co-located.
  ;; After drop, crate is at place and on the surface; the hoist becomes available and reservation cleared.
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
      (not (hoist-holding-at ?p))
      (not (reserved ?c))
    )
  )
)