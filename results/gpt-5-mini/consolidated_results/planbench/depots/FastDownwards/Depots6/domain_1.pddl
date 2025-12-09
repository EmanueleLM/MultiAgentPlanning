(define (domain depots-hoist-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types place pallet crate hoist truck stage)

  (:predicates
    ;; stage progression
    (now ?s - stage)
    (next ?s1 - stage ?s2 - stage)

    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-pallet ?pal - pallet ?p - place)
    (at-crate ?c - crate ?p - place)

    ;; stacking / containment
    (on-pallet ?top - crate ?pal - pallet)   ; crate on pallet
    (on-crate ?top - crate ?bottom - crate)  ; crate on crate
    (in-truck ?c - crate ?tr - truck)

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; clear flags for placement preconditions/effects
    (pallet-clear ?pal - pallet)
    (crate-clear ?c - crate)
  )

  ;; Drive a truck between places; advances the global stage by one.
  (:action drive
    :parameters (?t - truck ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
                    (now ?s)
                    (next ?s ?s2)
                    (at-truck ?t ?from)
                    (not (at-truck ?t ?to)) )
    :effect (and
              (not (at-truck ?t ?from))
              (at-truck ?t ?to)
              (not (now ?s))
              (now ?s2))
  )

  ;; Move a hoist (only when available); advances stage.
  (:action move-hoist
    :parameters (?h - hoist ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
                    (now ?s)
                    (next ?s ?s2)
                    (at-hoist ?h ?from)
                    (hoist-available ?h)
                    (not (at-hoist ?h ?to)))
    :effect (and
              (not (at-hoist ?h ?from))
              (at-hoist ?h ?to)
              (not (now ?s))
              (now ?s2))
  )

  ;; Pick a crate from a pallet (hoist must be available; crate must be clear). Advances stage.
  (:action hoist-pick-from-pallet
    :parameters (?h - hoist ?c - crate ?pal - pallet ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
                    (now ?s)
                    (next ?s ?s2)
                    (at-hoist ?h ?loc)
                    (at-pallet ?pal ?loc)
                    (on-pallet ?c ?pal)
                    (hoist-available ?h)
                    (crate-clear ?c))
    :effect (and
              (not (on-pallet ?c ?pal))
              (not (at-crate ?c ?loc))
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (pallet-clear ?pal)
              (not (now ?s))
              (now ?s2))
  )

  ;; Pick a crate from another crate (hoist must be available; crate must be clear). Advances stage.
  (:action hoist-pick-from-crate
    :parameters (?h - hoist ?top - crate ?bottom - crate ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
                    (now ?s)
                    (next ?s ?s2)
                    (at-hoist ?h ?loc)
                    (at-crate ?bottom ?loc)
                    (on-crate ?top ?bottom)
                    (hoist-available ?h)
                    (crate-clear ?top))
    :effect (and
              (not (on-crate ?top ?bottom))
              (not (at-crate ?top ?loc))
              (hoist-lifting ?h ?top)
              (not (hoist-available ?h))
              (crate-clear ?bottom)   ; bottom crate becomes clear once top removed
              (not (now ?s))
              (now ?s2))
  )

  ;; Place a hoisted crate onto a pallet at same place. Advances stage.
  (:action hoist-place-on-pallet
    :parameters (?h - hoist ?c - crate ?pal - pallet ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
                    (now ?s)
                    (next ?s ?s2)
                    (at-hoist ?h ?loc)
                    (at-pallet ?pal ?loc)
                    (pallet-clear ?pal)
                    (hoist-lifting ?h ?c))
    :effect (and
              (on-pallet ?c ?pal)
              (at-crate ?c ?loc)
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
              (not (pallet-clear ?pal))
              (crate-clear ?c)
              (not (now ?s))
              (now ?s2))
  )

  ;; Place a hoisted crate onto another crate at same place. Advances stage.
  (:action hoist-place-on-crate
    :parameters (?h - hoist ?top - crate ?bottom - crate ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
                    (now ?s)
                    (next ?s ?s2)
                    (at-hoist ?h ?loc)
                    (at-crate ?bottom ?loc)
                    (crate-clear ?bottom)
                    (hoist-lifting ?h ?top))
    :effect (and
              (on-crate ?top ?bottom)
              (at-crate ?top ?loc)
              (not (hoist-lifting ?h ?top))
              (hoist-available ?h)
              (not (crate-clear ?bottom))  ; bottom crate now has something on it
              (crate-clear ?top)
              (not (now ?s))
              (now ?s2))
  )

  ;; Load a hoisted crate into a truck at same place. Advances stage.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
                    (now ?s)
                    (next ?s ?s2)
                    (at-hoist ?h ?loc)
                    (at-truck ?tr ?loc)
                    (hoist-lifting ?h ?c))
    :effect (and
              (in-truck ?c ?tr)
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
              (not (now ?s))
              (now ?s2))
  )

  ;; Unload a crate from a truck using an available hoist at same place (hoist becomes lifting). Advances stage.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?loc - place ?s - stage ?s2 - stage)
    :precondition (and
                    (now ?s)
                    (next ?s ?s2)
                    (at-hoist ?h ?loc)
                    (at-truck ?tr ?loc)
                    (in-truck ?c ?tr)
                    (hoist-available ?h))
    :effect (and
              (not (in-truck ?c ?tr))
              (not (hoist-available ?h))
              (hoist-lifting ?h ?c)
              (not (now ?s))
              (now ?s2))
  )
)