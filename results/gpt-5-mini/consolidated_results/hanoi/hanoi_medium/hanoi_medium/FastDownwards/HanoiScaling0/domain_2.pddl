(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    (on ?d - disk ?s - support)        ; disk ?d is directly supported by ?s (peg or disk)
    (clear ?s - support)              ; there is no disk directly on top of support ?s
    (smaller ?d1 - disk ?d2 - disk)   ; static size ordering: ?d1 is smaller than ?d2
    (stage ?t - stage)                ; stage identifiers
    (next ?t - stage ?t2 - stage)     ; successor relation between stages
    (current ?t - stage)              ; which stage is currently active
  )

  ;; Move a top disk onto an empty peg, advancing to the next stage.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)           ; disk is immediately on support ?from
      (clear ?d)              ; disk has nothing on top (is top)
      (clear ?to)             ; destination peg is empty (has no top disk)
      (current ?t)            ; current stage
      (next ?t ?t2)           ; next stage to advance to
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)           ; former support becomes clear (no disk directly on it)
      (not (clear ?to))       ; destination peg now has a disk on it
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk onto another top disk (must be larger than moved disk), advancing to the next stage.
  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)           ; disk is immediately on support ?from
      (clear ?d)              ; disk has nothing on top (is top)
      (clear ?tgt)            ; target disk is top (no disk on it)
      (smaller ?d ?tgt)       ; moved disk must be smaller than target disk
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?tgt)
      (clear ?from)
      (not (clear ?tgt))      ; target disk now has a disk on it
      (not (current ?t))
      (current ?t2)
    )
  )
)