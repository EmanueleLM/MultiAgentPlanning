(define (domain hanoi-4disks-3pegs)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    ;; disk is directly on a support (a support is either a peg or another disk)
    (on ?d - disk ?s - support)

    ;; a support (peg or disk) has nothing immediately on top of it
    (clear ?s - support)

    ;; size relation: smaller x y means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; explicit stage/time ordering to force contiguous single-step moves
    (current ?st - stage)
    (succ ?st1 - stage ?st2 - stage)

    ;; explicit distinctness predicate to forbid no-op moves (from == to)
    (different ?s1 - support ?s2 - support)
  )

  ;; Move a top disk from a support (?from) to an empty peg (?to).
  ;; Preconditions:
  ;;  - ?d is on ?from and is the topmost there (clear ?d)
  ;;  - ?to (peg) has nothing on top (clear ?to)
  ;;  - source and target are different supports
  ;;  - planning is at current stage ?st and action advances to successor ?st2
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?st - stage ?st2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (different ?from ?to)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      ;; change support of ?d
      (not (on ?d ?from))
      (on ?d ?to)

      ;; after removal, former support becomes clear
      (clear ?from)

      ;; target peg now has ?d on top, so not clear
      (not (clear ?to))

      ;; advance stage (enforce contiguous progression)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Move a top disk from a support (?from) onto another top disk (?to).
  ;; Preconditions:
  ;;  - ?d is on ?from and topmost there
  ;;  - ?to is a disk and topmost (clear ?to)
  ;;  - ?d is strictly smaller than ?to
  ;;  - source and target supports are different
  ;;  - planning is at current stage ?st and action advances to successor ?st2
  (:action move-disk-onto-disk
    :parameters (?d - disk ?from - support ?to - disk ?st - stage ?st2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (different ?from ?to)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      ;; change support of ?d
      (not (on ?d ?from))
      (on ?d ?to)

      ;; former support becomes clear after removal
      (clear ?from)

      ;; target disk now has ?d on top
      (not (clear ?to))

      ;; advance stage (enforce contiguous progression)
      (not (current ?st))
      (current ?st2)
    )
  )
)