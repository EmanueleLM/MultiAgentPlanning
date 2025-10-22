(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - object)

  (:predicates
    (on ?d - disk ?x - object)        ; disk ?d is directly on object ?x (disk or peg)
    (top ?p - peg ?d - disk)         ; ?d is the top disk of peg ?p
    (empty ?p - peg)                 ; peg ?p is empty (no disks)
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is smaller than ?d2
  )

  ;; Move a top disk that is resting on another disk, onto an empty destination peg.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?from ?d)
      (on ?d ?under)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (empty ?to))
      (on ?d ?to)
      (not (on ?d ?under))
      (top ?from ?under)
    )
  )

  ;; Move a top disk that is resting on another disk, onto the top disk of another peg (destination not empty).
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (on ?d ?under)
      (top ?to ?t)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      (not (top ?from ?d))
      (not (top ?to ?t))
      (top ?to ?d)
      (on ?d ?t)
      (not (on ?d ?under))
      (top ?from ?under)
    )
  )

  ;; Move a top disk that is directly on its peg, onto an empty destination peg.
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?from ?d)
      (on ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (empty ?to))
      (on ?d ?to)
      (not (on ?d ?from))
      (empty ?from)
    )
  )

  ;; Move a top disk that is directly on its peg, onto the top disk of another peg (destination not empty).
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (on ?d ?from)
      (top ?to ?t)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      (not (top ?from ?d))
      (not (top ?to ?t))
      (top ?to ?d)
      (on ?d ?t)
      (not (on ?d ?from))
      (empty ?from)
    )
  )
)