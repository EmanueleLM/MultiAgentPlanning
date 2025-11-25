(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk is immediately on a peg or on another disk
    (on ?d - disk ?p - (either peg disk))
    ;; nothing is on top of this peg or disk
    (clear ?p - (either peg disk))
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage token and successor relation
    (stage ?s - step)
    (next ?s - step ?s2 - step)
  )

  ;; Move a top disk from any place (peg or disk) onto an empty peg,
  ;; advancing the global stage token by one successor.
  (:action move-to-peg
    :parameters (?d - disk ?from - (either peg disk) ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination no longer clear, source becomes clear
      (not (clear ?to))
      (clear ?from)
      ;; advance stage token strictly (no bookkeeping shortcuts)
      (not (stage ?s))
      (stage ?s2)
    )
  )

  ;; Move a top disk from any place (peg or disk) onto the top of a (strictly) larger disk,
  ;; advancing the global stage token by one successor.
  (:action move-to-disk
    :parameters (?d - disk ?from - (either peg disk) ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (stage ?s))
      (stage ?s2)
    )
  )
)