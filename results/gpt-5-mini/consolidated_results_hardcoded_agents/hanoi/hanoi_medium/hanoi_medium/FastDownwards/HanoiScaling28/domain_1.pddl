(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)        ; disk is directly on place (disk or peg)
    (clear ?p - place)               ; nothing on top of this place
    (smaller ?d1 - disk ?d2 - disk)  ; size ordering: d1 is smaller than d2
    (different ?p1 - place ?p2 - place) ; distinctness of places (to forbid no-op moves)

    (awaiting-operator ?s - step)
    (awaiting-auditor ?s - step)
    (awaiting-observer ?s - step)
    (step-next ?s1 - step ?s2 - step)
    (final-step ?s - step)
    (finished)
  )

  ;; Operator: move a top disk from any place onto an empty peg
  (:action operator-move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step)
    :precondition (and
      (awaiting-operator ?s)
      (on ?d ?from)
      (clear ?d)        ; disk is top
      (clear ?to)       ; destination peg is empty on top
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

  ;; Operator: move a top disk from any place onto another top disk (must be larger)
  (:action operator-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step)
    :precondition (and
      (awaiting-operator ?s)
      (on ?d ?from)
      (clear ?d)         ; disk is top
      (clear ?to)        ; target disk is top (so we place on it)
      (smaller ?d ?to)   ; legal: moving disk must be smaller than target disk
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

  ;; Auditor: must run after each operator move before observer
  (:action auditor-approve
    :parameters (?s - step)
    :precondition (and
      (awaiting-auditor ?s)
    )
    :effect (and
      (not (awaiting-auditor ?s))
      (awaiting-observer ?s)
    )
  )

  ;; Observer: record the step and advance to the next step (or finish)
  (:action observer-record-next
    :parameters (?s - step ?s2 - step)
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
    :parameters (?s - step)
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