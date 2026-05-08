(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)            ; disk ?d is immediately on support ?s (support = disk or peg)
    (clear ?s - support)                   ; support ?s has nothing immediately on top of it
    (larger ?x - disk ?y - disk)           ; disk ?x is strictly larger than disk ?y (static)
    (cur-step ?t - step)                   ; current discrete stage token
    (succ ?t - step ?t2 - step)            ; successor relation for ordered stages
  )

  ;; Move a top disk onto an empty peg, advancing the global current step to the immediate successor.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - step ?t2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (cur-step ?t)
      (succ ?t ?t2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (cur-step ?t))
      (cur-step ?t2)
    )
  )

  ;; Move a top disk onto a top disk that is strictly larger, advancing the global current step.
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?t - step ?t2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (cur-step ?t)
      (succ ?t ?t2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (cur-step ?t))
      (cur-step ?t2)
    )
  )
)