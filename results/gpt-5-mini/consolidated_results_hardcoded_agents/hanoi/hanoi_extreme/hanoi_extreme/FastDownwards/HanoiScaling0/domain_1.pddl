(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; direct support relations
    (on-disk ?d - disk ?p - disk)
    (on-peg  ?d - disk ?p - peg)

    ;; clear flags for disks and pegs: true when there is no disk immediately on top
    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)

    ;; static size ordering: (smaller X Y) means disk X is strictly smaller than disk Y
    (smaller ?x - disk ?y - disk)

    ;; discrete stage control to enforce strict ordering of moves
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk from one disk onto another disk (disk->disk). Requires size ordering.
  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      ;; after removing ?d, its former support becomes clear
      (clear-disk ?from)
      ;; after placing ?d onto ?to, ?to is no longer clear
      (not (clear-disk ?to))
      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk from one disk onto a peg (disk->peg).
  (:action move-disk-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?ns - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk from a peg onto another disk (peg->disk). Requires size ordering.
  (:action move-disk-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk from a peg onto another peg (peg->peg).
  (:action move-disk-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?ns - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (not (current ?s))
      (current ?ns)
    )
  )
)