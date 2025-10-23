(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - object)
  (:predicates
    ; disk ?d is directly on object ?x (peg or disk)
    (on ?d - disk ?x - object)
    ; object ?x (peg or disk) has no disk on top of it
    (clear ?x - object)
    ; disk size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)        ; ?d is directly on ?from
      (clear ?d)           ; ?d has nothing on top (is top)
      (clear ?to)          ; destination peg is clear (empty)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)           ; remains clear on top after move
      (not (clear ?to))    ; peg ?to now has a disk on top
      (clear ?from)        ; the supporting object ?from becomes clear
    )
  )

  ;; Move a top disk onto another disk (only allowed if moved disk is smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)        ; ?d is directly on ?from
      (clear ?d)           ; ?d is top
      (clear ?to)          ; ?to is top (so we place onto it)
      (smaller ?d ?to)     ; cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)           ; moved disk is top, so clear
      (not (clear ?to))    ; the disk we placed onto is no longer clear
      (clear ?from)        ; the supporting object ?from becomes clear
    )
  )
)