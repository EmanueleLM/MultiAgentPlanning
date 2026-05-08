(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; occupancy relations (no explicit time-indexing on these predicates;
    ;; temporal sequencing is enforced via the current/next step control)
    (on-peg ?d - disk ?p - peg)       ;; disk directly on a peg (bottom of a stack)
    (on-disk ?d - disk ?below - disk) ;; disk directly on another disk
    (clear-peg ?p - peg)              ;; peg has no disks at all
    (clear-disk ?d - disk)            ;; disk has no disk on top of it
    (smaller ?d1 - disk ?d2 - disk)   ;; d1 strictly smaller than d2

    ;; explicit ordered stage objects to enforce sequential, contiguous moves
    (next ?s1 - step ?s2 - step)      ;; successor relation between steps
    (current ?s - step)               ;; the current (active) stage; only moves at current stage allowed
  )

  ;; Move the top disk that is alone on a peg to another empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; move disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update peg clear statuses
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; advance stage pointer (enforces sequential single moves)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move the top disk that is alone on a peg onto the top of another disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; move disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; peg becomes empty (since disk was directly on peg)
      (clear-peg ?from)

      ;; destination disk is no longer clear (it gets a disk on top)
      (not (clear-disk ?to))

      ;; advance stage pointer
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move the top disk that is on top of another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; move disk
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; the disk that supported ?d becomes clear
      (clear-disk ?below)

      ;; destination peg is no longer clear
      (not (clear-peg ?to))

      ;; advance stage pointer
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move the top disk that is on top of another disk to the top of a different disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?frombelow - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?frombelow)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; move disk
      (not (on-disk ?d ?frombelow))
      (on-disk ?d ?to)

      ;; the disk that supported ?d becomes clear
      (clear-disk ?frombelow)

      ;; destination disk is no longer clear
      (not (clear-disk ?to))

      ;; advance stage pointer
      (not (current ?s))
      (current ?s2)
    )
  )
)