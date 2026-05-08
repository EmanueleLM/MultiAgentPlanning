(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types support stage disk peg - support)

  (:predicates
    (on ?d - disk ?s - support)        ; disk ?d is immediately on support ?s (disk or peg)
    (clear ?s - support)              ; nothing is immediately on support ?s
    (smaller ?d1 - disk ?d2 - disk)   ; static size ordering: ?d1 is strictly smaller than ?d2
    (succ ?t1 - stage ?t2 - stage)    ; successor relation between stages (static)
    (current ?t - stage)              ; the current active stage
  )

  ;; Move a top disk from any support onto an empty peg, advancing one stage
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)          ; ?d must have no disk on top
      (clear ?to)         ; destination peg must be clear (empty top)
      (current ?t)
      (succ ?t ?t2)
      (not (= ?from ?to))
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
      (clear ?d)          ; ?d must have no disk on top
      (clear ?to)         ; destination disk must have no disk on top
      (smaller ?d ?to)    ; cannot place larger on smaller
      (current ?t)
      (succ ?t ?t2)
      (not (= ?from ?to))
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