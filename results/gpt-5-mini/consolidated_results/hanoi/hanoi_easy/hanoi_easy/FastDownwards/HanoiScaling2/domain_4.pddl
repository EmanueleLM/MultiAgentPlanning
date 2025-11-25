(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    ;; object types
    (disk ?o - obj)
    (peg ?o - obj)

    ;; discrete stage/time modeling
    (stage ?s - obj)
    (next ?s1 - obj ?s2 - obj)
    (current ?s - obj)

    ;; disk ?d is directly on ?x (where ?x is either a peg or another disk)
    (on ?d - obj ?x - obj)

    ;; nothing is directly on ?x (applies to pegs and disks). For pegs this means the peg is empty.
    (clear ?x - obj)

    ;; size ordering: ?d1 is strictly smaller than ?d2 (only asserted for disk objects)
    (smaller ?d1 - obj ?d2 - obj)
  )

  ;; Move a top disk from a place (?from) (peg or disk) to an empty peg (?to)
  ;; This action consumes exactly one stage step: it requires the current stage ?s and advances to successor ?s2.
  (:action move-to-peg
    :parameters (?d - obj ?from - obj ?to - obj ?s - obj ?s2 - obj)
    :precondition (and
      (disk ?d)
      (peg ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (stage ?s)
      (stage ?s2)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear/top facts
      (not (clear ?to))   ;; destination peg no longer empty / destination disk no longer clear
      (clear ?from)       ;; source (peg or disk) becomes clear
      (clear ?d)          ;; moved disk is on top => clear

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a place (?from) onto another disk (?target)
  ;; Only allowed if moved disk is smaller than the target top disk.
  ;; Also consumes exactly one stage.
  (:action move-to-disk
    :parameters (?d - obj ?from - obj ?target - obj ?s - obj ?s2 - obj)
    :precondition (and
      (disk ?d)
      (disk ?target)
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
      (stage ?s)
      (stage ?s2)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?target)

      ;; update clear/top facts
      (not (clear ?target)) ;; target now has disk on it => not clear
      (clear ?from)         ;; source becomes clear
      (clear ?d)            ;; moved disk is top => clear

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)