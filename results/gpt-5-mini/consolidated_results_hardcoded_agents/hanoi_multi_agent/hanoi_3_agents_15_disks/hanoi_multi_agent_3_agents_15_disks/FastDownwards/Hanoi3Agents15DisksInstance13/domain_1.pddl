(define (domain hanoi-multiagent)
  (:requirements :typing :negative-preconditions :strips)
  (:types agent disk peg)

  (:predicates
    (on-disk ?d - disk ?below - disk)    ; ?d is directly on top of ?below
    (on-peg  ?d - disk ?p - peg)         ; ?d is directly on peg ?p
    (top     ?p - peg ?d - disk)         ; top disk on peg ?p is ?d
    (empty   ?p - peg)                   ; peg ?p is empty
    (clear   ?d - disk)                  ; no disk is on top of ?d
    (smaller ?d1 - disk ?d2 - disk)      ; ?d1 is smaller than ?d2
    (can-move ?a - agent ?d - disk)      ; agent ?a is permitted to move disk ?d
  )

  ;; Move a disk that sits directly on another disk to an empty peg
  (:action move-agent-from-disk-to-empty
    :parameters (?a - agent ?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on-disk ?d ?below)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?to ?d)
      (not (top ?from ?d))
      (top ?from ?below)
      (clear ?below)
      (clear ?d)
    )
  )

  ;; Move a disk that sits directly on another disk to sit on another disk (larger)
  (:action move-agent-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?below - disk ?tgt - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on-disk ?d ?below)
      (top ?from ?d)
      (top ?to ?tgt)
      (smaller ?d ?tgt)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?tgt)
      (not (top ?from ?d))
      (top ?from ?below)
      (not (top ?to ?tgt))
      (top ?to ?d)
      (clear ?below)
      (not (clear ?tgt))
      (clear ?d)
    )
  )

  ;; Move a disk that sits directly on a peg (no disk below) to an empty peg
  (:action move-agent-from-peg-to-empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?to ?d)
      (not (top ?from ?d))
      (empty ?from)
      (clear ?d)
    )
  )

  ;; Move a disk that sits directly on a peg (no disk below) to sit on another disk (larger)
  (:action move-agent-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?tgt - disk ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (top ?from ?d)
      (top ?to ?tgt)
      (smaller ?d ?tgt)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)
      (not (top ?from ?d))
      (empty ?from)
      (not (top ?to ?tgt))
      (top ?to ?d)
      (not (clear ?tgt))
      (clear ?d)
    )
  )
)