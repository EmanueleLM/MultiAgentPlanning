(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj step)

  (:predicates
    ;; typing predicates for objects
    (disk ?o - obj)
    (peg ?o - obj)

    ;; disk ?d is directly on ?x (where ?x is either a peg or another disk) at step ?t
    (on ?d - obj ?x - obj ?t - step)

    ;; nothing is directly on ?x at step ?t (applies to pegs and disks)
    (clear ?x - obj ?t - step)

    ;; size ordering: ?d1 is strictly smaller than ?d2 (only asserted for disk objects)
    (smaller ?d1 - obj ?d2 - obj)

    ;; temporal successor relation between discrete stages
    (succ ?t1 - step ?t2 - step)

    ;; produced marks that stage as produced/realized (initially only s0 is produced)
    (produced ?t - step)
  )

  ;; Move a top disk from a place (?from) to an empty peg (?to) between two successive steps
  (:action move-to-peg
    :parameters (?d - obj ?from - obj ?to - obj ?t1 - step ?t2 - step)
    :precondition (and
      (disk ?d)
      (peg ?to)
      (succ ?t1 ?t2)
      (on ?d ?from ?t1)
      (clear ?d ?t1)
      (clear ?to ?t1)
      (not (produced ?t2))
    )
    :effect (and
      ;; produce the next stage
      (produced ?t2)

      ;; state at t2 reflects the move:
      (on ?d ?to ?t2)
      (clear ?from ?t2)
      (clear ?d ?t2)
      (not (clear ?to ?t2))
    )
  )

  ;; Move a top disk onto another disk (only if moving disk is smaller than the target disk)
  (:action move-to-disk
    :parameters (?d - obj ?from - obj ?target - obj ?t1 - step ?t2 - step)
    :precondition (and
      (disk ?d)
      (disk ?target)
      (succ ?t1 ?t2)
      (on ?d ?from ?t1)
      (clear ?d ?t1)
      (clear ?target ?t1)
      (smaller ?d ?target)
      (not (produced ?t2))
    )
    :effect (and
      (produced ?t2)

      (on ?d ?target ?t2)
      (clear ?from ?t2)
      (clear ?d ?t2)
      (not (clear ?target ?t2))
    )
  )
)