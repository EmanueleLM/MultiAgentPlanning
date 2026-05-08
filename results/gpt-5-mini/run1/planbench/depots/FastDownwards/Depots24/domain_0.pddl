(define (domain logistics-stacking)
  ;; Domain: logistics stacking with explicit hoist and driver actions
  ;; Integrated from driver, hoist, and planner analyses. All implicit effects made explicit.
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place
    object
    truck hoist crate pallet - object
  )

  ;; Predicates
  ;; at ?o ?p        : object ?o is located at place ?p (applies to trucks, hoists, crates, pallets)
  ;; on ?c ?s        : crate ?c is directly on surface ?s (s is an object that must be a pallet or crate)
  ;; in_truck ?c ?t  : crate ?c is inside truck ?t
  ;; clear ?s        : surface object ?s has nothing directly on it (eligible to receive crate)
  ;; hoist_available ?h : hoist ?h is free to start a lift/unload
  ;; hoist_holding ?h ?c : hoist ?h is currently holding crate ?c
  ;; adjacent ?p1 ?p2   : direct road from place ?p1 to place ?p2 (planner-provided connectivity)
  (:predicates
    (at ?o - object ?p - place)
    (on ?c - crate ?s - object)
    (in_truck ?c - crate ?t - truck)
    (clear ?s - object)
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)
    (adjacent ?p1 - place ?p2 - place)
  )

  ;; DRIVER actions (driver/drive-*)
  ;; drive moves a truck along an adjacent road. Crates inside the truck persist (in_truck unchanged).
  (:action driver/drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from) (adjacent ?from ?to))
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; HOIST actions (hoist/*) -- explicit bookkeeping maintained
  ;; hoist_lift: hoist picks up a crate from a supporting surface at the same place
  (:action hoist/hoist_lift
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)         ;; supporting surface (pallet or crate) is at place
      (at ?c ?p)         ;; crate is at the place
      (on ?c ?s)         ;; crate is directly on that surface
      (hoist_available ?h)
      (clear ?c)         ;; top of crate must be clear
    )
    :effect (and
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      ;; crate is no longer on the surface nor at the place while held
      (not (on ?c ?s))
      (not (at ?c ?p))
      ;; the supporting surface becomes clear after removal
      (clear ?s)
      ;; crate being held is not considered "clear at place" (remove clear to avoid stale facts)
      (not (clear ?c))
    )
  )

  ;; hoist_drop: hoist places a held crate onto a clear surface at same place
  (:action hoist/hoist_drop
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (hoist_holding ?h ?c)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (at ?c ?p)
      (on ?c ?s)
      ;; placed crate is clear on top (no crate placed on it now)
      (clear ?c)
      ;; supporting surface no longer clear
      (not (clear ?s))
    )
  )

  ;; hoist_load: hoist places a held crate into a truck (crate becomes in_truck)
  (:action hoist/hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (hoist_available ?h)
      (not (hoist_holding ?h ?c))
      ;; crate no longer at place (explicit)
      (not (at ?c ?p))
      ;; ensure crate not reported on any surface (on facts should have been deleted at lift)
      ;; (cannot delete unknown on facts here with unknown surface param; the hoist_lift action deletes on)
    )
  )

  ;; hoist_unload: hoist takes a crate out of a co-located truck (hoist starts holding the crate)
  (:action hoist/hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (hoist_holding ?h ?c)
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      ;; crate is being held so not at place (explicit)
      (not (at ?c ?p))
    )
  )

)