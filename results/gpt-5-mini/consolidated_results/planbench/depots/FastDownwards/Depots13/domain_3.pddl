(define (domain depots13)
  (:requirements :strips :typing :negative-preconditions)
  (:types place surface crate truck hoist stage)

  (:predicates
    ;; location predicates
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)

    ;; surfaces and their placement
    (surface-at ?s - surface ?p - place)     ; static surface (pallet) at a place
    (surface-of ?s - surface ?c - crate)     ; top surface s belongs to crate c

    ;; stacking and availability
    (on ?c - crate ?s - surface)             ; crate c is on surface s
    (clear ?s - surface)                     ; surface s is clear (no crate on it)

    (hoist-free ?h - hoist)                  ; hoist is available / not holding a crate
    (hoist-attached ?h - hoist ?c - crate)   ; hoist is currently holding crate c

    (in-truck ?c - crate ?tr - truck)        ; crate is loaded in a truck

    ;; discrete stage/time progression
    (current-stage ?st - stage)
    (next ?st - stage ?st2 - stage)

    ;; place role annotations
    (is-depot ?p - place)
    (is-distributor ?p - place)
  )

  ; Drive a truck between two different places, consumes one stage
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-truck ?tr ?from)
      (not (= ?from ?to))
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ; Hoist lifts a crate from a static surface (e.g., pallet). Consumes one stage.
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?top - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (hoist-free ?h)
      (at-hoist ?h ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (surface-of ?top ?c)    ; top surface of the crate must exist
      (clear ?top)            ; crate must be clear (no crate on top)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (on ?c ?s))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      (clear ?s)              ; surface becomes clear after lift
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ; Hoist drops a crate onto a static surface (pallet). Consumes one stage.
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (at-hoist ?h ?p)
      (surface-at ?s ?p)
      (clear ?s)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (on ?c ?s)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (not (clear ?s))
      ;; the crate's top surface becomes clear (no crate above it immediately after drop)
      ;; The top surface association (surface-of ...) remains unchanged (static relation).
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ; Hoist drops a crate onto another crate (base crate is on a static support). Consumes one stage.
  (:action hoist_drop_onto_base_on_static
    :parameters (?h - hoist ?c - crate ?topC - surface ?base - crate ?topB - surface ?support - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (surface-of ?topC ?c)
      (surface-of ?topB ?base)
      (on ?base ?support)
      (surface-at ?support ?p)
      (at-hoist ?h ?p)
      (clear ?topB)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (on ?c ?topB)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (not (clear ?topB))
      ;; top surface of the placed crate (topC) becomes clear
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ; Hoist loads a crate (held by hoist) into a truck. Consumes one stage.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?top - surface ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (surface-of ?top ?c)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      ;; crate is now in truck; it is no longer on the crate top surface (if it were)
      (not (on ?c ?top))
      ;; the top surface of the crate being loaded remains clear for bookkeeping
      (clear ?top)
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ; Hoist unloads a crate from a truck into the hoist (hoist becomes attached). Consumes one stage.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (hoist-free ?h)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (in-truck ?c ?tr)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )
)