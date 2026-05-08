(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place truck hoist surface crate pallet
  )
  ;; crate and pallet are surfaces
  ;; declare subtypes: crate and pallet are both subtypes of surface
  ;; (PDDL subtype notation combined: list the subtypes with '-' and the supertype)
  (:types crate pallet - surface place truck hoist)

  (:predicates
    ;; Locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist  ?h - hoist  ?p - place)
    (at-surface ?s - surface ?p - place)   ;; a surface (pallet or crate) is resting at a place

    ;; stacking / containment
    (on ?c - crate ?s - surface)            ;; crate c is on surface s (crate or pallet)
    (in-truck ?c - crate ?tr - truck)      ;; crate is inside a truck

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
    (hoist-in-use ?h - hoist)

    ;; surface / crate clearance (nothing on top)
    (clear ?s - surface)

    ;; truck usage lock (explicit resource predicate)
    (truck-in-use ?tr - truck)

    ;; sequencing marker to enforce that Sequence A (moving crate0) completes before
    ;; hoist2 is used to unload crate1 in Sequence B (avoid hoist2 conflicts).
    (seq-a-done)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Truck action: drive
  ;; Moves a truck from one place to another.
  ;; Precondition enforces the truck is at the origin and not currently in use.
  ;; Effects update the truck location.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at-truck ?tr ?from) (not (truck-in-use ?tr)))
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Hoist actions
  ;; 1) hoist-lift: hoist picks a crate from a surface at a place; surface becomes clear.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (hoist-available ?h)
                    (at-surface ?s ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (not (hoist-in-use ?h))
                  )
    :effect (and
              ;; crate removed from that surface/place
              (not (on ?c ?s))
              (not (at-surface ?c ?p))
              ;; hoist becomes occupied and lifts the crate
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (hoist-in-use ?h)
              ;; the underlying surface becomes clear
              (clear ?s)
            )
  )

  ;; 2) hoist-load: hoist places its currently-lifted crate into a truck at the same place.
  ;; Under the assumed semantics, loading finishes the hoist use (hoist becomes available).
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (hoist-lifting ?h ?c)
                    (at-truck ?tr ?p)
                  )
    :effect (and
              (in-truck ?c ?tr)
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
              (not (hoist-in-use ?h))
            )
  )

  ;; 3) hoist-unload (general): hoist removes a crate from a truck and begins lifting it.
  ;; This makes the hoist occupied and unavailable until a subsequent hoist-drop.
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (hoist-available ?h)
                    (at-truck ?tr ?p)
                    (in-truck ?c ?tr)
                    (not (hoist-in-use ?h))
                  )
    :effect (and
              (not (in-truck ?c ?tr))
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (hoist-in-use ?h)
            )
  )

  ;; 3b) hoist-unload specialized for hoist2 at depot2 that must wait for Sequence A to complete.
  ;; This action is identical in semantics to hoist-unload but includes seq-a-done as a required precondition.
  ;; Using a specialized action with the constant hoist2 prevents the planner from using hoist2 to unload
  ;; crate1 (or any crate) before Sequence A has been completed.
  (:action hoist-unload-hoist2
    :parameters (?c - crate ?tr - truck ?p - place)
    :precondition (and
                    ;; hoist2 is at depot2 in the initial state; require the hoist/truck to be at the same place
                    (at-hoist hoist2 ?p)
                    (hoist-available hoist2)
                    (at-truck ?tr ?p)
                    (in-truck ?c ?tr)
                    (not (hoist-in-use hoist2))
                    (seq-a-done)                 ;; enforce Sequence A completed before hoist2 unloads from truck
                  )
    :effect (and
              (not (in-truck ?c ?tr))
              (hoist-lifting hoist2 ?c)
              (not (hoist-available hoist2))
              (hoist-in-use hoist2)
            )
  )

  ;; 4) hoist-drop: hoist places a lifted crate onto a surface at the hoist's place.
  ;; The surface must be clear. After drop the hoist becomes available again.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (hoist-lifting ?h ?c)
                    (at-surface ?s ?p)
                    (clear ?s)
                  )
    :effect (and
              (on ?c ?s)
              (at-surface ?c ?p)
              (clear ?c)
              (hoist-available ?h)
              (not (hoist-lifting ?h ?c))
              (not (clear ?s))
              (not (hoist-in-use ?h))
            )
  )

  ;;; Utility action: declare that Sequence A (crate0 -> pallet0) is complete.
  ;;; This action must be applied after crate0 has been placed on pallet0 and
  ;;; is used to gate hoist2 usage in Sequence B (avoid hoist2 conflict).
  (:action declare-seq-a-done
    :parameters ()
    :precondition (and (on crate0 pallet0))
    :effect (seq-a-done)
  )
)