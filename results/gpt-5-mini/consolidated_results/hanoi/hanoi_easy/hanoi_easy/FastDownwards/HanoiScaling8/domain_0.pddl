(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types: disk and peg are both places (supports for disks)
  (:types disk peg - place)

  (:predicates
    ;; disk on a place (either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; no disk directly on top of this place (either a peg or a disk)
    (clear ?p - place)
    ;; size ordering: (smaller x y) means disk x is strictly smaller than disk y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a top disk onto a peg (peg must be clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?peg)
      ;; peg now has disk on top -> not clear
      (not (clear ?peg))
      ;; the place it came from becomes clear (no disk on top)
      (clear ?from)
      ;; moved disk remains clear (it is topmost)
      (clear ?d)
    )
  )

  ;; Move a top disk onto another disk (target disk must be clear and larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; target disk now has disk on top -> not clear
      (not (clear ?to))
      ;; the place it came from becomes clear
      (clear ?from)
      ;; moved disk remains clear (it is topmost)
      (clear ?d)
    )
  )
)