(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    ;; on ?d ?s : disk ?d is immediately on support ?s (support = disk or peg)
    (on ?d - disk ?s - support)
    ;; clear ?s : support ?s has nothing immediately on top of it
    (clear ?s - support)
    ;; larger ?x ?y : disk ?x is strictly larger than disk ?y (static)
    (larger ?x - disk ?y - disk)
    ;; current discrete stage token and successor relation for ordered stages
    (cur-step ?t - step)
    (succ ?t - step ?t2 - step)
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
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)
      ;; target support is no longer clear; source becomes clear
      (not (clear ?to))
      (clear ?from)
      ;; advance the global stage token (enforces contiguous progression)
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
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)
      ;; target disk no longer clear; source becomes clear
      (not (clear ?to))
      (clear ?from)
      ;; advance the global stage token
      (not (cur-step ?t))
      (cur-step ?t2)
    )
  )
)