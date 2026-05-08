(define (domain hanoi-multiagent)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; Tower state
    (on ?disk ?place)              ;; disk is directly on place (place is disk or peg)
    (clear ?place)                 ;; no disk directly on place
    (smaller ?d1 ?d2)              ;; d1 is smaller than d2 (legal stacking order)

    ;; Step sequencing and phases
    (awaiting-operator ?s)
    (awaiting-auditor ?s)
    (awaiting-observer ?s)
    (step-next ?s1 ?s2)
    (final-step ?s)
    (finished)

    ;; Utility to forbid no-op moves (we explicitly assert distinctness facts in the problem)
    (different ?x ?y)
  )

  ;; Operator actions: two variants to avoid existential/OR in preconditions
  (:action operator-move-to-empty
    :parameters (?d ?from ?to ?s)
    :precondition (and
      (awaiting-operator ?s)
      (on ?d ?from)
      (clear ?d)           ;; disk must be top
      (clear ?to)          ;; destination must be empty (peg or top disk place)
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; the container we removed from becomes clear (it had ?d as its top)
      (clear ?from)
      ;; destination is no longer clear (it now has ?d on top)
      (not (clear ?to))
      ;; move consumed the operator phase and yields to auditor for same step
      (not (awaiting-operator ?s))
      (awaiting-auditor ?s)
    )
  )

  (:action operator-move-to-disk
    :parameters (?d ?from ?to ?s)
    :precondition (and
      (awaiting-operator ?s)
      (on ?d ?from)
      (clear ?d)            ;; disk must be top
      (clear ?to)           ;; target disk must be top (so we place on it)
      (smaller ?d ?to)      ;; legal: moving disk must be smaller than target disk
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (awaiting-operator ?s))
      (awaiting-auditor ?s)
    )
  )

  ;; Auditor actions: must run after each operator move before observer can record.
  ;; Auditor approves (legal moves are enforced as hard constraints by operator preconditions).
  (:action auditor-approve
    :parameters (?s)
    :precondition (and
      (awaiting-auditor ?s)
    )
    :effect (and
      (not (awaiting-auditor ?s))
      (awaiting-observer ?s)
    )
  )

  ;; Observer actions: record the step and advance to next step (or finish if final).
  (:action observer-record-next
    :parameters (?s ?s2)
    :precondition (and
      (awaiting-observer ?s)
      (step-next ?s ?s2)
    )
    :effect (and
      (not (awaiting-observer ?s))
      (awaiting-operator ?s2)
    )
  )

  (:action observer-record-final
    :parameters (?s)
    :precondition (and
      (awaiting-observer ?s)
      (final-step ?s)
    )
    :effect (and
      (not (awaiting-observer ?s))
      (finished)
    )
  )
)