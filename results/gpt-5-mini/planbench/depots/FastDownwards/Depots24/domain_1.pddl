(define (domain logistics-stacking)
  (:requirements :strips :typing)
  (:types
    place
    truck
    hoist
    surface
    pallet crate - surface
  )

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)    ; truck at place
    (at-hoist  ?h - hoist ?p - place)    ; hoist at place
    (at-surface ?s - surface ?p - place) ; surface (pallet or crate) at place (when resting)

    ;; stacking / containment
    (on ?c - crate ?s - surface)         ; crate directly on surface s
    (in-truck ?c - crate ?t - truck)     ; crate inside truck t

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; free/top status of surfaces (including crates)
    (clear ?s - surface)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Driving
  ;; Trucks may drive between any two places. No explicit
  ;; "different" predicate is required here; planners may
  ;; also apply no-op drives (harmless).
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at-truck ?tr ?from)
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Hoist primitives
  ;; - lift: hoist picks a crate from a supporting surface at the same place
  ;; - drop: hoist places its lifted crate onto a supporting surface at the same place
  ;; - load: hoist places its lifted crate into a truck that is at the same place
  ;; - unload: hoist takes a crate out of a truck (hoist becomes busy holding the crate)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (hoist-available ?h)
                  )
    :effect (and
              ;; hoist picks up the crate
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))

              ;; crate removed from support and no longer considered resting at a place
              (not (on ?c ?s))
              (not (at-surface ?c ?p))

              ;; supporting surface becomes clear
              (clear ?s)
            )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (hoist-lifting ?h ?c)
                    (clear ?s)
                  )
    :effect (and
              ;; crate now rests on surface s at place p
              (on ?c ?s)
              (at-surface ?c ?p)

              ;; surface s is no longer clear (occupied by c)
              (not (clear ?s))

              ;; the dropped crate has nothing on top immediately after drop
              (clear ?c)

              ;; hoist releases crate and becomes available
              (hoist-available ?h)
              (not (hoist-lifting ?h ?c))
            )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?t ?p)
                    (hoist-lifting ?h ?c)
                  )
    :effect (and
              ;; crate placed into truck
              (in-truck ?c ?t)

              ;; crate no longer resting at place
              (not (at-surface ?c ?p))

              ;; hoist becomes free
              (hoist-available ?h)
              (not (hoist-lifting ?h ?c))
            )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?t ?p)
                    (hoist-available ?h)
                    (in-truck ?c ?t)
                  )
    :effect (and
              ;; hoist now holds the crate (crate removed from truck)
              (hoist-lifting ?h ?c)
              (not (in-truck ?c ?t))

              ;; hoist becomes busy
              (not (hoist-available ?h))
            )
  )
)