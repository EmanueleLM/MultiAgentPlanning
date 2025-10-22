(define (domain hanoi7instance8)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; disk ?d is on object ?x (object may be a peg or a disk)
    (on ?d ?x)
    ;; nothing is on top of object ?x (object may be a peg or a disk)
    (clear ?x)
    ;; disk ?d1 is strictly smaller than disk ?d2
    (smaller ?d1 ?d2)
  )

  ;; Move a top disk onto a peg (peg considered an object)
  (:action move-to-peg
    :parameters (?d ?from ?peg)
    :precondition (and
      (on ?d ?from)    ;; ?d is currently on ?from (peg or disk)
      (clear ?d)       ;; ?d is the top disk of its stack
      (clear ?peg)     ;; destination peg/top position free
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)     ;; the object that supported ?d becomes clear
      (not (clear ?peg)) ;; destination now has a disk on top
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the target disk).
  (:action move-to-disk
    :parameters (?d ?from ?target)
    :precondition (and
      (on ?d ?from)        ;; ?d is currently on ?from (peg or disk)
      (clear ?d)            ;; ?d is the top disk of its stack
      (clear ?target)       ;; target disk has nothing on top
      (smaller ?d ?target)  ;; size ordering: ?d is smaller than ?target
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)        ;; the object that supported ?d becomes clear
      (not (clear ?target)) ;; target disk now has ?d on top
    )
  )
)