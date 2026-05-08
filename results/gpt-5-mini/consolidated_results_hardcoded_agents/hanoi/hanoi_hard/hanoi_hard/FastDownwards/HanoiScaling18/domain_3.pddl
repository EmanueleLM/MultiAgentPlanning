(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    ;; disk D is directly on place P (P may be a peg or another disk)
    (on ?d - disk ?p - object)
    ;; nothing is directly on place P (peg or disk)
    (clear ?p - object)
    ;; size ordering: ?d1 is strictly larger than ?d2 (static)
    (larger ?d1 - disk ?d2 - disk)
    ;; current stage pointer (exactly one stage-current should hold at any time)
    (stage-current ?s - stage)
    ;; successor relation between stages (static)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk from any place (peg or disk) onto an empty peg,
  ;; advancing the global stage pointer by one successor.
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clear statuses
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      ;; advance stage pointer (enforces discrete, contiguous progression)
      (not (stage-current ?s))
      (stage-current ?s2)
    )
  )

  ;; Move a top disk from any place (peg or disk) onto another disk,
  ;; only allowed when destination disk is strictly larger, and advance stage.
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clear statuses
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      ;; advance stage pointer
      (not (stage-current ?s))
      (stage-current ?s2)
    )
  )
)