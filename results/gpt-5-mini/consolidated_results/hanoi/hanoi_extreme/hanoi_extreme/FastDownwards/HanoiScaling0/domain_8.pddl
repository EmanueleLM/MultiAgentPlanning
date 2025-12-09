(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk d is directly on top of disk p
    (on-disk ?d - disk ?p - disk)
    ;; disk d is directly on top of peg p
    (on-peg  ?d - disk ?p - peg)

    ;; no disk is on top of this disk (i.e., disk is the top of its stack)
    (clear-disk ?d - disk)
    ;; no disk is on top of this peg (i.e., peg is empty)
    (clear-peg  ?p - peg)

    ;; size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; discrete-time staging
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk that sits on a disk onto another disk
  (:action move-disk-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)       ;; ?d must be the top disk of its support
      (clear-disk ?to)      ;; destination disk must be top (nothing on it)
      (smaller ?d ?to)      ;; cannot place larger on smaller
      (current ?s)
      (succ ?s ?ns)
      (not (= ?from ?to))
    )
    :effect (and
      ;; update support
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; source disk becomes top (clear)
      (clear-disk ?from)
      ;; destination disk now has something on top (no longer clear)
      (not (clear-disk ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk that sits on a disk onto an empty peg
  (:action move-disk-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?ns - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)       ;; peg must be empty at top (i.e., empty)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; after removing ?d, ?from becomes clear
      (clear-disk ?from)

      ;; destination peg is no longer clear (now contains a disk)
      (not (clear-peg ?to))

      ;; moved disk remains clear (on top)
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk from a peg onto a disk
  (:action move-disk-peg-to-disk
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

      ;; source peg becomes empty (clear)
      (clear-peg ?from)
      ;; destination disk is no longer clear
      (not (clear-disk ?to))

      ;; moved disk remains clear
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk from a peg onto another empty peg
  (:action move-disk-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?ns - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (succ ?s ?ns)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes clear
      (clear-peg ?from)
      ;; destination peg no longer clear
      (not (clear-peg ?to))

      ;; moved disk remains clear
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )
)