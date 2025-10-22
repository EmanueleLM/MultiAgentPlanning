(define (domain hanoi)
  (:requirements :strips :typing)
  (:types entity disk peg)
  (:predicates
    (on ?d - disk ?x - entity)        ; disk ?d is directly on entity ?x (disk or peg)
    (clear ?x - entity)              ; no disk is directly on entity ?x
    (smaller ?d1 - disk ?d2 - disk)  ; disk ?d1 is smaller than disk ?d2
  )

  ;; Move a disk onto a peg (peg must be clear, disk must be clear, disk must currently be on some entity)
  (:action move-to-peg
    :parameters (?d - disk ?from - entity ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Move a disk onto another disk (destination disk must be larger than moving disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - entity ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )
)