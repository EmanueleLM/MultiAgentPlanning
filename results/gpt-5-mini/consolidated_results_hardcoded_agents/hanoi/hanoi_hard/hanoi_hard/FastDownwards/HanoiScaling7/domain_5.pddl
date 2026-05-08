(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg time)

  (:predicates
    ;; disk is directly on a place (the second argument may be a disk or a peg)
    (on ?d - disk ?p)
    ;; place (disk or peg) has no disk on top of it
    (clear ?p)
    ;; strict size ordering: larger ?big ?small means ?big is strictly larger than ?small
    (larger ?big - disk ?small - disk)
    ;; discrete time/stage predicates enforcing single-step progression
    (now ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  ;; Move a top disk from any place onto an empty peg (destination must be an empty peg)
  (:action move-to-peg
    :parameters (?d - disk ?from ?to - peg ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after removing ?d, the place it was on becomes clear
      (clear ?from)
      ;; the destination peg is no longer clear (a disk sits on it)
      (not (clear ?to))
      ;; advance time by one step
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Move a top disk from any place onto another disk (destination must be a disk,
  ;; must be clear (top) and strictly larger than the moved disk)
  (:action move-to-disk
    :parameters (?d - disk ?from ?to - disk ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after removing ?d, the place it was on becomes clear
      (clear ?from)
      ;; the disk that is now below is no longer clear
      (not (clear ?to))
      ;; advance time by one step
      (not (now ?t))
      (now ?t2)
    )
  )
)