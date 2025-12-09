(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg support)
  ; Note: disks and pegs are treated as supports; we use the "support" type for the second argument of on/clear.
  ; The auditor required explicit in_stack_on, on, and clear as primitive predicates and explicit actions
  ; that take the immediate-support parameter ?s. The mover's original single branching action is replaced
  ; by the explicit, non-branching mover actions below. Action names are prefixed with "mover_" to keep
  ; the original agent origin visible.

  (:predicates
    (on ?d - disk ?s - support)                ; immediate support: disk ?d is directly on support ?s (disk or peg)
    (clear ?s - support)                      ; nothing is directly on ?s (for disk: no disk on it; for peg: peg empty)
    (in_stack_on ?d - disk ?p - peg)          ; disk ?d belongs to stack on peg ?p (primitive peg-membership)
    (smaller_than ?a - disk ?b - disk)        ; static size ordering: ?a is smaller than ?b
    (available)                               ; mutex flag to require sequential (non-concurrent) moves
  )

  ; -------------------------------------------------------------------------
  ; Actions derived from the auditor's corrected specification.
  ; Each action is deterministic, includes the immediate support parameter ?s,
  ; and updates on(...) and in_stack_on(...) and clear(...) explicitly.
  ; There are four variants to avoid conditional effects:
  ;  - mover_move_from_peg_to_empty    : ?s is a peg, destination peg is empty (clear(?to))
  ;  - mover_move_from_disk_to_empty   : ?s is a disk, destination peg is empty (clear(?to))
  ;  - mover_move_from_peg_to_disk     : ?s is a peg, destination top is disk ?d2
  ;  - mover_move_from_disk_to_disk    : ?s is a disk, destination top is disk ?d2
  ; These preserve the invariant that exactly one on(?d,?) holds per disk: each action deletes
  ; the single on(?d,?s) and adds exactly one new on(?d, ...).
  ; -------------------------------------------------------------------------

  ; Move a top disk ?d whose immediate support is a peg ?s (so ?d was the only disk on ?from),
  ; onto an empty destination peg ?to (clear ?to).
  (:action mover_move_from_peg_to_empty
    :parameters (?d - disk ?s - peg ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (in_stack_on ?d ?from)
      (not (= ?from ?to))
      (clear ?to)            ; destination peg empty
      (available)
      (= ?s ?from)           ; causal link: immediate support ?s is the source peg
    )
    :effect (and
      (not (on ?d ?s))       ; remove unique immediate support
      (on ?d ?to)            ; place directly on destination peg
      (not (in_stack_on ?d ?from))
      (in_stack_on ?d ?to)   ; update peg-membership
      (clear ?s)             ; previous support (peg) becomes clear (peg empty)
      (not (clear ?to))      ; destination peg is no longer empty
      ; available used to ensure sequential execution (delete+add in same action)
      (not (available))
      (available)
    )
  )

  ; Move a top disk ?d whose immediate support is another disk ?s, onto an empty peg ?to.
  (:action mover_move_from_disk_to_empty
    :parameters (?d - disk ?s - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (in_stack_on ?d ?from)
      (not (= ?from ?to))
      (clear ?to)            ; destination peg empty
      (available)
      (in_stack_on ?s ?from) ; causal link: immediate-support disk ?s belongs to same source peg
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?to)
      (not (in_stack_on ?d ?from))
      (in_stack_on ?d ?to)
      (clear ?s)             ; the disk that used to support ?d becomes clear (now top on its peg)
      (not (clear ?to))      ; destination peg is no longer empty
      (not (available))
      (available)
    )
  )

  ; Move a top disk ?d whose immediate support is a peg ?s (so ?d was only disk on ?from),
  ; onto a top disk ?d2 on destination peg ?to. Requires size ordering smaller_than(?d, ?d2).
  (:action mover_move_from_peg_to_disk
    :parameters (?d - disk ?s - peg ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (in_stack_on ?d ?from)
      (not (= ?from ?to))
      (clear ?d2)            ; ?d2 must be top on ?to
      (in_stack_on ?d2 ?to)
      (smaller_than ?d ?d2)  ; size ordering invariant
      (available)
      (= ?s ?from)           ; causal: immediate support is the source peg
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?d2)
      (not (in_stack_on ?d ?from))
      (in_stack_on ?d ?to)
      (clear ?s)             ; source peg becomes clear (empty)
      (not (clear ?d2))      ; destination top disk is no longer clear (d sits on it)
      (not (available))
      (available)
    )
  )

  ; Move a top disk ?d whose immediate support is a disk ?s, onto a top disk ?d2 on destination peg ?to.
  ; Requires ?s to belong to the source peg and ?d2 to be top on ?to, and size ordering.
  (:action mover_move_from_disk_to_disk
    :parameters (?d - disk ?s - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (in_stack_on ?d ?from)
      (not (= ?from ?to))
      (clear ?d2)
      (in_stack_on ?d2 ?to)
      (smaller_than ?d ?d2)
      (available)
      (in_stack_on ?s ?from) ; causal link: immediate-support disk ?s must be in same source peg
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?d2)
      (not (in_stack_on ?d ?from))
      (in_stack_on ?d ?to)
      (clear ?s)             ; previous support disk becomes clear
      (not (clear ?d2))      ; destination top disk is no longer clear
      (not (available))
      (available)
    )
  )

)