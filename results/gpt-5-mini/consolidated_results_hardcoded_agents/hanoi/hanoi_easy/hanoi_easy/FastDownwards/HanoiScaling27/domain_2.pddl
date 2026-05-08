(define (domain hanoi-mover-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types place stage disk peg - place)

  (:predicates
    ;; disk is directly on a place (another disk or a peg)
    (on ?d - disk ?p - place)
    ;; nothing is on top of this place (a peg or a disk)
    (clear ?p - place)
    ;; static size ordering between disks
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage successor relation and current stage marker
    (succ ?s1 - stage ?s2 - stage)
    (now ?s - stage)
  )

  ;; Move a top disk onto an empty peg (peg must be empty), advancing the global stage by one successor.
  (:action mover-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)      ;; ?d must be top of its stack
      (clear ?to)     ;; destination peg must be empty
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination is no longer clear, source becomes clear, moved disk is top (clear)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      ;; advance the single global stage marker
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk onto another disk (destination disk must be top and larger), advancing stage.
  (:action mover-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)         ;; ?d must be top
      (clear ?to)        ;; destination disk must be top of its stack
      (smaller ?d ?to)   ;; cannot place larger disk on smaller
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clear/top facts
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      ;; advance the single global stage marker
      (not (now ?s))
      (now ?s2)
    )
  )
)