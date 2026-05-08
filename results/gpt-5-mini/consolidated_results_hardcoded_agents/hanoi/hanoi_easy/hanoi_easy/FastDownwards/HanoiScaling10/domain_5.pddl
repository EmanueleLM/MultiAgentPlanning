(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)      ; disk d is directly on place p (peg or another disk)
    (clear ?p - place)            ; nothing is on top of place p (peg or disk)
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    (stage ?s - step)             ; current stage token
    (next ?s - step ?s2 - step)   ; s2 is the immediate successor stage of s
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)    ; d is top of its stack
      (clear ?to)   ; destination peg has nothing on top
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)     ; source place becomes clear after removing top disk
      (not (clear ?to)) ; destination peg is no longer clear
      (not (stage ?s))
      (stage ?s2)
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the target disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)      ; d is top of its stack
      (clear ?to)     ; target disk has nothing on top
      (smaller ?d ?to) ; cannot place a larger disk on a smaller one
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)     ; source becomes clear
      (not (clear ?to)) ; target disk is no longer clear (has d on top)
      (not (stage ?s))
      (stage ?s2)
    )
  )
)