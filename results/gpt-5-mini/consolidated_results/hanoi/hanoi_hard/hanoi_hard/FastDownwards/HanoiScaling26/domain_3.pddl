(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; immediate "on" relation: disk is immediately on top of either a disk or a peg
    (on ?d - disk ?s - (either disk peg))
    ;; nothing is immediately on top of this support (disk or peg)
    (clear ?s - (either disk peg))
    ;; static size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; successor relation between discrete stages (static)
    (succ ?t1 - stage ?t2 - stage)
    ;; denotes the currently active stage (exactly one should hold in reachable states)
    (current ?t - stage)
  )

  ;; Move a top disk from any support (disk or peg) onto an empty peg, advancing exactly one stage.
  ;; Enforces single-disk move, top-of-peg/disk preconditions, and stage-to-stage progression.
  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)        ;; ?d is immediately on ?from
      (clear ?d)           ;; ?d has nothing on top (is topmost)
      (clear ?to)          ;; destination peg has nothing on top (empty top)
      (current ?t)         ;; we are at stage ?t
      (succ ?t ?t2)        ;; this action advances to the successor stage ?t2
      (not (= ?from ?to))  ;; require an actual change of support
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))    ;; destination is no longer clear (now has ?d on top)
      (clear ?from)        ;; previous support now has whatever was under ?d exposed
      (clear ?d)           ;; moved disk remains topmost (no disk on top)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from any support onto a top disk (stacking), advancing exactly one stage.
  ;; Enforces size ordering so a larger disk cannot be placed on a smaller one.
  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)           ;; ?d must be the top disk of its support
      (clear ?to)          ;; ?to must be the top disk of its support (so ?d lands directly on ?to)
      (smaller ?d ?to)     ;; cannot place larger on smaller
      (current ?t)
      (succ ?t ?t2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))    ;; ?to now has ?d on top, so it's not clear
      (clear ?from)        ;; previous support now has its top exposed
      (clear ?d)           ;; moved disk is topmost
      (not (current ?t))
      (current ?t2)
    )
  )
)