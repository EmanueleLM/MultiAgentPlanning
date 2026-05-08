; Problem: crate_stacking_problem
; Initial state chosen so agents must move crates to achieve goal:
; - crate2 must be moved to pallet3
; - crate0 must be placed on crate2 (only allowed after crate2 on pallet3)
; - crate1 must be placed on pallet2

(define (problem crate_stacking_problem)
  (:domain crate_stacking_domain)

  (:objects
    ;; agents
    ag1 ag2 - agent

    ;; crates
    crate0 crate1 crate2 - crate

    ;; pallets (only pallet2 and pallet3 are in the specification)
    pallet2 pallet3 - pallet

    ;; ground supports to hold crates initially (explicit supports)
    groundA groundB groundC - support

    ;; explicit locations where supports/pallets reside
    locA locB locC - location
  )

  (:init
    ;; Locations of supports and pallets
    (loc-of groundA locA)
    (loc-of groundB locB)
    (loc-of groundC locC)
    (loc-of pallet2 locB)
    (loc-of pallet3 locC)

    ;; Initial placements of crates on supports
    (on crate2 groundA)
    (loc-of crate2 locA)
    (clear crate2)        ; nothing on top of crate2 initially

    (on crate0 groundB)
    (loc-of crate0 locB)
    (clear crate0)

    (on crate1 groundC)
    (loc-of crate1 locC)
    (clear crate1)

    ;; Supports that currently have crates on them are not declared clear; pallets are clear initially
    (clear pallet2)
    (clear pallet3)

    ;; Agents initial locations and hand state
    (at ag1 locA)
    (handfree ag1)

    (at ag2 locB)
    (handfree ag2)
  )

  ;; The required terminal conditions (hard constraints) from the orchestrator:
  ;; - crate0 on crate2
  ;; - crate1 on pallet2
  ;; - crate2 on pallet3
  (:goal
    (and
      (on crate0 crate2)
      (on crate1 pallet2)
      (on crate2 pallet3)
    )
  )
)