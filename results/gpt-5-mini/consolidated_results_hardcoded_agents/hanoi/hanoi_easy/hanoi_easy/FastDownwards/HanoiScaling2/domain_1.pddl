(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - place
    place
    step
  )

  (:predicates
    ;; disk ?d is directly on ?x (where ?x is either a peg or another disk) at step ?t
    (on ?d - disk ?x - place ?t - step)

    ;; nothing is directly on ?x at step ?t
    (clear ?x - place ?t - step)

    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; temporal successor relation between discrete stages
    (succ ?t1 - step ?t2 - step)

    ;; step ?t is not yet produced (ensures contiguous progression: each step is produced once)
    (free-step ?t - step)
  )

  ;; Move a top disk from a place (?from) to an empty peg (?to) between two successive steps
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?t1 - step ?t2 - step)
    :precondition (and
      (succ ?t1 ?t2)          ; must advance to the next explicit stage
      (on ?d ?from ?t1)       ; ?d is directly on ?from at stage ?t1
      (clear ?d ?t1)          ; ?d has nothing on it at stage ?t1 (is top)
      (clear ?to ?t1)         ; target peg is clear (top) at stage ?t1
      (free-step ?t2)         ; the next stage must be unused (ensures a single transition uses each step)
      (not (= ?from ?to))
    )
    :effect (and
      ;; mark t2 as now produced (no other action may produce facts for t2)
      (not (free-step ?t2))

      ;; state at t2 reflects the move:
      (on ?d ?to ?t2)         ; moved disk is on target at t2
      (clear ?from ?t2)       ; the former support becomes clear at t2
      (clear ?d ?t2)          ; moved disk has nothing on it at t2
      (not (clear ?to ?t2))   ; target is no longer clear at t2
    )
  )

  ;; Move a top disk onto another disk (only if moving disk is smaller than the target disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?target - disk ?t1 - step ?t2 - step)
    :precondition (and
      (succ ?t1 ?t2)
      (on ?d ?from ?t1)
      (clear ?d ?t1)
      (clear ?target ?t1)
      (smaller ?d ?target)    ; prevent placing larger on smaller
      (free-step ?t2)
      (not (= ?from ?target))
    )
    :effect (and
      (not (free-step ?t2))

      (on ?d ?target ?t2)
      (clear ?from ?t2)
      (clear ?d ?t2)
      (not (clear ?target ?t2))
    )
  )
)