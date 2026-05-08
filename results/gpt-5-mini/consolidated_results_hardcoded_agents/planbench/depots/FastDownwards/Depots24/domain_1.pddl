(define (domain logistics_hoist_driving)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    pallet crate - surface
    truck
    hoist
    stage
  )

  (:predicates
    (at-truck ?tr - truck ?p - place)        ; truck at place (exclusive per truck)
    (at-hoist  ?h  - hoist  ?p - place)      ; hoist at place
    (at-surface ?s - surface ?p - place)    ; surface (pallet or crate) at place
    (on ?c - crate ?s - surface)             ; crate immediately on surface s
    (clear ?s - surface)                     ; top of surface s is clear (nothing on it)
    (available ?h - hoist)                   ; hoist idle (not lifting)
    (lifting ?h - hoist ?c - crate)          ; hoist h is lifting crate c
    (in-truck ?c - crate ?t - truck)         ; crate is inside truck
    (connected ?p1 - place ?p2 - place)      ; movement allowed between places
    (current ?st - stage)                    ; the current global stage
    (succ ?s1 - stage ?s2 - stage)           ; discrete successor relation over stages
  )

  ;; Driver action: move truck from one place to another and advance stage.
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place ?st - stage ?stn - stage)
    :precondition (and
                    (at-truck ?tr ?from)
                    (connected ?from ?to)
                    (not (= ?from ?to))
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
              (not (current ?st))
              (current ?stn)
            )
  )

  ;; Hoist lifts a crate from a supporting surface at the hoist's place and advances stage.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (available ?h)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              ;; hoist becomes busy lifting this crate
              (lifting ?h ?c)
              (not (available ?h))
              ;; crate removed from supporting surface and no longer at the place
              (not (on ?c ?s))
              (not (at-surface ?c ?p))
              ;; supporting surface becomes clear
              (clear ?s)
              ;; advance stage
              (not (current ?st))
              (current ?stn)
            )
  )

  ;; Hoist drops the crate it is lifting onto a surface at the hoist's place; advance stage.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (clear ?s)
                    (lifting ?h ?c)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              ;; crate placed on surface S at place P
              (on ?c ?s)
              (at-surface ?c ?p)
              ;; crate is clear immediately after drop (nothing on it)
              (clear ?c)
              ;; surface S now occupied (no longer clear)
              (not (clear ?s))
              ;; hoist releases crate and becomes available
              (not (lifting ?h ?c))
              (available ?h)
              ;; advance stage
              (not (current ?st))
              (current ?stn)
            )
  )

  ;; Hoist loads a currently-lifted crate into a truck co-located at the place; advance stage.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?tr ?p)
                    (lifting ?h ?c)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              ;; crate is now inside truck
              (in-truck ?c ?tr)
              ;; hoist no longer lifts crate and becomes available
              (not (lifting ?h ?c))
              (available ?h)
              ;; crate is not at any surface/place while in truck (ensure at-surface/on facts absent)
              (not (at-surface ?c ?p))
              (not (on ?c ?tr))
              ;; advance stage
              (not (current ?st))
              (current ?stn)
            )
  )

  ;; Hoist unloads a crate from truck into its gripper (crate becomes lifted); advance stage.
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?tr ?p)
                    (available ?h)
                    (in-truck ?c ?tr)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              ;; crate removed from truck and hoist takes it (crate suspended)
              (lifting ?h ?c)
              (not (in-truck ?c ?tr))
              ;; hoist is now busy
              (not (available ?h))
              ;; ensure crate not considered at any place or on any surface
              (not (at-surface ?c ?p))
              (not (on ?c ?tr))
              ;; advance stage
              (not (current ?st))
              (current ?stn)
            )
  )

)