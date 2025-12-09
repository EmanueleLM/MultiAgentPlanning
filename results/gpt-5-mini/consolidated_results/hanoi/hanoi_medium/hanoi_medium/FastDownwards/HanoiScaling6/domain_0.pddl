(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?x - place)        ; disk ?d is immediately on place ?x (disk or peg)
    (clear ?d - disk)               ; no disk is on top of disk ?d
    (empty ?p - peg)                ; peg ?p has no disks
    (smaller ?a - disk ?b - disk)   ; disk ?a is smaller than disk ?b
  )

  ; Move a top disk from a peg that currently has exactly that disk (it is on the peg and clear)
  ; onto an empty peg.
  (:action move-from-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (empty ?to))
      (empty ?from)
      ; target peg now has top disk ?d (so ?d remains clear)
      ; no change to clear of ?d (it stays true)
    )
  )

  ; Move a top disk that is currently immediately on a peg (thus that peg had exactly one disk)
  ; onto the top of another disk (the target disk must be clear and larger).
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?tgt - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (not (= ?d ?tgt))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?tgt)
      (empty ?from)
      (not (clear ?tgt))
      ; ?d remains clear as it becomes topmost
    )
  )

  ; Move a top disk from on top of another disk onto an empty peg.
  (:action move-from-disk-to-empty-peg
    :parameters (?d - disk ?under - disk ?to - peg)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (empty ?to)
      (not (= ?d ?under))
      (not (= ?under ?to)) ; trivial but explicit: under is a disk, to is a peg
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)      ; disk under becomes clear after removing ?d
      (not (empty ?to))
      ; ?d remains clear (topmost)
    )
  )

  ; Move a top disk from on top of another disk onto another disk (target must be clear and larger).
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?under - disk ?tgt - disk)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (not (= ?d ?under))
      (not (= ?d ?tgt))
      (not (= ?under ?tgt))
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?tgt)
      (clear ?under)
      (not (clear ?tgt))
      ; ?d remains clear
    )
  )
)