(define (domain hanoi7_sequential)
  (:requirements :strips :typing)
  (:types place time)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk d is directly on place p (disk or peg)
    (clear ?p - place)               ; nothing is on place p (top of stack or empty peg)
    (smaller ?d - disk ?p - place)   ; disk d is smaller than place p (disk or peg)
    (succ ?t1 - time ?t2 - time)     ; temporal successor
    (now ?t - time)                  ; current timepoint
  )

  (:action move
    :parameters (?d - disk ?from - place ?to - place ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (on ?d ?from)      ; disk is on the from-place
      (clear ?d)         ; disk is top of its stack
      (clear ?to)        ; target place is currently clear (empty peg or top disk)
      (smaller ?d ?to)   ; moving disk is smaller than the target place (disk or peg)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)

      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)      ; the previous support becomes clear
      (not (clear ?to))  ; the target place is no longer clear
    )
  )
)