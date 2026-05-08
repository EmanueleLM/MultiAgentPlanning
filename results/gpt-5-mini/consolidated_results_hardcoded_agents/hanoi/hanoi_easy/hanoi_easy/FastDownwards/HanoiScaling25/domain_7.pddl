(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  ;; disk and peg are both kinds of support
  (:types disk peg - support stage)

  (:predicates
    ;; disk d is directly supported by support s (s is either a disk or a peg)
    (on ?d - disk ?s - support)
    ;; support s has nothing on top of it (true for an empty peg or a disk that currently has no disk on it)
    (clear ?s - support)
    ;; stage/time bookkeeping (explicit discrete time)
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
    ;; ordering relation: smaller d1 than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Two concrete move actions to avoid disjunctions:
  ;;  - move-to-peg: move a top disk onto an empty peg
  ;;  - move-to-disk: move a top disk onto a top disk that is larger
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)       ;; ?d is on ?from
      (clear ?d)          ;; ?d is the top disk on its support
      (clear ?to)         ;; target peg is empty (must place on peg only when peg is empty)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear flags:
      ;; after placing, the target peg is no longer clear
      (not (clear ?to))
      ;; the support we removed ?d from becomes clear (nothing on it now)
      (clear ?from)
      ;; the moved disk is top at its new location
      (clear ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)        ;; ?d is on ?from
      (clear ?d)           ;; ?d is top on its support
      (clear ?to)          ;; target disk is top on its support
      (smaller ?d ?to)     ;; cannot place larger on smaller: moved disk must be smaller than target disk
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
      (not (current ?s))
      (current ?s2)
    )
  )
)