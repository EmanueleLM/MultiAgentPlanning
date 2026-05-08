(define (domain depots_instance)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types
    place depot distributor
    surface pallet crate
    hoist truck
  )

  (:predicates
    ;; location predicates
    (at ?s - surface ?p - place)        ; surface (pallet or crate) is at place
    (truck_at ?tr - truck ?p - place)   ; truck is at place
    (hoist_at ?h - hoist ?p - place)    ; hoist is at place

    ;; stacking and containment
    (on ?c - crate ?s - surface)        ; crate directly on a surface (pallet or crate)
    (in_truck ?c - crate ?tr - truck)   ; crate is inside a truck

    ;; hoist state
    (lifting ?h - hoist ?c - crate)     ; hoist is lifting crate
    (available ?h - hoist)              ; hoist is available

    ;; surface top free
    (clear ?s - surface)                ; no crate on top of surface (pallet or crate)
  )

  ;; drive truck between places
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; lift a crate from a surface at a place using a hoist
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?c ?p)
      (at ?s ?p)
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; drop a crate from a hoist to a surface at a place
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; load a lifted crate into a truck at a place using a hoist
  (:action load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
      ;; ensure crate is no longer on any surface (if the lifted surface relation persisted)
      (not (on ?c ?tr))
    )
  )

  ;; unload a crate from a truck using a hoist (hoist starts available and then lifts the crate)
  (:action unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)