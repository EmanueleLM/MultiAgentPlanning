(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    ;; disk is located on a place (a place is either a peg or a disk)
    (on ?d - disk ?p - place)

    ;; place has nothing on top of it (for a peg: peg empty; for a disk: no disk on top)
    (clear ?p - place)

    ;; static size relation: ?x is larger than ?y
    (larger ?x - disk ?y - disk)

    ;; discrete global stage bookkeeping
    (current-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk ?d from any place ?from onto an empty peg ?to.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)           ; ?d must have nothing on top (top disk)
      (clear ?to)          ; target peg must be clear (empty)
      (not (on ?d ?to))    ; avoid no-op (ensures ?from != ?to)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; move the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear flags: freed the former place, occupied the target
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a top disk ?d from any place ?from onto a disk ?to (which must be larger).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)            ; ?d must have nothing on top (top disk)
      (clear ?to)           ; target disk must have nothing on top (so ?d will be placed on it)
      (larger ?to ?d)       ; cannot place larger on smaller
      (not (on ?d ?to))     ; avoid no-op (ensures ?from != ?to)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; move the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear flags: freed the former place, occupied the target disk
      (clear ?from)
      (not (clear ?to))
    )
  )
)