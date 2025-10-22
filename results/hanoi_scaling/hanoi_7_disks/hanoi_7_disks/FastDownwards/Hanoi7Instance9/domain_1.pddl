(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk ?d is directly on place ?p (a peg or another disk)
    (on ?d - disk ?p - (either peg disk))
    ;; a place (peg or disk) has nothing directly on it
    (clear ?p - (either peg disk))
    ;; static size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg (peg must be empty/top clear)
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - (either peg disk) ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                  )
    :effect (and
              ;; remove the disk from its current support and place it on the peg
              (not (on ?d ?from))
              (on ?d ?to)

              ;; destination peg is no longer empty/top-clear
              (not (clear ?to))

              ;; the disk remains clear (it is top)
              (clear ?d)

              ;; the place ?from may become clear only if nothing remains on it;
              ;; we conservatively set it clear here because in this model "on" denotes the direct support relation
              ;; and we only ever keep the correct direct-support facts updated by the planner's moves.
              (clear ?from)
            )
  )

  ;; Move a top disk onto another disk (only allowed if the moving disk is smaller)
  (:action move-onto-disk
    :parameters (?d - disk ?from - (either peg disk) ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)

              ;; the disk we place onto is no longer clear (it has a disk on top)
              (not (clear ?to))

              ;; the disk we moved is top and therefore clear
              (clear ?d)

              ;; the support from which the disk was removed may become clear;
              ;; as above, we mark it clear because "on" facts represent direct supports
              (clear ?from)
            )
  )
)