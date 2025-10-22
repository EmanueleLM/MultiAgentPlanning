(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk d is directly on place p (place = peg or disk)
    (on ?d - disk ?p - place)
    ;; place (peg or disk) has nothing on top of it
    (clear ?p - place)
    ;; size ordering: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - place ?peg - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)       ;; only top disk can be moved
      (clear ?peg)     ;; peg must be empty to use this action
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)    ;; the place ?from becomes clear after removing ?d
      (not (clear ?peg)) ;; peg is no longer clear after placing ?d
    )
  )

  ;; Move a top disk onto another disk (stacking). Size constraint enforced.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?target - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)          ;; only top disk can be moved
      (clear ?target)     ;; the target disk must be top (clear)
      (smaller ?d ?target) ;; cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)        ;; the place ?from becomes clear after removal
      (not (clear ?target)) ;; target is no longer clear after placing ?d
    )
  )
)