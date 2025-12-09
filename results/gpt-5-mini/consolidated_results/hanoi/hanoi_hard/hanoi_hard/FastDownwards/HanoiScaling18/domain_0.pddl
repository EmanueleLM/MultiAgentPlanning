(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg - object)
  (:predicates
    (on ?d - disk ?x - object)         ; disk ?d is directly on object ?x (peg or disk)
    (clear ?x - object)               ; nothing is directly on object ?x
    (larger ?d1 - disk ?d2 - disk)    ; ?d1 is strictly larger than ?d2 (static)
    (stage1)                          ; marker: first subgoal (A..E on right, F on left) achieved
    (stage2)                          ; marker: after F moved to middle while A..E on right
  )

  ;; Move a top disk onto an empty peg
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

  ;; Move a top disk onto a (larger) disk
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

  ;; Marker action: records that the first major subgoal has been reached:
  ;; right peg holds (top->bottom) A B C D E and left holds F.
  (:action mark-stage1
    :parameters ()
    :precondition (and
      (on A right)
      (on B A)
      (on C B)
      (on D C)
      (on E D)
      (on F left)
    )
    :effect (and
      (stage1)
    )
  )

  ;; Marker action: records that the largest disk F has been moved to middle
  ;; while A..E remain stacked on right. This action requires stage1 to have
  ;; been previously achieved, enforcing the required ordering of phases.
  (:action mark-stage2
    :parameters ()
    :precondition (and
      (stage1)
      (on F middle)
      (on A right)
      (on B A)
      (on C B)
      (on D C)
      (on E D)
    )
    :effect (and
      (stage2)
    )
  )
)