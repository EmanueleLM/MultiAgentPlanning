(define (domain hanoi)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; a disk ?d is on object ?x (object may be a peg or a disk)
    (on ?d ?x)
    ;; nothing is on top of object ?x (object may be a peg or a disk)
    (clear ?x)
    ;; disk ?d1 is strictly smaller than disk ?d2
    (smaller ?d1 ?d2)
  )

  ;; Move a top disk onto an empty peg (or the top of an empty peg).
  (:action move-to-peg
    :parameters (?d ?under ?peg)
    :precondition (and
      (on ?d ?under)   ;; ?d is currently on ?under (peg or disk)
      (clear ?d)       ;; ?d is the top disk of its stack
      (clear ?peg)     ;; destination peg is empty on top (i.e. top position)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?peg)
      (clear ?under)   ;; the object that supported ?d becomes clear
      (not (clear ?peg)) ;; the peg now has ?d on top, so it's not clear
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the target disk).
  (:action move-to-disk
    :parameters (?d ?under ?target)
    :precondition (and
      (on ?d ?under)        ;; ?d is currently on ?under (peg or disk)
      (clear ?d)            ;; ?d is the top disk of its stack
      (clear ?target)       ;; target disk has nothing on top
      (smaller ?d ?target)  ;; size ordering: ?d is smaller than ?target
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?target)
      (clear ?under)        ;; the object that supported ?d becomes clear
      (not (clear ?target)) ;; target disk now has ?d on top
    )
  )
)