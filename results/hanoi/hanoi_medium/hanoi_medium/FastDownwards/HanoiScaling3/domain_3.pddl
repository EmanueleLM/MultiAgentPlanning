(define (domain hanoi_staged)
  :requirements :strips :negative-preconditions

  :predicates
    ;; disk is directly on a support (another disk or a peg)
    (on ?d ?s)
    ;; nothing is directly on this support (disk or peg)
    (clear ?s)
    ;; ?d is smaller than support ?s (disk or peg)
    (smaller ?d ?s)
    ;; marker for exact sequencing of moves
    (current-stage ?st)
    ;; static successor relation between stages
    (succ ?s1 ?s2)

  ;; Move one topmost disk from one support to another, executed at the current stage,
  ;; and advance the current-stage marker to its successor.
  (:action move
    :parameters (?d ?from ?to ?st ?nst)
    :precondition (and
      (on ?d ?from)            ;; ?d is directly on ?from
      (clear ?d)               ;; ?d has nothing on it (topmost)
      (clear ?to)              ;; destination top must be clear
      (smaller ?d ?to)         ;; cannot place larger disk onto smaller support
      (current-stage ?st)      ;; must be at the designated stage
      (succ ?st ?nst)          ;; there must be a successor stage to advance to
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear flags: destination now occupied, source becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance stage marker (enforces exactly one move per stage)
      (not (current-stage ?st))
      (current-stage ?nst)
    )
  )
)