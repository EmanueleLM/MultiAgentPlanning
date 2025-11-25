(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage place)
  ;; peg and disk are both places where a disk may be supported
  (:predicates
    (on ?d - disk ?p - place)            ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)                 ; no disk directly on place ?p (i.e., top)
    (smaller ?d1 - disk ?d2 - disk)    ; ?d1 is smaller than ?d2 (static)
    (stage ?t - stage)                 ; stage identifiers
    (next ?t - stage ?t2 - stage)      ; successor relation between stages
    (current ?t - stage)               ; which stage is currently active
  )

  ;; Move a top disk onto an empty peg at the current stage, advancing to the next stage.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)            ; disk is immediately supported by from
      (clear ?d)               ; disk is top on its support
      (clear ?peg)             ; destination peg has no top disk (empty peg)
      (current ?t)             ; we are at stage ?t
      (next ?t ?t2)            ; ?t2 is the successor stage
    )
    :effect (and
      (not (on ?d ?from))      ; remove old support
      (on ?d ?peg)             ; place disk on destination peg
      (clear ?from)            ; previous support becomes clear (no disk above it)
      (not (clear ?peg))       ; peg is no longer clear (it now has ?d on it)
      (not (current ?t))       ; advance stage
      (current ?t2)
    )
  )

  ;; Move a top disk onto another top disk at the current stage, advancing to the next stage.
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)            ; disk is immediately supported by from
      (clear ?d)               ; disk is top on its support
      (clear ?tgt)             ; destination disk must be top (no disk on it)
      (smaller ?d ?tgt)        ; moved disk must be smaller than destination disk
      (current ?t)             ; we are at stage ?t
      (next ?t ?t2)            ; ?t2 is the successor stage
    )
    :effect (and
      (not (on ?d ?from))      ; remove old support
      (on ?d ?tgt)             ; place disk on destination disk
      (clear ?from)            ; previous support becomes clear
      (not (clear ?tgt))       ; destination disk is no longer clear (has ?d on it)
      (not (current ?t))       ; advance stage
      (current ?t2)
    )
  )
)