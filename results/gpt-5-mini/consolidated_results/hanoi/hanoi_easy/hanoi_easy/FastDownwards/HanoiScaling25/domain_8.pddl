(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)

  ;; types: disk and peg are subtypes of support; stage models discrete time steps
  (:types support stage disk peg - support)

  (:predicates
    ;; disk d is directly supported by support s (s is either a disk or a peg)
    (on ?d - disk ?s - support)
    ;; support s has nothing on top of it (true for an empty peg or a disk that currently has no disk on it)
    (clear ?s - support)
    ;; explicit discrete-time bookkeeping: current stage and successor relation
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
    ;; ordering relation: smaller d1 than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg (consumes one stage step).
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)       ;; ?d is directly on ?from
      (clear ?d)          ;; ?d is the top disk on its support
      (clear ?to)         ;; target peg is empty (placing onto peg only when peg top is clear)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear flags:
      ;; target peg is no longer clear (it now has ?d on it)
      (not (clear ?to))
      ;; the support we removed ?d from becomes clear (nothing on it now)
      (clear ?from)
      ;; the moved disk is top at its new location
      (clear ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk onto another top disk (must be smaller than the target disk).
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)        ;; ?d is on ?from
      (clear ?d)           ;; ?d is the top disk on its support
      (clear ?to)          ;; target disk is top on its support
      (smaller ?d ?to)     ;; disk-size ordering: moved disk must be smaller than target disk
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear flags:
      ;; target disk now has something on it
      (not (clear ?to))
      ;; the support we removed ?d from becomes clear
      (clear ?from)
      ;; the moved disk is top at its new location
      (clear ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )
)