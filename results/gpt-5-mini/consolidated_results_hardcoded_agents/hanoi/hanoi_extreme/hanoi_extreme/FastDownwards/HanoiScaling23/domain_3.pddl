(define (domain hanoi)
  (:requirements :typing :negative-preconditions :strips)
  (:types place step disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)           ; disk ?d is immediately on place ?p (disk or peg)
    (clear ?p - place)                 ; nothing on top of place ?p
    (smaller ?x - disk ?y - disk)      ; ?x is strictly smaller than ?y
    (succ ?t1 - step ?t2 - step)       ; immediate successor relation on discrete steps
    (current ?t - step)                ; current time/stage
  )

  ;; Move a top disk onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?t1 - step ?t2 - step)
    :precondition (and
      (current ?t1)
      (succ ?t1 ?t2)
      (on ?d ?from)         ; disk is on its support (disk or peg)
      (clear ?d)            ; disk is top (nothing on it)
      (clear ?to)           ; destination peg is empty on top
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))     ; destination no longer clear
      (clear ?from)         ; the support immediately below becomes clear (we removed the top disk)
      (not (current ?t1))
      (current ?t2)
    )
  )

  ;; Move a top disk onto another top disk (must be smaller).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?t1 - step ?t2 - step)
    :precondition (and
      (current ?t1)
      (succ ?t1 ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)           ; the target disk must be top
      (smaller ?d ?to)      ; cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))     ; target disk no longer clear
      (clear ?from)         ; support below the moved disk becomes clear
      (not (current ?t1))
      (current ?t2)
    )
  )
)