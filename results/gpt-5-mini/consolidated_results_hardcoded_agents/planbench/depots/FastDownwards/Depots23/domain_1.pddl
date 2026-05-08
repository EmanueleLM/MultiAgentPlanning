(define (domain depots23)
  (:requirements :strips :typing :negative-preconditions)
  (:types place depot distributor
          surface pallet crate
          hoist truck
          phase)

  ;; Predicates
  (:predicates
    ;; positions
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)        ; surface (pallet or crate) is located at a place
    ;; stacking and ground relations
    (on ?top - surface ?bottom - surface)       ; top surface is on bottom surface
    (clear ?s - surface)                        ; nothing is on this surface
    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)             ; hoist h is currently lifting crate c
    ;; truck contents
    (in-truck ?c - crate ?tr - truck)
    ;; phase control: exactly one current phase should hold; actions advance to successor phase
    (current-phase ?ph - phase)
    (next ?ph1 - phase ?ph2 - phase)
  )

  ;; Action: hoist lifts a crate from a supporting surface at the same place.
  ;; Preconditions enforce hoist at same place as the supporting surface, supporting surface contains the crate,
  ;; hoist is available and crate is clear. Effect: crate removed from support, crate no longer has a surface-at place,
  ;; hoist becomes not available and begins lifting the crate, supporting surface becomes clear, and phase advances.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (next ?ph ?phn)
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (surface-at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; Action: hoist loads a lifted crate into a truck at the same place.
  ;; Preconditions require hoist lifting the crate and truck and hoist co-located.
  ;; Effects: crate becomes in-truck, hoist becomes available and no longer lifting, and phase advances.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (next ?ph ?phn)
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (lifting ?h ?c))
      (available ?h)
      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; Action: drive truck from one place to another.
  ;; Preconditions: truck at origin and current phase matches; effects: truck moved and phase advances.
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (next ?ph ?phn)
      (truck-at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; Action: hoist unloads a crate from a truck (hoist takes crate into its grip).
  ;; Preconditions: hoist co-located with truck, hoist available, crate in the truck, and phase ordering.
  ;; Effects: crate removed from truck, hoist becomes not available and begins lifting the crate, phase advances.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (next ?ph ?phn)
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (available ?h)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (not (available ?h))
      (lifting ?h ?c)
      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; Action: hoist drops a lifted crate onto a surface at the same place.
  ;; Preconditions: hoist lifting the crate, surface at same place and clear, and phase ordering.
  ;; Effects: crate placed on surface, surface-at updated for crate, supporting surface becomes not clear,
  ;; crate becomes clear, hoist becomes available and not lifting, and phase advances.
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (next ?ph ?phn)
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (on ?c ?s)
      (surface-at ?c ?p)
      (clear ?c)
      (not (clear ?s))
      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )
)