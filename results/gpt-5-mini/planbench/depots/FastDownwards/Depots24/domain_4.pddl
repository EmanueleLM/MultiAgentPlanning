(define (domain logistics-stacking)
  (:requirements :typing :negative-preconditions)
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
    (at-hoist  ?h  - hoist  ?p - place)  ; hoist at place
    (at-surface ?s - surface ?p - place) ; surface (pallet or crate) resting at place

    ;; stacking / containment
    (on ?c - crate ?s - surface)         ; crate directly on surface s
    (in-truck ?c - crate ?t - truck)     ; crate inside truck t

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; top/free status of surfaces (including crates)
    (clear ?s - surface)
  )

  ;; Driving action: move a truck from one place to another
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at-truck ?tr ?from)
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
            )
  )

  ;; Hoist picks a crate from a supporting surface at the same place.
  ;; Effects: hoist becomes busy lifting the crate; crate removed from surface and its place;
  ;;          supporting surface becomes clear.
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
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (not (on ?c ?s))
              (not (at-surface ?c ?p))
              (clear ?s)
            )
  )

  ;; Hoist drops its currently lifted crate onto a surface at the same place.
  ;; Effects: crate rests on surface, surface is not clear, crate becomes clear, hoist released.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (hoist-lifting ?h ?c)
                    (clear ?s)
                  )
    :effect (and
              (on ?c ?s)
              (at-surface ?c ?p)
              (not (clear ?s))
              (clear ?c)
              (hoist-available ?h)
              (not (hoist-lifting ?h ?c))
            )
  )

  ;; Hoist loads its currently lifted crate into a truck at the same place.
  ;; Effects: crate becomes in-truck, hoist released, crate no longer at place.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?t ?p)
                    (hoist-lifting ?h ?c)
                  )
    :effect (and
              (in-truck ?c ?t)
              (not (at-surface ?c ?p))
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
            )
  )

  ;; Hoist unloads a crate from a truck at the same place: hoist must be available and crate in truck.
  ;; Effects: crate removed from truck and hoist becomes busy lifting the crate.
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?t ?p)
                    (hoist-available ?h)
                    (in-truck ?c ?t)
                  )
    :effect (and
              (hoist-lifting ?h ?c)
              (not (in-truck ?c ?t))
              (not (hoist-available ?h))
            )
  )
)