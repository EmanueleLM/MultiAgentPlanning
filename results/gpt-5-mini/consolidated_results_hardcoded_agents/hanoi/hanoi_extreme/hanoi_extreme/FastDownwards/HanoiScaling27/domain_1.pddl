(define (domain hanoi_levels)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; disk at a peg/level: (at ?d ?peg ?lvl)
    (at ?d ?peg ?lvl)
    ;; current height (number of disks) of a peg: (height ?peg ?lvl)
    (height ?peg ?lvl)
    ;; successor relation on levels: (succ ?lvl1 ?lvl2) means lvl2 = lvl1 + 1
    (succ ?lvl1 ?lvl2)
    ;; sequencing of steps
    (enabled ?s)
    (step-next ?s1 ?s2)
    (last-step ?s)
    ;; size relation: larger disk than
    (larger ?x ?y)
  )

  ;; Move a top disk from a source peg to an empty target peg, when this step has a successor.
  (:action move_to_empty_next
    :parameters (?s ?d ?from ?to ?lfrom ?lfrom_prev ?lto ?next)
    :precondition (and
      (enabled ?s)
      (at ?d ?from ?lfrom)
      (succ ?lfrom_prev ?lfrom)         ; ?lfrom_prev is the new height after removing ?d
      (height ?from ?lfrom)
      (height ?to lvl0)                 ; target peg currently empty (height lvl0)
      (succ lvl0 ?lto)                  ; new target height will be ?lto (lvl1)
      (step-next ?s ?next)
    )
    :effect (and
      ;; update disk position
      (not (at ?d ?from ?lfrom))
      (at ?d ?to ?lto)
      ;; update source height: from ?lfrom -> ?lfrom_prev
      (not (height ?from ?lfrom))
      (height ?from ?lfrom_prev)
      ;; update target height: from lvl0 -> ?lto
      (not (height ?to lvl0))
      (height ?to ?lto)
      ;; advance step
      (not (enabled ?s))
      (enabled ?next)
    )
  )

  ;; Move a top disk from a source peg to an empty target peg, when this is the final step.
  (:action move_to_empty_final
    :parameters (?s ?d ?from ?to ?lfrom ?lfrom_prev ?lto)
    :precondition (and
      (enabled ?s)
      (at ?d ?from ?lfrom)
      (succ ?lfrom_prev ?lfrom)
      (height ?from ?lfrom)
      (height ?to lvl0)
      (succ lvl0 ?lto)
      (last-step ?s)
    )
    :effect (and
      (not (at ?d ?from ?lfrom))
      (at ?d ?to ?lto)
      (not (height ?from ?lfrom))
      (height ?from ?lfrom_prev)
      (not (height ?to lvl0))
      (height ?to ?lto)
      (not (enabled ?s))
    )
  )

  ;; Move a top disk from a source peg to a non-empty target peg (onto another disk), with successor.
  (:action move_onto_disk_next
    :parameters (?s ?d ?from ?to ?lfrom ?lfrom_prev ?lto_prev ?lto ?below ?next)
    :precondition (and
      (enabled ?s)
      (at ?d ?from ?lfrom)
      (succ ?lfrom_prev ?lfrom)
      (height ?from ?lfrom)
      (height ?to ?lto_prev)            ; current target height (non-zero)
      (succ ?lto_prev ?lto)             ; new target height after placing ?d
      (at ?below ?to ?lto_prev)         ; ?below is the disk currently at top of ?to
      (larger ?below ?d)                ; size constraint: below larger than d
      (step-next ?s ?next)
    )
    :effect (and
      (not (at ?d ?from ?lfrom))
      (at ?d ?to ?lto)
      (not (height ?from ?lfrom))
      (height ?from ?lfrom_prev)
      (not (height ?to ?lto_prev))
      (height ?to ?lto)
      (not (enabled ?s))
      (enabled ?next)
    )
  )

  ;; Move a top disk from a source peg to a non-empty target peg (onto another disk), final step.
  (:action move_onto_disk_final
    :parameters (?s ?d ?from ?to ?lfrom ?lfrom_prev ?lto_prev ?lto ?below)
    :precondition (and
      (enabled ?s)
      (at ?d ?from ?lfrom)
      (succ ?lfrom_prev ?lfrom)
      (height ?from ?lfrom)
      (height ?to ?lto_prev)
      (succ ?lto_prev ?lto)
      (at ?below ?to ?lto_prev)
      (larger ?below ?d)
      (last-step ?s)
    )
    :effect (and
      (not (at ?d ?from ?lfrom))
      (at ?d ?to ?lto)
      (not (height ?from ?lfrom))
      (height ?from ?lfrom_prev)
      (not (height ?to ?lto_prev))
      (height ?to ?lto)
      (not (enabled ?s))
    )
  )
)