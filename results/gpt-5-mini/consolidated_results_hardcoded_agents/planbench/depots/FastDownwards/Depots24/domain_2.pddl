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
    (at-truck ?tr - truck ?p - place)
    (at-hoist  ?h  - hoist  ?p - place)
    (at-surface ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in-truck ?c - crate ?t - truck)
    (connected ?p1 - place ?p2 - place)
    (current ?st - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Drive a truck from one place to another and advance the global stage.
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place ?st - stage ?stn - stage)
    :precondition (and
                    (at-truck ?tr ?from)
                    (connected ?from ?to)
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

  ;; Hoist lifts a crate from a supporting surface at the hoist's place and advance stage.
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
              (lifting ?h ?c)
              (not (available ?h))
              (not (on ?c ?s))
              (not (at-surface ?c ?p))
              (clear ?s)
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
              (on ?c ?s)
              (at-surface ?c ?p)
              (clear ?c)
              (not (clear ?s))
              (not (lifting ?h ?c))
              (available ?h)
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
              (in-truck ?c ?tr)
              (not (lifting ?h ?c))
              (available ?h)
              (not (at-surface ?c ?p))
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
              (lifting ?h ?c)
              (not (in-truck ?c ?tr))
              (not (available ?h))
              (not (at-surface ?c ?p))
              (not (current ?st))
              (current ?stn)
            )
  )

)