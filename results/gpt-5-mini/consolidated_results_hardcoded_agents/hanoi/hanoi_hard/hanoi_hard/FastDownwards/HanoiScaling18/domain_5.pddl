(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    disk peg - place
    stage - object
  )

  (:predicates
    ;; a disk is directly on a place (a peg or another disk)
    (on ?d - disk ?p - place)
    ;; a place (peg or disk) has nothing directly on it
    (clear ?p - place)
    ;; static size ordering: ?d1 is strictly larger than ?d2
    (larger ?d1 - disk ?d2 - disk)
    ;; current stage pointer (exactly one stage-current holds at any time by construction)
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
      (clear ?to)        ;; destination peg has nothing on top (top-of-peg)
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clear statuses
      (not (clear ?to))  ;; ?to now has something on top
      (clear ?from)      ;; the place from which ?d was moved becomes clear on top
      (clear ?d)         ;; moved disk has nothing on top
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
      (clear ?to)        ;; destination disk is top (no disk on it)
      (larger ?to ?d)    ;; destination disk is strictly larger than moving disk
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clear statuses
      (not (clear ?to))  ;; destination disk now has something on top
      (clear ?from)      ;; source place becomes clear on top
      (clear ?d)         ;; moved disk has nothing on top
      ;; advance stage pointer
      (not (stage-current ?s))
      (stage-current ?s2)
    )
  )
)