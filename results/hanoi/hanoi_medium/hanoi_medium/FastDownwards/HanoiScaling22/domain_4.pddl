(define (domain hanoi-consistent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; immediate support relations
    (on-disk ?d - disk ?s - disk)     ; ?d is directly on disk ?s
    (on-peg ?d - disk ?p - peg)       ; ?d is directly on peg ?p

    ;; topology and availability
    (top ?d - disk)                   ; ?d has no disk on top of it (is movable)
    (peg-top ?p - peg ?d - disk)      ; ?d is the current top disk of peg ?p
    (peg-empty ?p - peg)              ; peg has no disks

    ;; size ordering: smaller ?d1 ?d2 means ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; stage/time progression (discrete steps)
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk that sits on a disk, onto an empty peg.
  (:action move_from_disk_to_empty_peg
    :parameters (?d - disk ?below - disk ?p_from - peg ?p_to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d)
      (peg-top ?p_from ?d)
      (peg-empty ?p_to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove old support relation
      (not (on-disk ?d ?below))
      ;; place on the target peg
      (on-peg ?d ?p_to)
      ;; update peg-top pointers: source's top changes from ?d to ?below
      (not (peg-top ?p_from ?d))
      (peg-top ?p_from ?below)
      ;; destination no longer empty, becomes occupied with ?d as top
      (not (peg-empty ?p_to))
      ;; ?d remains top at new location
      (top ?d)
      ;; the disk that was below now becomes top on its peg chain
      (top ?below)
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that sits on a disk, onto a non-empty peg (on top of its current top disk).
  (:action move_from_disk_to_nonempty_peg
    :parameters (?d - disk ?below - disk ?p_from - peg ?p_to - peg ?top_to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d)
      (peg-top ?p_from ?d)
      (peg-top ?p_to ?top_to)   ; destination top disk
      (top ?top_to)
      (smaller ?d ?top_to)      ; size ordering: moving disk must be smaller than destination top
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove old support relation
      (not (on-disk ?d ?below))
      ;; place on top of the destination top disk
      (on-disk ?d ?top_to)
      ;; update peg-top pointers: destination top becomes ?d
      (not (peg-top ?p_to ?top_to))
      (peg-top ?p_to ?d)
      ;; source's peg-top now refers to the disk that was below ?d
      (not (peg-top ?p_from ?d))
      (peg-top ?p_from ?below)
      ;; destination top disk is no longer top (has ?d above it)
      (not (top ?top_to))
      ;; the disk that was below ?d becomes top
      (top ?below)
      ;; moved disk is top
      (top ?d)
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that sits directly on a peg (the peg had exactly one disk), onto an empty peg.
  (:action move_from_peg_to_empty_peg
    :parameters (?d - disk ?p_from - peg ?p_to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?p_from)
      (top ?d)
      (peg-top ?p_from ?d)
      (peg-empty ?p_to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove from source peg
      (not (on-peg ?d ?p_from))
      ;; place on destination peg
      (on-peg ?d ?p_to)
      ;; update peg-top pointers: source becomes empty, destination top becomes ?d
      (not (peg-top ?p_from ?d))
      (peg-empty ?p_from)
      (peg-top ?p_to ?d)
      (not (peg-empty ?p_to))
      ;; moved disk remains top
      (top ?d)
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that sits directly on a peg (single disk) onto a non-empty peg (on top of its top disk).
  (:action move_from_peg_to_nonempty_peg
    :parameters (?d - disk ?p_from - peg ?p_to - peg ?top_to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?p_from)
      (top ?d)
      (peg-top ?p_from ?d)
      (peg-top ?p_to ?top_to)
      (top ?top_to)
      (smaller ?d ?top_to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove from source peg
      (not (on-peg ?d ?p_from))
      ;; place on top of destination top disk
      (on-disk ?d ?top_to)
      ;; update peg-top pointers: destination top becomes ?d, source becomes empty
      (not (peg-top ?p_to ?top_to))
      (peg-top ?p_to ?d)
      (not (peg-top ?p_from ?d))
      (peg-empty ?p_from)
      ;; destination top disk is no longer top
      (not (top ?top_to))
      ;; moved disk is top
      (top ?d)
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

)