(define (domain logistics-stacking)
  ;; Domain: logistics with hoists, trucks, pallets and stackable crates.
  ;; Integrates driver, hoist and planner analyses.
  ;; Actions kept distinct by agent perspective: driver-drive*, hoist-*
  (:requirements :strips :typing)
  (:types
    place
    truck
    hoist
    surface
    pallet crate - surface
  )

  (:predicates
    ;; Locations
    (at-truck ?tr - truck ?p - place)        ; truck at a place
    (at-hoist  ?h - hoist  ?p - place)       ; hoist at a place
    (at-surface ?s - surface ?p - place)    ; surface (pallet or crate) at a place
    (at-crate  ?c - crate ?p - place)        ; crate at a place (when resting on a surface)

    ;; Stacking / containment
    (on ?c - crate ?s - surface)             ; crate c directly on surface s
    (in-truck ?c - crate ?t - truck)         ; crate c stored in truck t

    ;; Hoist state
    (hoist-available ?h - hoist)             ; hoist is free
    (hoist-lifting ?h - hoist ?c - crate)    ; hoist h is currently holding crate c

    ;; Surface/crate free/top status
    (clear ?s - surface)                     ; no crate on surface s (s may be crate or pallet)

    ;; Simple inequality predicate for places to prevent no-op drives
    (different ?p1 - place ?p2 - place)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Driver actions (driver perspective)
  ;; driver-drive moves a truck between two distinct places.
  ;; Effects are explicit and limited to truck location only.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
                    (at-truck ?tr ?from)
                    (different ?from ?to)
                  )
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Hoist actions (hoist operator perspective)
  ;; All effects that were implicit in the analyses are made explicit:
  ;; - lifting removes at/on facts for the crate;
  ;; - drop adds on/at and updates clear predicates;
  ;; - load/unload move crates into/out-of trucks and update hoist state.
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
              ;; hoist holds the crate
              (hoist-lifting ?h ?c)
              ;; supporting surface becomes clear (explicit)
              (clear ?s)

              ;; crate is no longer on its supporting surface or at the place
              (not (on ?c ?s))
              (not (at-crate ?c ?p))

              ;; hoist no longer available
              (not (hoist-available ?h))
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
              (at-crate ?c ?p)

              ;; hoist becomes free
              (hoist-available ?h)

              ;; the dropped crate has nothing on it immediately after drop
              (clear ?c)

              ;; hoist no longer holding crate
              (not (hoist-lifting ?h ?c))

              ;; surface s is no longer clear because c sits on it
              (not (clear ?s))
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
              ;; crate moved into truck
              (in-truck ?c ?t)

              ;; hoist becomes free
              (hoist-available ?h)

              ;; hoist no longer holding the crate
              (not (hoist-lifting ?h ?c))

              ;; ensure crate is not simultaneously considered at a place
              (not (at-crate ?c ?p))
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
              ;; hoist now holds crate c (crate removed from truck)
              (hoist-lifting ?h ?c)

              ;; crate no longer in truck
              (not (in-truck ?c ?t))

              ;; hoist no longer available
              (not (hoist-available ?h))
            )
  )

)