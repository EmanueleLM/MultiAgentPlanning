(define (domain hanoi-6disk)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    disk peg - object
  )
  (:predicates
    (on ?d1 - disk ?d2 - object) ; ?d2 can be a disk or a peg
    (clear ?x - object) ; ?x is clear (nothing on top)
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
  )
  (:functions
    (total-cost) - number
  )

  (:action move-disk
    :parameters (?d - disk ?f - object ?t - object)
    :precondition (and
      ; 1. ?d must be clear (topmost disk)
      (clear ?d)
      ; 2. ?d must be resting on ?f
      (on ?d ?f)
      ; 3. ?t must be clear (target location must be available)
      (clear ?t)
      ; 4. Safety rule: ?d must be smaller than ?t, unless ?t is a peg
      (or
        (peg ?t)
        (and (disk ?t) (smaller ?d ?t))
      )
    )
    :effect (and
      ; Move ?d
      (not (on ?d ?f))
      (on ?d ?t)

      ; Update clearance at source: ?f is now clear
      (clear ?f)

      ; Update clearance at target: ?t is no longer clear
      (not (clear ?t))

      (increase (total-cost) 1)
    )
  )
)