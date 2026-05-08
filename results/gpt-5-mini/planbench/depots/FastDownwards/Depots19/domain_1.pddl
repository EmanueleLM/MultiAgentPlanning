(define (domain depots-hoist-truck)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place
    surface
    depot distributor - place
    pallet crate - surface
    hoist truck
  )

  (:predicates
    ;; Locations
    (hoist-at ?h - hoist ?p - place)
    (truck-at ?t - truck ?p - place)
    (surface-at ?s - surface ?p - place)   ;; a surface (pallet or crate) is located at a place

    ;; Stacking and loads
    (on ?c - crate ?s - surface)            ;; crate c is directly on surface s
    (in-truck ?c - crate ?t - truck)       ;; crate c is in truck t

    ;; Hoist state
    (hoist-lifting ?h - hoist ?c - crate)  ;; hoist h holds crate c
    (hoist-available ?h - hoist)           ;; hoist h is available to start a lift/unload

    ;; Surface state
    (clear ?s - surface)                   ;; nothing (no crate) is on surface s

    ;; Roads (connectivity)
    (road ?p - place ?q - place)
  )

  ;; Truck driving (agent: truck_driver)
  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck-at ?tr ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; Hoist actions (agent: hoist_operator)

  ;; Lift a crate from a surface at a place: hoist picks up the crate
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (surface-at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-lifting ?h ?c)
      (clear ?s)                     ;; the supporting surface becomes clear
      (not (hoist-available ?h))
      (not (on ?c ?s))
      (not (surface-at ?c ?p))       ;; crate is no longer considered placed at the location while being lifted
    )
  )

  ;; Drop a held crate onto a target surface at a place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-lifting ?h ?c)
      (surface-at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (surface-at ?c ?p)             ;; crate is now at the place on the target surface
      (hoist-available ?h)
      (clear ?c)
      (not (hoist-lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; Load a held crate into a truck at the same place
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (not (surface-at ?c ?p))       ;; crate is no longer associated with the place when inside the truck
      ;; crate remains clear while in truck (no changes to clear are needed here)
    )
  )

  ;; Unload a crate from a truck into the hoist (hoist starts lifting the crate at the place)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (in-truck ?c ?t)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-lifting ?h ?c)
      (surface-at ?c ?p)             ;; crate is associated with the place while hoist holds it
      (not (in-truck ?c ?t))
      (not (hoist-available ?h))
    )
  )
)