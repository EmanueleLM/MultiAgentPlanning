(define (domain tower-of-hanoi-staged)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; stage progression
    (next ?s1 ?s2)
    (at-stage ?s)

    ;; stacking relations: ?d is a disk; ?x is either a peg name or a disk name (untyped domain)
    (on ?d ?x)
    (clear ?x)            ;; true if no disk sits on top of ?x (applies to pegs and disks)
    (smaller ?d1 ?d2)     ;; size ordering: ?d1 is strictly smaller than ?d2
  )

  ;; Move a top disk onto an empty peg or empty disk (generic move that does not require explicit type)
  (:action move-to-empty
    :parameters (?d ?from ?to ?s ?snext)
    :precondition (and
      (at-stage ?s)
      (next ?s ?snext)
      (on ?d ?from)    ;; disk ?d is immediately on ?from
      (clear ?d)       ;; ?d is the top disk of its stack
      (clear ?to)      ;; destination top must be clear (peg empty or disk with no disk on it)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )

  ;; Move a top disk onto another disk, enforcing size ordering (destination must be larger)
  (:action move-onto-disk
    :parameters (?d ?from ?to ?s ?snext)
    :precondition (and
      (at-stage ?s)
      (next ?s ?snext)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)  ;; only allow placing on a strictly larger disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )
)