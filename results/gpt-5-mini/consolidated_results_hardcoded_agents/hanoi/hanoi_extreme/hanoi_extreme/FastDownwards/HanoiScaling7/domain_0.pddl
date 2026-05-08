(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?d - disk ?p - peg)             ; disk ?d is on peg ?p
    (top ?d - disk ?p - peg)           ; disk ?d is currently the top of peg ?p (NONE sentinel indicates empty)
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2 (size ordering)
    (planned-move ?s - step ?d - disk ?from - peg ?to - peg) ; optional, not used by generic moves
    (step-ready ?s - step)
    (done ?s - step)
    (step-next ?s1 - step ?s2 - step)
  )

  ;; Generic legal move: move top disk from one peg to another when the top of destination is larger.
  ;; We model emptiness by using a designated 'none' disk object which is typed as disk and is larger than all real disks.
  (:action move
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?tprev - disk ?tnew - disk ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?d ?from)
      (top ?tprev ?to)
      (smaller ?d ?tprev)           ; disk d must be smaller than the current top of destination (tprev may be the NONE sentinel)
      (smaller ?d ?tprev)           ; repeated to emphasize legal placement; kept as single check for clarity
      (step-next ?s ?snext)
    )
    :effect (and
      (not (top ?d ?from))
      (not (top ?tprev ?to))
      (top ?tnew ?from)            ; new top on source peg after removing top; planner must supply correct ?tnew
      (top ?d ?to)
      (not (on ?d ?from))
      (on ?d ?to)
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  ;; Final-step move action (no successor)
  (:action move-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?tprev - disk ?tnew - disk)
    :precondition (and
      (step-ready ?s)
      (top ?d ?from)
      (top ?tprev ?to)
      (smaller ?d ?tprev)
    )
    :effect (and
      (not (top ?d ?from))
      (not (top ?tprev ?to))
      (top ?tnew ?from)
      (top ?d ?to)
      (not (on ?d ?from))
      (on ?d ?to)
      (done ?s)
      (not (step-ready ?s))
    )
  )
)