(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object stage)

  (:predicates
    ;; disk is directly on some support object (either a peg or another disk)
    (on ?d - disk ?s - object)

    ;; support object (peg or disk) is clear (has no disk directly on it)
    (clear ?s - object)

    ;; size ordering between disks (static)
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete stage/time modeling
    (stage ?t - stage)
    (next ?t1 - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move a top disk from a support (?from) (peg or disk) to an empty peg (?to).
  ;; Consumes exactly one stage: requires the current stage and advances to its successor.
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)        ;; disk is directly on the source support
      (clear ?d)           ;; disk is top of its support
      (clear ?to)          ;; destination peg is empty (no direct disk)
      (stage ?s)
      (stage ?s2)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear/top facts: destination no longer clear, source becomes clear
      (not (clear ?to))
      (clear ?from)
      ;; moved disk remains clear (it is now top)
      (clear ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a support (?from) onto another disk (?target).
  ;; Only allowed if moved disk is strictly smaller than the target. Consumes one stage.
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?target - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)        ;; disk is directly on the source support
      (clear ?d)           ;; disk is top of its support
      (clear ?target)      ;; target disk is top (available to receive)
      (smaller ?d ?target) ;; size ordering: cannot place larger on smaller
      (stage ?s)
      (stage ?s2)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?target)

      ;; update clear/top facts
      (not (clear ?target))
      (clear ?from)
      ;; moved disk is top at destination
      (clear ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)