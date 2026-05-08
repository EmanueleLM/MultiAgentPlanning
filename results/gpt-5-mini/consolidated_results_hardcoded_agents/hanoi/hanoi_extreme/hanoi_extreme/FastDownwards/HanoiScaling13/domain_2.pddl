(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - thing stage)

  (:predicates
    (on ?d - disk ?s - thing)      ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - thing)             ; support ?s has nothing directly on top of it
    (smaller ?d1 - disk ?d2 - disk); disk ?d1 is strictly smaller than disk ?d2
    (current ?st - stage)          ; the plan is currently at stage ?st
    (succ ?s - stage ?t - stage)   ; ?t is the immediate successor stage of ?s
  )

  ;; Move a top disk onto an empty peg, advancing exactly one stage.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - thing ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?t)
    )
  )

  ;; Move a top disk onto another top disk that is larger, advancing exactly one stage.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - thing ?dst - disk ?s - stage ?t - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
      (current ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (clear ?from)
      (not (clear ?dst))
      (not (current ?s))
      (current ?t)
    )
  )
)