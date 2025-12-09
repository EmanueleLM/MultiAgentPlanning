(define (domain hanoi-6disk)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; structural stack predicates
    (on-peg ?d - disk ?p - peg)      ;; disk directly on a peg
    (on-disk ?d - disk ?below - disk) ;; disk directly on another disk (d above below)
    (in ?d - disk ?p - peg)          ;; disk is on peg ?p (peg membership)
    (top ?d - disk)                  ;; disk has nothing above it (is top of its peg)
    (empty ?p - peg)                 ;; peg has no disks
    ;; static ordering (smaller -> first arg is smaller than second arg)
    (smaller ?a - disk ?b - disk)

    ;; temporal / stage control
    (next ?s - step ?s2 - step)
    (current ?s - step)

    ;; auxiliary: ensure distinct pegs in moves
    (diff ?p - peg ?q - peg)
  )

  ;; Move a top disk that is the sole disk on its source peg to an empty target peg
  (:action move-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d)
      (on-peg ?d ?from)
      (in ?d ?from)
      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; update stack links and membership
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (in ?d ?from))
      (in ?d ?to)

      ;; source peg becomes empty (since moved disk was on-peg and top => sole)
      (empty ?from)
      ;; target peg no longer empty
      (not (empty ?to))

      ;; moved disk remains top at destination
      (top ?d)
    )
  )

  ;; Move a top disk that is the sole disk on its source peg onto another disk (target disk must be top and larger)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?topeg - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d)
      (on-peg ?d ?from)
      (in ?d ?from)
      (top ?to)
      (in ?to ?topeg)
      (smaller ?d ?to)
      (diff ?from ?topeg)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; update stack links and membership
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (not (in ?d ?from))
      (in ?d ?topeg)

      ;; source peg becomes empty
      (empty ?from)
      ;; target peg no longer empty
      (not (empty ?topeg))

      ;; update tops: target disk no longer top; moved disk becomes top
      (not (top ?to))
      (top ?d)
    )
  )

  ;; Move a top disk that is on top of another disk (has a below disk) to an empty peg
  (:action move-disk-to-empty-peg
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d)
      (on-disk ?d ?below)
      (in ?d ?from)
      (in ?below ?from)
      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove link from above-below and place onto target peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (not (in ?d ?from))
      (in ?d ?to)

      ;; target peg not empty anymore
      (not (empty ?to))

      ;; the disk below becomes top on the source peg
      (top ?below)
      ;; moved disk becomes top at destination
      (top ?d)
    )
  )

  ;; Move a top disk that is on top of another disk onto another disk (target must be top and larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?to - disk ?topeg - peg ?from - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d)
      (on-disk ?d ?below)
      (in ?d ?from)
      (in ?below ?from)
      (top ?to)
      (in ?to ?topeg)
      (smaller ?d ?to)
      (diff ?from ?topeg)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove previous below link, add new on-disk link
      (not (on-disk ?d ?below))
      (on-disk ?d ?to)

      ;; update membership
      (not (in ?d ?from))
      (in ?d ?topeg)

      ;; target peg no longer empty
      (not (empty ?topeg))

      ;; update tops: target disk no longer top, moved disk is top, below becomes top at source
      (not (top ?to))
      (top ?d)
      (top ?below)
    )
  )
)