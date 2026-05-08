(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg step
  )

  (:predicates
    ;; disk on either a peg or on top of another disk
    (on ?d - disk ?x - (either peg disk))
    ;; top-of-stack indicator: true if nothing is on top of ?x (peg or disk)
    (clear ?x - (either peg disk))
    ;; current stage marker
    (current ?t - step)
    ;; successor relation between stages
    (succ ?t1 - step ?t2 - step)
    ;; size ordering: true if ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg (peg must be clear).
  (:action move-to-peg
    :parameters (?d - disk ?from - (either peg disk) ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (succ ?s1 ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      ;; update disk support
      (not (on ?d ?from))
      (on ?d ?to)
      ;; target peg no longer clear; former support becomes clear
      (not (clear ?to))
      (clear ?from)
      ;; advance global stage
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another top disk (target disk must be clear and larger).
  (:action move-onto-disk
    :parameters (?d - disk ?from - (either peg disk) ?to - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (succ ?s1 ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; update disk support
      (not (on ?d ?from))
      (on ?d ?to)
      ;; target disk now has something on it; former support becomes clear
      (not (clear ?to))
      (clear ?from)
      ;; advance global stage
      (not (current ?s1))
      (current ?s2)
    )
  )
)