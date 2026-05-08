(define (domain depots)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
      pallet - surface
      crate - surface
    hoist
    truck
  )

  (:predicates
    ;; positions
    (at_truck ?tr - truck ?p - place)        ; truck location
    (at_surface ?s - surface ?p - place)    ; surface (pallet or crate) location

    ;; stacking
    (on ?c - crate ?s - surface)            ; crate c is directly on surface s
    (clear ?s - surface)                    ; nothing on top of surface s

    ;; hoist state and location
    (hoist_at ?h - hoist ?p - place)
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)   ; hoist h is currently lifting crate c

    ;; truck contents
    (in_truck ?c - crate ?t - truck)
  )

  ;; Driving a truck between places
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at_truck ?t ?from))
    :effect (and (not (at_truck ?t ?from)) (at_truck ?t ?to))
  )

  ;; Hoist lifts a crate from a surface at the same place.
  ;; Preconditions: hoist at place, crate at that place (as at_surface), crate is on surface, hoist available, crate clear.
  ;; Effects: hoist starts lifting crate, hoist becomes unavailable, crate no longer on the surface, crate no longer recorded at the place,
  ;;          and the previous surface becomes clear.
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (not (on ?c ?s))
      (not (at_surface ?c ?p))
      (clear ?s)
    )
  )

  ;; Hoist drops a lifted crate onto a surface at the same place.
  ;; Preconditions: hoist at place, surface at place, surface clear, hoist lifting the crate.
  ;; Effects: crate placed on surface, crate recorded at place, surface becomes not clear, crate becomes clear, hoist freed.
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at_surface ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (on ?c ?s)
      (at_surface ?c ?p)
      (clear ?c)
      (not (clear ?s))
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
    )
  )

  ;; Hoist loads a lifted crate into a truck at the same place.
  ;; Preconditions: hoist at place, truck at place, hoist lifting crate.
  ;; Effects: crate becomes in truck, hoist freed and no longer lifting.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at_truck ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
    )
  )

  ;; Hoist unloads a crate from a truck at the same place.
  ;; Preconditions: hoist at place, truck at place, hoist available, crate in truck.
  ;; Effects: crate removed from truck, hoist starts lifting the crate, hoist becomes unavailable.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at_truck ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
    )
  )

  ;; Optional: move a hoist between places (explicit movement for hoists).
  (:action move_hoist
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (and (hoist_at ?h ?from))
    :effect (and (not (hoist_at ?h ?from)) (hoist_at ?h ?to))
  )
)