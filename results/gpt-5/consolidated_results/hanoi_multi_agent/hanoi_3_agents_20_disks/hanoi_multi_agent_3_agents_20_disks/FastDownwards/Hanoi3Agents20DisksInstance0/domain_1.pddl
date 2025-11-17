(define (domain hanoi-3peg-20)
  (:requirements :strips :typing)
  (:types disk peg)
  (:predicates
    (on ?x - disk ?y - disk)            ; x directly on y
    (on-peg ?d - disk ?p - peg)         ; d directly on peg p
    (clear ?x - disk)                   ; no disk on x
    (top ?p - peg ?d - disk)            ; d is the topmost disk on peg p
    (empty ?p - peg)                    ; peg p has no disks
    (smaller ?x - disk ?y - disk)       ; x is smaller than y
    (diff ?p - peg ?q - peg)            ; pegs are different
  )

  ; Move top disk from a peg (only disk there) to an empty peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (diff ?p1 ?p2)
      (top ?p1 ?d)
      (on-peg ?d ?p1)
      (clear ?d)
      (empty ?p2)
    )
    :effect (and
      (not (on-peg ?d ?p1))
      (not (top ?p1 ?d))
      (empty ?p1)
      (not (empty ?p2))
      (top ?p2 ?d)
      (on-peg ?d ?p2)
      (clear ?d)
    )
  )

  ; Move top disk from a peg (only disk there) onto the top disk of another peg
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?p1 - peg ?p2 - peg ?d2 - disk)
    :precondition (and
      (diff ?p1 ?p2)
      (top ?p1 ?d)
      (on-peg ?d ?p1)
      (clear ?d)
      (top ?p2 ?d2)
      (clear ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on-peg ?d ?p1))
      (not (top ?p1 ?d))
      (empty ?p1)
      (not (empty ?p2))
      (not (top ?p2 ?d2))
      (on ?d ?d2)
      (top ?p2 ?d)
      (not (clear ?d2))
      (clear ?d)
    )
  )

  ; Move top disk (resting on another disk) to an empty peg
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?p1 - peg ?p2 - peg ?d1 - disk)
    :precondition (and
      (diff ?p1 ?p2)
      (top ?p1 ?d)
      (on ?d ?d1)
      (clear ?d)
      (empty ?p2)
    )
    :effect (and
      (not (on ?d ?d1))
      (clear ?d1)
      (not (top ?p1 ?d))
      (top ?p1 ?d1)
      (not (empty ?p2))
      (top ?p2 ?d)
      (on-peg ?d ?p2)
      (clear ?d)
    )
  )

  ; Move top disk (resting on another disk) onto the top disk of another peg
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?p1 - peg ?p2 - peg ?d1 - disk ?d2 - disk)
    :precondition (and
      (diff ?p1 ?p2)
      (top ?p1 ?d)
      (on ?d ?d1)
      (clear ?d)
      (top ?p2 ?d2)
      (clear ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?d1))
      (clear ?d1)
      (not (top ?p1 ?d))
      (top ?p1 ?d1)
      (not (top ?p2 ?d2))
      (on ?d ?d2)
      (top ?p2 ?d)
      (not (clear ?d2))
      (clear ?d)
    )
  )
)