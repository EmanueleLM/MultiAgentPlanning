(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    (on ?d - disk ?p - place)            ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)                  ; nothing is on top of place ?p
    (larger ?x - disk ?y - disk)        ; ?x is larger than ?y
    (current-stage ?s - stage)          ; current discrete stage
    (succ ?s1 - stage ?s2 - stage)      ; successor relation between stages
  )

  ;; Move a top disk ?d from its supporting place ?from onto an empty peg ?to,
  ;; advancing the global stage from ?s to its successor ?s2.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)         ; ?d is directly on ?from (the supporting place)
      (clear ?d)            ; ?d has nothing on top (top disk)
      (clear ?to)           ; target peg must be empty (top-of-peg clear)
      (not (on ?d ?to))     ; disallow no-op (prevents trivial from==to case)
    )
    :effect (and
      ;; advance stage (strict one-way progression)
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; the supporting place ?from becomes clear (no disk on top after removal)
      (clear ?from)

      ;; the target peg is no longer clear (now has ?d on it)
      (not (clear ?to))
    )
  )

  ;; Move a top disk ?d from its supporting place ?from onto another disk ?to,
  ;; which must be larger and currently clear (i.e., top disk), advancing stage.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)           ; must put on top of a disk that currently has nothing on it
      (larger ?to ?d)       ; cannot place larger on smaller
      (not (on ?d ?to))
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; the supporting place ?from becomes clear
      (clear ?from)

      ;; the target disk ?to is no longer clear (now has ?d on it)
      (not (clear ?to))
    )
  )
)