(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk d is immediately on top of disk p
    (on-disk ?d - disk ?p - disk)
    ;; disk d is immediately on peg p
    (on-peg  ?d - disk ?p - peg)
    ;; nothing on top of disk d
    (clear-disk ?d - disk)
    ;; peg p has no disk on top (peg top free)
    (clear-peg  ?p - peg)
    ;; static size ordering: x is smaller than y
    (smaller ?x - disk ?y - disk)
    ;; current stage/timepoint
    (current ?s - stage)
    ;; successor relation between stages
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a disk that is immediately on another disk onto another disk.
  (:action move-disk-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?ns)
      (not (= ?from ?to))
      (not (= ?d ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is immediately on another disk onto an empty peg.
  (:action move-disk-disk-to-peg
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
      (clear-disk ?d)
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is immediately on a peg onto another disk.
  (:action move-disk-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?ns)
      (not (= ?d ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is immediately on a peg onto an empty peg.
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
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
      (not (current ?s))
      (current ?ns)
    )
  )
)