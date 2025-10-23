(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - object)

  (:predicates
    ;; disk ?d is directly on object ?x (a disk or a peg)
    (on ?d - disk ?x - object)

    ;; ?d is the top disk on peg ?p
    (top ?p - peg ?d - disk)

    ;; peg ?p has no disks
    (empty ?p - peg)

    ;; size order: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
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
      ;; source loses top ?d and its new top becomes ?under
      (not (top ?from ?d))
      (top ?from ?under)

      ;; destination becomes non-empty and has ?d as top, ?d now on the peg
      (top ?to ?d)
      (not (empty ?to))
      (on ?d ?to)

      ;; remove the old on relation
      (not (on ?d ?under))
    )
  )

  ;; Move a top disk that is resting on another disk, onto the top disk of another peg.
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
      ;; source loses top ?d and its new top becomes ?under
      (not (top ?from ?d))
      (top ?from ?under)

      ;; destination top ?t is covered; new top is ?d
      (not (top ?to ?t))
      (top ?to ?d)
      (on ?d ?t)

      ;; remove old on relation
      (not (on ?d ?under))
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
      ;; source loses top ?d and becomes empty
      (not (top ?from ?d))
      (empty ?from)

      ;; destination becomes non-empty and top is ?d; update on relation
      (top ?to ?d)
      (not (empty ?to))
      (on ?d ?to)

      ;; remove old on relation that tied ?d to the source peg
      (not (on ?d ?from))
    )
  )

  ;; Move a top disk that is directly on its peg, onto the top disk of another peg.
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
      ;; source loses top ?d and becomes empty
      (not (top ?from ?d))
      (empty ?from)

      ;; destination top ?t is covered; new top is ?d
      (not (top ?to ?t))
      (top ?to ?d)
      (on ?d ?t)

      ;; remove old on relation that tied ?d to the source peg
      (not (on ?d ?from))
    )
  )
)