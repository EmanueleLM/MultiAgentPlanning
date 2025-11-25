(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)               ; nothing is directly on place ?p (it is the top)
    (smaller ?d1 - disk ?d2 - disk)  ; static: ?d1 is strictly smaller than ?d2
    (current ?s - stage)             ; the planning token denoting the current stage
    (succ ?s1 - stage ?s2 - stage)   ; static successor relation between stages
  )

  ;; Move a top disk from any place onto an empty peg (advance stage)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on ?d ?from))
      (on ?d ?to)

      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a top disk from any place onto a larger disk (advance stage)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on ?d ?from))
      (on ?d ?to)

      (not (clear ?to))
      (clear ?from)
    )
  )
)