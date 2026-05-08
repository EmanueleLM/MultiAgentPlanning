(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ; placement at a specific stage
    (on-peg ?d - disk ?p - peg ?s - stage)        ; ?d directly on peg ?p at stage ?s
    (on-disk ?d - disk ?below - disk ?s - stage) ; ?d directly on top of ?below at stage ?s

    ; top-of-peg at a specific stage
    (top ?d - disk ?p - peg ?s - stage)

    ; peg emptiness at a specific stage
    (empty ?p - peg ?s - stage)

    ; size ordering (static)
    (smaller ?d1 - disk ?d2 - disk)

    ; ordered stages (static)
    (succ ?s - stage ?s2 - stage)
  )

  ; -------------------------
  ; Move actions advance from one stage to the successor stage.
  ; Each action requires that the current stage is succeeded by the next stage (succ ?s ?s2),
  ; and makes only the minimal, causally required changes between ?s and ?s2:
  ; - removes the moved-disk's placement/top at ?s and establishes its new placement/top at ?s2
  ; - updates top/empty relations for the source and target pegs when those are directly affected
  ; Other disks' placements at ?s are not changed by a move action; a correct plan must ensure
  ; that every stage reached has a complete, consistent configuration (i.e., moves must be chained
  ; so the planner produces a full sequence of stage-advancing moves).
  ; -------------------------

  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (succ ?s ?s2)
      (top ?d ?from ?s)
      (on-peg ?d ?from ?s)
      (empty ?to ?s)
    )
    :effect (and
      ; remove old placement and top at source stage
      (not (on-peg ?d ?from ?s))
      (not (top ?d ?from ?s))

      ; new placement and top at successor stage
      (on-peg ?d ?to ?s2)
      (top ?d ?to ?s2)

      ; the target peg is no longer empty at successor stage
      (not (empty ?to ?s2))

      ; the source peg becomes empty at successor stage (disk was directly on peg)
      (empty ?from ?s2)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (succ ?s ?s2)
      (top ?d ?from ?s)
      (on-peg ?d ?from ?s)
      (top ?below ?to ?s)
      (smaller ?d ?below)
    )
    :effect (and
      ; remove old placement/top at source stage
      (not (on-peg ?d ?from ?s))
      (not (top ?d ?from ?s))

      ; place onto disk at successor stage and update tops
      (on-disk ?d ?below ?s2)
      (top ?d ?to ?s2)
      (not (top ?below ?to ?s2))

      ; source peg becomes empty at successor stage
      (empty ?from ?s2)
    )
  )

  (:action move-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (succ ?s ?s2)
      (top ?d ?from ?s)
      (on-disk ?d ?below ?s)
      (empty ?to ?s)
    )
    :effect (and
      ; remove old on-disk/top at source stage
      (not (on-disk ?d ?below ?s))
      (not (top ?d ?from ?s))

      ; below disk becomes top on source peg at successor stage
      (top ?below ?from ?s2)

      ; place moved disk on target peg at successor stage
      (on-peg ?d ?to ?s2)
      (top ?d ?to ?s2)
      (not (empty ?to ?s2))
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?above - disk ?s - stage ?s2 - stage)
    :precondition (and
      (succ ?s ?s2)
      (top ?d ?from ?s)
      (on-disk ?d ?below ?s)
      (top ?above ?to ?s)
      (smaller ?d ?above)
    )
    :effect (and
      ; remove old on-disk/top at source stage
      (not (on-disk ?d ?below ?s))
      (not (top ?d ?from ?s))

      ; below disk becomes top on source peg at successor stage
      (top ?below ?from ?s2)

      ; place moved disk onto above disk at successor stage and update tops
      (on-disk ?d ?above ?s2)
      (top ?d ?to ?s2)
      (not (top ?above ?to ?s2))
    )
  )
)