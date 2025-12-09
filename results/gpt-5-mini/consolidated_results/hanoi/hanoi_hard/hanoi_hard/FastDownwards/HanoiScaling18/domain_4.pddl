(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    disk peg - place
    stage - object
  )

  (:predicates
    ;; disk is directly on a place (peg or disk)
    (on ?d - disk ?p - place)
    ;; place (peg or disk) has nothing directly on it
    (clear ?p - place)
    ;; size ordering: ?d1 is strictly larger than ?d2 (static)
    (larger ?d1 - disk ?d2 - disk)
    ;; current stage pointer (exactly one stage-current holds at any time)
    (stage-current ?s - stage)
    ;; successor relation between stages (static)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk from a place (peg or disk) onto an empty peg,
  ;; advancing the global stage pointer by one successor.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)         ;; ?d is top
      (clear ?to)        ;; destination peg is empty on top
      (stage-current ?s)
      (next ?s ?s2)
      (not (= ?from ?to))
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

  ;; Move a top disk from a place (peg or disk) onto another disk,
  ;; only allowed when destination disk is strictly larger, and advance stage.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)         ;; ?d is top
      (clear ?to)        ;; destination disk has nothing on top (so ?d will be directly on ?to)
      (larger ?to ?d)    ;; cannot place larger on smaller
      (stage-current ?s)
      (next ?s ?s2)
      (not (= ?d ?to))
      (not (= ?from ?to))
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