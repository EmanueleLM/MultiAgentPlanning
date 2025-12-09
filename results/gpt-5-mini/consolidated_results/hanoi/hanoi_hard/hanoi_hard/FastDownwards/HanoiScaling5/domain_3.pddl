(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)           ; disk ?d is immediately on peg ?p
    (on-disk ?d - disk ?d2 - disk)        ; disk ?d is immediately on disk ?d2
    (clear-disk ?d - disk)                ; disk ?d has nothing immediately on top of it
    (clear-peg ?p - peg)                  ; peg ?p has nothing immediately on top of it (empty peg)
    (larger ?x - disk ?y - disk)          ; disk ?x is strictly larger than disk ?y (static)
    (cur-step ?t - step)                  ; current discrete stage token
    (succ ?t - step ?t2 - step)           ; successor relation for ordered stages
  )

  ;; Move a top disk that is currently on a peg to another empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - step ?t2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (cur-step ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (not (cur-step ?t))
      (cur-step ?t2)
    )
  )

  ;; Move a top disk that is currently on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - step ?t2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (cur-step ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
      (not (cur-step ?t))
      (cur-step ?t2)
    )
  )

  ;; Move a top disk that is currently on a peg onto another disk (must be strictly larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - step ?t2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
      (cur-step ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
      (not (cur-step ?t))
      (cur-step ?t2)
    )
  )

  ;; Move a top disk that is currently on another disk onto another disk (must be strictly larger).
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - step ?t2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
      (cur-step ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
      (not (cur-step ?t))
      (cur-step ?t2)
    )
  )
)