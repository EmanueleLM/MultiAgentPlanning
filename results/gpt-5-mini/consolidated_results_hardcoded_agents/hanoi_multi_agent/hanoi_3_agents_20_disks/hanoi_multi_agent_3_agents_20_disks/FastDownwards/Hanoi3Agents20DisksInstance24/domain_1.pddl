(define (domain hanoi-3agents-20)
  (:requirements :typing :negative-preconditions)
  (:types agent disk peg)

  (:predicates
    (on ?d - disk ?x - (either disk peg))    ; disk ?d is immediately on entity ?x (disk or peg)
    (clear ?x - (either disk peg))           ; nothing is on top of entity ?x
    (can-move ?a - agent ?d - disk)          ; agent allowed to move disk
    (smaller ?d - disk ?x - (either disk peg)) ; ?d is smaller than ?x (x may be disk or peg)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - (either disk peg) ?to - (either disk peg))
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (can-move ?a ?d)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
             )
  )
)