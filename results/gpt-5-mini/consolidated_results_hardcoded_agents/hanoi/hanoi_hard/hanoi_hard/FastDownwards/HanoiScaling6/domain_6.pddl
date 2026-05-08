(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)

  ;; types: place is supertype for disks and pegs; stage enumerates discrete time steps
  (:types place stage disk peg - place)

  (:predicates
    ;; disk directly on a place (peg or disk)
    (on ?d - disk ?p - place)

    ;; top-clear: there is nothing on top of ?p (peg or disk)
    (clear ?p - place)

    ;; explicit discrete stage control (single action per stage)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)

    ;; static size ordering: true if ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Actions originating from the mover agent (kept identifiable by name prefix)
  ;; Move a top disk from any place onto an empty peg, advancing the global stage.
  (:action mover-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on ?d ?from)
      (clear ?d)

      ;; destination peg must be empty (top-clear)
      (clear ?to)
    )
    :effect (and
      ;; update disk placement
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear/top facts
      (not (clear ?to))   ;; peg now has a top
      (clear ?from)       ;; former support (peg or disk) is now top-clear
      (clear ?d)          ;; moved disk is top-most

      ;; advance the discrete global stage (enforce single action per stage)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from any place onto a (larger) top disk, advancing the global stage.
  (:action mover-move-onto-disk
    :parameters (?d - disk ?from - place ?target - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on ?d ?from)
      (clear ?d)

      ;; target disk must be top and larger than the moved disk
      (clear ?target)
      (smaller ?d ?target)
    )
    :effect (and
      ;; update disk placement
      (not (on ?d ?from))
      (on ?d ?target)

      ;; update clear/top facts
      (not (clear ?target)) ;; target disk no longer top-clear
      (clear ?from)         ;; former support (peg or disk) is now top-clear
      (clear ?d)            ;; moved disk is now top-most

      ;; advance the discrete global stage (enforce single action per stage)
      (not (current ?s))
      (current ?s2)
    )
  )
)