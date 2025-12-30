(define (domain hanoi-6disk)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    disk peg - object
  )
  (:predicates
    (on ?d1 - disk ?d2 - object)
    (clear ?x - object)
    (smaller ?d1 - disk ?d2 - disk)
  )
  (:functions
    (total-cost) - number
  )

  (:action move-to-peg
    :parameters (?d - disk ?f - object ?p - peg)
    :precondition (and
      ; 1. ?d must be clear
      (clear ?d)
      ; 2. ?d must be resting on ?f
      (on ?d ?f)
      ; 3. Target peg ?p must be clear
      (clear ?p)
      ; 4. Safety rule: always allowed on a peg
    )
    :effect (and
      ; Move ?d
      (not (on ?d ?f))
      (on ?d ?p)

      ; Update clearance at source: ?f is now clear
      (clear ?f)

      ; Update clearance at target: ?p is no longer clear
      (not (clear ?p))

      (increase (total-cost) 1)
    )
  )
  
  (:action move-to-disk
    :parameters (?d1 - disk ?f - object ?d2 - disk)
    :precondition (and
      ; 1. ?d1 must be clear
      (clear ?d1)
      ; 2. ?d1 must be resting on ?f
      (on ?d1 ?f)
      ; 3. Target disk ?d2 must be clear
      (clear ?d2)
      ; 4. Safety rule: ?d1 must be smaller than ?d2
      (smaller ?d1 ?d2)
    )
    :effect (and
      ; Move ?d1
      (not (on ?d1 ?f))
      (on ?d1 ?d2)

      ; Update clearance at source: ?f is now clear
      (clear ?f)

      ; Update clearance at target: ?d2 is no longer clear
      (not (clear ?d2))

      (increase (total-cost) 1)
    )
  )
)