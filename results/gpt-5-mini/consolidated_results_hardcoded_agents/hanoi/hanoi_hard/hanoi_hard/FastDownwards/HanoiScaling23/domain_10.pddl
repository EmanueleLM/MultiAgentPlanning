(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  ;; disk and peg are subtypes of support; stage is a separate base type
  (:types disk peg - support stage)

  (:predicates
    (on ?d - disk ?s - support)        ; ?d is directly on support ?s (a disk or a peg)
    (clear ?s - support)              ; nothing directly on support ?s (top-of-stack)
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is strictly smaller than ?d2
    (current ?st - stage)             ; current stage marker
    (next ?st - stage ?st1 - stage)   ; successor relation between stages (discrete time)
    (different ?s1 - support ?s2 - support) ; explicit distinctness predicate for supports
  )

  ;; Move a top disk from any support onto an empty peg (advances the stage)
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?st - stage ?st1 - stage)
    :precondition (and
      (on ?d ?from)      ; disk is directly on the source support
      (clear ?d)         ; disk is top (nothing on it)
      (clear ?to)        ; destination peg top is empty
      (different ?from ?to) ; source and destination must be distinct supports
      (current ?st)
      (next ?st ?st1)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?st))
      (current ?st1)
    )
  )

  ;; Move a top disk from any support onto another top disk (destination disk must be larger) (advances stage)
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?st - stage ?st1 - stage)
    :precondition (and
      (on ?d ?from)      ; disk is directly on the source support
      (clear ?d)         ; disk is top (nothing on it)
      (clear ?to)        ; destination disk is top (nothing on it)
      (smaller ?d ?to)   ; moved disk must be strictly smaller than destination disk
      (different ?from ?to) ; source and destination must be distinct supports
      (current ?st)
      (next ?st ?st1)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?st))
      (current ?st1)
    )
  )
)