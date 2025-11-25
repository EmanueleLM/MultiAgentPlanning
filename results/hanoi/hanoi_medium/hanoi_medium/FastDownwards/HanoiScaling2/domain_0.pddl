(define (domain hanoi-integrated)
  (:requirements :strips :typing)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)          ; disk ?d is directly on object ?x (disk or peg)
    (clear ?x - object)                ; place ?x (disk or peg) has no disk on top
    (ready)                            ; system is ready for the mover to perform a move
    (pending-observation)              ; a move has occurred and the observer must analyze
    (observed)                         ; observer has analyzed the current state
    (audited)                          ; auditor has completed the audit of the current state
    (smaller ?d1 - disk ?d2 - disk)    ; static size relation: ?d1 is smaller than ?d2
  )

  ; mover action: move a top disk onto an empty peg
  (:action mover-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (ready)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (ready))
      (pending-observation)
      (not (observed))
      (not (audited))
    )
  )

  ; mover action: move a top disk onto a top disk (only if moving disk is smaller than target)
  (:action mover-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (ready)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (ready))
      (pending-observation)
      (not (observed))
      (not (audited))
    )
  )

  ; observer action: analyze the state after a move
  (:action observer-analyze
    :parameters ()
    :precondition (and
      (pending-observation)
    )
    :effect (and
      (not (pending-observation))
      (observed)
      (not (audited))
    )
  )

  ; auditor action: perform audit after observation and re-enable mover
  (:action auditor-report
    :parameters ()
    :precondition (and
      (observed)
    )
    :effect (and
      (not (observed))
      (audited)
      (ready)
    )
  )
)