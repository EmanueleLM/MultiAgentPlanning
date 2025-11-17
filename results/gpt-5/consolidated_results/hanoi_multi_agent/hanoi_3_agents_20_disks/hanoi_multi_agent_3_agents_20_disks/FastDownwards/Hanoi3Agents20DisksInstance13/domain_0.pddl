(define (domain hanoi-3peg)
  (:requirements :strips :typing)

  (:types
    disk peg
  )

  (:predicates
    ; Placement relations
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk)

    ; Top/clear availability of supports
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)

    ; Strict size ordering: smaller(x,y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)
  )

  ; Agent move permissions (documentation):
  ; - Exactly one disk moves per action.
  ; - A disk may be moved only if it is clear (no disk on top of it).
  ; - A disk may be placed only onto a clear peg or a clear larger disk.
  ; - It is illegal to place a larger disk on a smaller one (enforced via (smaller ?d ?dest)).
  ; - No batching, no resource tokens, no penalties; constraints are hard and structural.

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      ; disk remains clear after being placed as the topmost item
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?dest - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?dest)
      (smaller ?d ?dest)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?dest)
      (clear-peg ?from)
      (not (clear-disk ?dest))
      ; disk ?d remains clear
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      ; disk ?d remains clear
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      ; disk ?d remains clear
    )
  )
)