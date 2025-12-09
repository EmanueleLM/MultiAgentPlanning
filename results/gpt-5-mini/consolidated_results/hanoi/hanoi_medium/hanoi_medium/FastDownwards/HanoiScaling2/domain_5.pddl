(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types object disk peg stage)

  (:predicates
    (on ?d - disk ?x - object)        ; disk d is directly on object x (disk or peg)
    (clear ?x - object)              ; top of object x (disk or peg) is free
    (smaller ?d1 - disk ?d2 - disk)  ; d1 is smaller than d2
    (succ ?s - stage ?s2 - stage)    ; s2 is the direct successor of stage s
    (current ?s - stage)             ; current stage/timepoint
  )

  ;; Move a clear disk from any support (disk or peg) onto an empty peg.
  (:action mover-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ; after removing the top disk, the former support becomes clear
      (not (clear ?to))    ; destination peg is no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a clear disk from any support (disk or peg) onto a larger clear disk.
  (:action mover-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)     ; enforce no larger-on-smaller: d must be smaller than destination disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ; former support becomes clear
      (not (clear ?to))    ; destination disk is no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )
)