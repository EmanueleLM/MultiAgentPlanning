(define (domain hanoi_staged)
  :requirements :strips :typing :negative-preconditions
  :types disk peg base stage - object

  :predicates
    ;; direct-support: disk ?d is directly on object ?s (disk or base)
    (on ?d - disk ?s - object)
    ;; clear ?o means nothing is directly on object ?o (disk or base)
    (clear ?o - object)
    ;; ordering: ?d is strictly smaller than ?t (disk or base)
    (smaller ?d - disk ?t - object)
    ;; current-stage marker (exact sequencing)
    (current-stage ?st - stage)
    ;; successor relation between stages (static)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move the topmost disk ?d from support ?from to support ?to,
  ;; performing exactly one move per stage: requires current-stage ?st and advances to its successor ?nst.
  (:action move
    :parameters (?d - disk ?from - object ?to - object ?st - stage ?nst - stage)
    :precondition (and
      (on ?d ?from)        ;; ?d is directly on ?from
      (clear ?d)           ;; nothing on ?d (it is topmost)
      (clear ?to)          ;; destination top must be clear (place on top)
      (smaller ?d ?to)     ;; cannot place larger on smaller
      (current-stage ?st)  ;; enforce sequencing: action executed at current stage
      (succ ?st ?nst)      ;; require a defined successor stage
    )
    :effect (and
      ;; update supports
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear flags: destination no longer clear, source becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance stage marker to enforce exactly one move per stage
      (not (current-stage ?st))
      (current-stage ?nst)
    )
  )
)