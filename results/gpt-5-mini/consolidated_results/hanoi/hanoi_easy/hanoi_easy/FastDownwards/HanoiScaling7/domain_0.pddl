(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - loc step)
  (:predicates
    ;; direct placement: disk is directly on a loc (peg or disk)
    (on ?d - disk ?l - loc)
    ;; top/free marker: no disk directly on this loc
    (clear ?l - loc)
    ;; size order: first disk smaller than second disk
    (smaller ?d1 ?d2 - disk)
    ;; linear step control: which step is current and successor relation
    (current-step ?s - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; Primitive mover actions (source: mover_agent)
  ;; Move a disk onto a peg (peg destination)
  (:action mover_move_to_peg
    :parameters (?d - disk ?from - loc ?p - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on ?d ?from)           ;; disk is directly on the stated source location
      (clear ?d)              ;; disk has nothing on top (is top)
      (clear ?p)              ;; destination peg has no disk directly on it
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      ;; after moving, the moved disk has nothing on top
      (clear ?d)
      ;; destination peg is no longer clear (now has ?d directly on it)
      (not (clear ?p))
      ;; the source location (disk or peg) no longer has ?d on it, so becomes clear
      (clear ?from)
      ;; advance the explicit step counter
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a disk onto another disk (disk destination) - enforces size constraint
  (:action mover_move_to_disk
    :parameters (?d - disk ?from - loc ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on ?d ?from)           ;; disk is directly on the stated source location
      (clear ?d)              ;; disk has nothing on top (is top)
      (clear ?to)             ;; destination disk has nothing on top (is top)
      (smaller ?d ?to)        ;; size constraint: moving disk must be smaller than target disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
      (not (current-step ?s))
      (current-step ?snext)
    )
  )
)