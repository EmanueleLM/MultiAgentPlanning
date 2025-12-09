(define (domain hanoi-integrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    ;; disk directly on a support (support may be a disk or a peg)
    (on ?d - disk ?s - object)
    ;; a support (disk or peg) has nothing directly on top of it
    (clear ?x - object)
    ;; static size ordering: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage progression: next/at enforce strict ordered execution of moves
    (next ?t1 - stage ?t2 - stage)
    (at ?t - stage)
  )

  ;; Move a single top disk to an empty peg, advancing from stage ?t to its successor ?t2.
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)     ;; disk is directly on the source support
      (clear ?d)        ;; disk has no disk on top (is top-of-stack)
      (clear ?to)       ;; destination peg is empty on top (no disk directly on it)
      (at ?t)           ;; current global stage is ?t
      (next ?t ?t2)     ;; enforce successor stage explicitly
      (not (on ?d ?to)) ;; forbid no-op moves to the same support
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination now has something on top -> not clear
      (not (clear ?to))
      ;; source support becomes clear (the moved disk was top)
      (clear ?from)
      ;; the moved disk remains top -> clear
      (clear ?d)

      ;; advance the global stage pointer
      (not (at ?t))
      (at ?t2)
    )
  )

  ;; Move a single top disk onto another disk, enforcing size ordering, advancing stage.
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)     ;; disk is directly on the source support
      (clear ?d)        ;; disk has no disk on top (is top-of-stack)
      (clear ?to)       ;; destination disk has nothing on top (we place on it)
      (smaller ?d ?to)  ;; can only place a strictly smaller disk onto a larger disk
      (at ?t)           ;; current stage
      (next ?t ?t2)
      (not (on ?d ?to)) ;; forbid no-op moves to the same support
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination disk now has something on top -> not clear
      (not (clear ?to))
      ;; source support becomes clear
      (clear ?from)
      ;; moved disk remains top -> clear
      (clear ?d)

      ;; advance the global stage pointer
      (not (at ?t))
      (at ?t2)
    )
  )
)