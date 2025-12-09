(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support
          support
          stage)

  (:predicates
    (on ?d - disk ?s - support)    ; disk ?d is immediately on support ?s (disk or peg)
    (clear ?s - support)          ; there is no disk on top of support ?s
    (smaller ?d1 - disk ?d2 - disk) ; static size ordering: ?d1 is strictly smaller than ?d2
    (succ ?t1 - stage ?t2 - stage) ; successor relation between stages (static)
    (current ?t - stage)          ; the current active stage
  )

  ;; Move a top disk from any support onto an empty peg, advancing one stage
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from any support onto a smaller disk, advancing one stage
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (current ?t))
      (current ?t2)
    )
  )
)