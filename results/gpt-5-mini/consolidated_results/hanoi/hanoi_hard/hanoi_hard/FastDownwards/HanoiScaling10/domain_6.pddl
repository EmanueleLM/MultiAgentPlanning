(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    disk - place
    peg  - place
    stage
  )

  (:predicates
    ;; disk d is directly on place p (p is either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; place (peg or disk) has nothing on top of it
    (clear ?p - place)
    ;; d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; stage successor relation for discrete time progression
    (succ ?s1 - stage ?s2 - stage)
    ;; currently active stage
    (current ?s - stage)
  )

  ;; Move a top disk from any place (peg or disk) onto an empty peg
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)     ;; ?d is directly on ?from
      (clear ?d)        ;; ?d is the top disk (nothing above it)
      (clear ?to)       ;; destination peg has nothing on top
      (current ?s)      ;; must be at the current stage
      (succ ?s ?s2)     ;; next stage is the immediate successor
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after removing ?d, the supporting place becomes clear
      (clear ?from)
      ;; the destination peg now has something on top
      (not (clear ?to))
      ;; advance stage (ensures exactly one action per stage)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from any place onto another disk (must be smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)     ;; ?d is directly on ?from
      (clear ?d)        ;; ?d is the top disk
      (clear ?to)       ;; target disk has nothing on top
      (smaller ?d ?to)  ;; cannot place a larger disk onto a smaller disk
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after removal, the supporting place becomes clear
      (clear ?from)
      ;; target disk now has something on top
      (not (clear ?to))
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)