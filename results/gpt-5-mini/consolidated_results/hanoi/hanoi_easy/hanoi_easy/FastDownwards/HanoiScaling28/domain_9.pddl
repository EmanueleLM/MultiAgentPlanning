(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)            ; ?d is directly on support ?s (disk or peg)
    (clear ?s - support)                   ; nothing directly on support ?s (disk or peg)
    (smaller ?d1 - disk ?d2 - disk)        ; static size ordering: ?d1 is smaller than ?d2
    (current ?st - step)                   ; current stage/timepoint
    (next ?st - step ?st2 - step)          ; successor relation between stages
    (different ?x - support ?y - support)  ; explicit inequality between supports
  )

  ;; Move a top disk (?d) from any support (?from) onto an empty peg (?to).
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)            ; ?d must be the top disk on its support
      (clear ?to)           ; destination peg must be empty (no disk directly on it)
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)         ; source support becomes clear after removal of the top disk
      (not (clear ?to))     ; destination support now has a disk on it
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk (?d) from any support (?from) onto another disk (?to), respecting size ordering.
  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)            ; ?d must be the top disk on its support
      (clear ?to)           ; target disk must be clear (no disk on top)
      (smaller ?d ?to)      ; cannot place larger disk on smaller one
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)         ; source support becomes clear after removal
      (not (clear ?to))     ; target disk is no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )
)