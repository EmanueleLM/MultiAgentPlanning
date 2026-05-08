(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk ?d is directly on object ?x (either a peg or a disk)
    (on ?d - disk ?x - object)
    ;; nothing is directly on object ?x (peg or disk)
    (clear ?x - object)
    ;; static size relation: ?d1 is strictly larger than ?d2
    (larger ?d1 - disk ?d2 - disk)
    ;; ordered phase markers that must be achieved in sequence
    (stage1)
    (stage2)
  )

  ;; Move a top disk from any object (peg or disk) onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Move a top disk from any object (peg or disk) onto a larger disk.
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Explicit marker action for phase 1:
  ;; records that at some point the five smallest disks a..e are stacked on the right
  ;; (top->bottom a b c d e) while the largest disk f remained on the left.
  ;; This action is only applicable exactly when that configuration holds.
  (:action mark-stage1
    :parameters ()
    :precondition (and
      (on a right)
      (on b a)
      (on c b)
      (on d c)
      (on e d)
      (on f left)
    )
    :effect (and
      (stage1)
    )
  )

  ;; Explicit marker action for phase 2:
  ;; requires that stage1 has been recorded previously and that the largest disk f
  ;; has been moved to the middle peg while a..e remain stacked on the right.
  (:action mark-stage2
    :parameters ()
    :precondition (and
      (stage1)
      (on f middle)
      (on a right)
      (on b a)
      (on c b)
      (on d c)
      (on e d)
    )
    :effect (and
      (stage2)
    )
  )
)