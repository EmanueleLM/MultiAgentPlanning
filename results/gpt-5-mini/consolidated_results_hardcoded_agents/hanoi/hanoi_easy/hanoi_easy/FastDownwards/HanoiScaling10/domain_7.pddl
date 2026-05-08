(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    (disk ?o - object)                 ; unary: object is a disk
    (peg ?o - object)                  ; unary: object is a peg
    (on ?d - object ?p - object)       ; d is directly on p (p is either a peg or a disk)
    (clear ?o - object)                ; nothing is on top of object o (peg or disk)
    (smaller ?d1 - object ?d2 - object); d1 is smaller than d2
    (stage ?s - step)                  ; current stage token
    (next ?s - step ?s2 - step)        ; s2 is the immediate successor of s
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - object ?from - object ?to - object ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
      (disk ?d)
      (peg ?to)
      (on ?d ?from)
      (clear ?d)    ; d is top of its stack
      (clear ?to)   ; destination peg is empty (clear)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)     ; the object that had the disk on top becomes clear
      (not (clear ?to)) ; destination is no longer clear
      (not (stage ?s))
      (stage ?s2)
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the target disk)
  (:action move-to-disk
    :parameters (?d - object ?from - object ?to - object ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
      (disk ?d)
      (disk ?to)
      (on ?d ?from)
      (clear ?d)      ; d is top of its stack
      (clear ?to)     ; target disk has nothing on top
      (smaller ?d ?to) ; d must be smaller than target
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)     ; the object that had the disk on top becomes clear
      (not (clear ?to)) ; target disk is no longer clear
      (not (stage ?s))
      (stage ?s2)
    )
  )
)