(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on another disk
    (on-disk ?d - disk ?d2 - disk)

    ;; support objects top/empty flags
    (clear-peg ?p - peg)   ;; peg has no disk directly on it
    (clear-disk ?d - disk) ;; disk has no disk directly on top of it

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete stage/time modeling
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Move a top disk from a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)       ;; disk is directly on source peg
      (clear-disk ?d)         ;; disk is top of its source
      (clear-peg ?to)         ;; destination peg is empty (no direct disk)
      (stage ?s)
      (stage ?s2)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update clear/top facts
      (not (clear-peg ?to))   ;; destination peg no longer empty
      (clear-peg ?from)       ;; source peg becomes empty
      (clear-disk ?d)         ;; moved disk is top at destination

      ;; if there was a disk under ?d on the source peg, it would have been represented
      ;; as on-disk and handled by different actions; here source was a peg, so nothing else

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a peg onto a top disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?target - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)       ;; disk is directly on the source peg
      (clear-disk ?d)         ;; disk is top of its source
      (clear-disk ?target)    ;; target disk is top (available to receive)
      (smaller ?d ?target)    ;; size ordering
      (stage ?s)
      (stage ?s2)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?target)

      ;; update clear/top facts
      (not (clear-disk ?target)) ;; target now has disk on top
      (clear-peg ?from)          ;; source peg becomes empty
      (clear-disk ?d)            ;; moved disk is top at destination

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from on top of a disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)      ;; disk is directly on source disk
      (clear-disk ?d)         ;; disk is top of its source
      (clear-peg ?to)         ;; destination peg is empty
      (stage ?s)
      (stage ?s2)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; update clear/top facts
      (not (clear-peg ?to))   ;; destination peg no longer empty
      (clear-disk ?from)      ;; source disk becomes clear (no disk on top)
      (clear-disk ?d)         ;; moved disk is top at destination

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from on top of a disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?target - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)      ;; disk is directly on source disk
      (clear-disk ?d)         ;; disk is top of its source
      (clear-disk ?target)    ;; target disk is top (available to receive)
      (smaller ?d ?target)    ;; size ordering
      (stage ?s)
      (stage ?s2)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?target)

      ;; update clear/top facts
      (not (clear-disk ?target)) ;; target now has disk on top
      (clear-disk ?from)         ;; source disk becomes clear
      (clear-disk ?d)            ;; moved disk is top at destination

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)